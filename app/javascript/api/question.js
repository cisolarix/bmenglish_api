import axios from 'axios'

export default {
  fetchList() {
    return axios.get('http://localhost:3000/questions.json')
  },
  updateQuestion(data) {
    let id = data.question.id
    if (id) {
      return axios.put(`http://localhost:3000/questions/${id}.json`, data)
    } else {
      return axios.post(`http://localhost:3000/questions.json`, data)
    }
  }
}
