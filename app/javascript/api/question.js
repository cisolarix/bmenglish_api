import axios from 'axios'

const BASE_URL = gon.base_url

export default {
  fetchList(page) {
    return axios.get(`${BASE_URL}/questions.json?page=${page}`)
  },
  updateQuestion(data) {
    let id = data.question.id
    if (id) {
      return axios.put(`${BASE_URL}/questions/${id}.json`, data)
    } else {
      return axios.post(`${BASE_URL}/questions.json`, data)
    }
  },
  deleteQuestion(id) {
    return axios.delete(`${BASE_URL}/questions/${id}.json`)
  }
}
