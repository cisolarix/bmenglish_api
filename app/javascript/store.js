import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import api from './api/question'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    questions: [],
    currentQuestion: null,
  },
  mutations: {
    fetchedList(state, payload) {
      state.questions = payload.questions
    },
    selectQuestion(state, payload) {
      console.log(payload)
      state.currentQuestion = payload.currentQuestion
    },
    setQuestion(state, value) {
      state.currentQuestion = value
    }
  },
  actions: {
    updateQuestion(context, payload) {
      console.log('updated question')
      console.log(payload)
      api.updateQuestion(payload)
         .then(response => {
           console.log(response.data)
           context.dispatch('fetchList')
           // context.commit('fetchedList', { questions: response.data })
         })
         .catch(error => { console.log(error) })
    },
    fetchList(context) {
      api.fetchList()
        .then(response => {
          console.log(response.data)
          context.commit('fetchedList', { questions: response.data })
        })
        .catch(error => { console.log(error) })
    }
  }
})
