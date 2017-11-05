<template>
  <div>
    <table>
      <tr><th>题干</th></tr>

      <tr v-for="(q, index) in questions">
        <td>
          <p @click="clicked(index)">{{ q.title }}</p>
        </td>
      </tr>
    </table>

    <question-form v-if="currentQuestion"></question-form>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import QuestionForm from './QuestionForm.vue'

export default {
  computed: {
    ...mapState(['questions', 'currentQuestion'])
  },
  methods: {
    clicked(index) {
      this.$store.commit('selectQuestion', { currentQuestion: this.questions[index] })
    }
  },
  components: {
    QuestionForm
  },
  created() {
    this.$store.dispatch('fetchList')
  }
}
</script>
