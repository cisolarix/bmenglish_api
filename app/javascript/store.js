import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import api from './api/question'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    questions: [],
    total: 0,
    currentPage: 1,
    currentQuestion: null,
  },
  mutations: {
    fetchedList(state, payload) {
      state.questions = payload.questions
      state.total = payload.total
      state.currentPage = payload.current_page
    },
    selectQuestion(state, payload) {
      state.currentQuestion = payload.currentQuestion
    },
    setQuestion(state, value) {
      state.currentQuestion = value
    },
    canceledQuestion(state) {
      state.currentQuestion = null
    }
  },
  actions: {
    updateQuestion(context, payload) {
      api.updateQuestion(payload)
         .then(response => {
           context.dispatch('fetchList')
         })
         .catch(error => { console.log(error) })
    },
    fetchList(context, payload) {
      let currentPage = (payload && payload.page) || 1
      api.fetchList(currentPage)
        .then(response => {
          context.commit('fetchedList', response.data)
        })
        .catch(error => { console.log(error) })
    }
  }
})
