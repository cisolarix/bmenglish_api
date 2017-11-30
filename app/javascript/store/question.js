import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import api from '../api/question'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    questions: ['foo', 'bar'],
    totalPages: 0,
    currentPage: 1,
    currentQuestion: null,
    chapters: [],
    showModal: false,
    modalTitle: ''
  },
  mutations: {
    fetchedList(state, payload) {
      state.questions = payload.questions
      state.totalPages = payload.total_pages
      state.currentPage = payload.current_page
      state.chapters = payload.chapters
    },
    editQuestion(state, payload) {
      state.currentQuestion = payload.question
      state.modalTitle = '编辑题目'
      state.showModal = true
    },
    newQuestion(state, payload) {
      state.currentQuestion = {
        id: null,
        title: '',
        chapter_ids: [],
        options: [
          { id: null, content: '', correct: false },
          { id: null, content: '', correct: false },
          { id: null, content: '', correct: false },
          { id: null, content: '', correct: false }
        ]
      }
      state.modalTitle = '新建题目'
      state.showModal = true
    },
    canceledQuestion(state) {
      state.showModal = false
    }
  },
  actions: {
    updateQuestion(context, payload) {
      api.updateQuestion(payload)
         .then(response => {
           context.dispatch('fetchList')
           context.state.showModal = false
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
    },
    deleteQuestion(context, payload) {
      api.deleteQuestion(payload.id)
         .then(response => {
           context.dispatch('fetchList')
         })
         .catch(error => { console.log(error) })
    }
  }
})
