import axios from 'axios'

export default {
  fetchList(page) {
    return axios.get(`http://localhost:3000/questions.json?page=${page}`)
  },
  updateQuestion(data) {
    let id = data.question.id
    if (id) {
      return axios.put(`http://localhost:3000/questions/${id}.json`, data)
    } else {
      return axios.post(`http://localhost:3000/questions.json`, data)
    }
  },
  deleteQuestion(id) {
    return axios.delete(`http://localhost:3000/questions/${id}.json`)
  }
}
