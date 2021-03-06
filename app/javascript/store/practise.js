import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import api from '../api/practise'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    questions: [],
    questionsLength: 0,
    optionPrefixes: ['A', 'B', 'C', 'D'],
    choices: [],
    finished: [],
    showModal: false,
    result: {
      score: 0,
      total: 0,
      correct: 0
    }
  },
  mutations: {
    fetchedList(state, payload) {
      state.questions = payload.questions
      state.choices = new Array(payload.questions.length)
      state.questionsLength = payload.questions.length
    },
    checkedOption(state, payload) {
      let { questionIndex, questionId, optionId} = payload
      if (state.choices[questionIndex] == undefined) {
        state.choices.splice(questionIndex, 0, { questionId, optionId: new Set([optionId]) })
      } else {
        state.choices[questionIndex].optionId.add(optionId)
      }

      if (!state.finished.includes(questionIndex)) {
        state.finished.push(questionIndex)
      }
    },
    uncheckedOption(state, payload) {
      let { questionIndex, questionId, optionId} = payload
      if (state.choices[questionIndex] != undefined) {
        state.choices[questionIndex].optionId.delete(optionId)
        if (state.choices[questionIndex].optionId.size == 0) {
          let index = state.choices.indexOf(questionIndex)
          state.finished = state.finished.filter( e => e !== questionIndex)
        }
      }
    },
    submitedPractice(state, payload) {
      state.showModal = true
      state.result = payload.result
    },
    reload(state, payload) {
      window.location.reload(true);
    },
    closeModal(state, payload) {
      state.showModal = false
    }
    // showAnswer(state, payload) {
    //   let url = `${gon.base_url}/workbooks/${gon.params.workbook_id}/lessons/${gon.params.id}/practices/${state.result.id}/answers`
    //   window.location.replace(url)
    // }
  },
  actions: {
    fetchList(context, payload) {
      api.fetchList(gon.params.workbook_id, gon.params.id)
        .then(response => {
          context.commit('fetchedList', response.data)
        })
        .catch(error => { console.log(error) })
    },
    submitPractice(context, payload) {
      let choices = context.state.choices.map( c => {
        return {
          optionId: Array.from(c.optionId),
          questionId: c.questionId
        }
      })
      api.submitPractice(choices, gon.params.workbook_id, gon.params.id)
        .then(response => {
          context.commit('submitedPractice', response.data)
        })
        .catch(error => { console.log(error) })
    }
  }
})
