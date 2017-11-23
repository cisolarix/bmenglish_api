import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import api from '../api/practise'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    questions: [],
    questionsLength: 0,
    currentUser: null,
    optionPrefixes: ['A', 'B', 'C', 'D'],
    choices: [],
    finished: []
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
    }
    // selectQuestion(state, payload) {
    //   state.currentQuestion = payload.currentQuestion
    // },
    // setQuestion(state, value) {
    //   state.currentQuestion = value
    // },
    // canceledQuestion(state) {
    //   state.currentQuestion = null
    // }
  },
  actions: {
    // updateQuestion(context, payload) {
    //   api.updateQuestion(payload)
    //      .then(response => {
    //        context.dispatch('fetchList')
    //      })
    //      .catch(error => { console.log(error) })
    // },
    fetchList(context, payload) {
      api.fetchList()
        .then(response => {
          context.commit('fetchedList', response.data)
        })
        .catch(error => { console.log(error) })
    },
    // deleteQuestion(context, payload) {
    //   api.deleteQuestion(payload.id)
    //      .then(response => {
    //        context.dispatch('fetchList')
    //      })
    //      .catch(error => { console.log(error) })
    // }
  }
})
