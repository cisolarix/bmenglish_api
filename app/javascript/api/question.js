import axios from 'axios'

export default {
  fetchList() {
    return axios.get('http://localhost:3000/questions.json')
  },
  updateQuestion(data) {
    console.log('-------------------')
    console.log(data.question.id)
    console.log('-------------------')
    let id = data.question.id
    if (id) {
      // update
      let url = `http://localhost:3000/questions/${id}.json`
      console.log(url)
      return axios.put(`http://localhost:3000/questions/${id}.json`, data)
    } else {
      // create
      return axios.post(`http://localhost:3000/questions.json`, data)
    }
  }
}
