<template>
  <div class="questions-admin">
    <navbar></navbar>

    <div class="container">
      <question-list v-if="questions.length > 0"></question-list>
      <placeholder-empty v-else></placeholder-empty>
    </div>

    <question-form></question-form>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import QuestionForm from './questions/Form.vue'
import Navbar from './questions/Navbar.vue'
import QuestionList from './questions/List.vue'
import PlaceholderEmpty from './questions/PlaceholderEmpty.vue'

export default {
  data() {
    return { current_user: null }
  },
  computed: {
    ...mapState(['questions']),
    currentQuestion: {
      get () { return this.$store.state.currentQuestion },
      set (value) { this.$store.commit('setQuestion', value) }
    }
  },
  components: {
    QuestionForm,
    Navbar,
    QuestionList,
    PlaceholderEmpty
  },
  created() {
    this.$store.dispatch('fetchList')
    this.current_user = gon.current_user
  }
}
</script>
