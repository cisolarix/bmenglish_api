import axios from 'axios'

const BASE_URL = 'http://localhost:3000'

export default {
  fetchList() {
    return axios.get(`${BASE_URL}/workbooks/1/lessons/3/practise.json`)
  }
}
