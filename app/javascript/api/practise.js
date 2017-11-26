import axios from 'axios'

const BASE_URL = 'http://106.15.88.13'

export default {
  fetchList(workbook_id, lesson_id) {
    return axios.get(`${BASE_URL}/workbooks/${workbook_id}/lessons/${lesson_id}/practice.json`)
  },
  submitPractice(choices, workbook_id, lesson_id) {
    return axios.post(`${BASE_URL}/workbooks/${workbook_id}/lessons/${lesson_id}/submit_practice.json`, {
      choices
    })
  }
}
