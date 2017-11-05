import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import question from './api/question'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    questions: [],
    currentQuestion: null
  },
  mutations: {
    fetchList(state, payload) {
      state.questions = payload.questions
    },
    selectQuestion(state, payload) {
      state.currentQuestion = payload.currentQuestion
    }
  },
  actions: {
    createQuestion(context, payload) {
      console.log('store createQuestion')
      console.log(payload)
    },
    fetchList({ commit }) {
      question.fetchList()
        .then(response => {
          commit('fetchList', { questions: response.data })
        })
        .catch(error => {})
    }
  }
})
