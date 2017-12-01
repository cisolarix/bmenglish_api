import axios from 'axios'

const BASE_URL = gon.base_url

export default {
  fetchList(page) {
    return axios.get(`/questions.json?page=${page}`)
  },
  updateQuestion(data) {
    let id = data.question.id
    if (id) {
      return axios.put(`/questions/${id}.json`, data)
    } else {
      return axios.post(`/questions.json`, data)
    }
  },
  deleteQuestion(id) {
    return axios.delete(`/questions/${id}.json`)
  }
}
