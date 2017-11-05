import axios from 'axios'

export default {
  fetchList() {
    return axios.get('http://localhost:3000/questions.json')
  }
}
