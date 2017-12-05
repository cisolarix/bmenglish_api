<template lang="html">
  <div class="columns questions-admin-list">
    <div class="column col-12">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>题目</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(question, index) in questions">
            <td v-html="sanitized(question.title)"></td>
            <td class='question-actions'>
              <a class='edit-question-action action' @click.prevent='editQuestion(index)'><i class="icon icon-edit"></i></a>
              <a class="delete-question-action action" @click.prevent='deleteQuestion(question.id)'>
                <i class="icon icon-delete"></i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
      <paginate
        :page-count="totalPages"
        :click-handler="onCurrentPageChange"
        :prev-text="'上一页'"
        :next-text="'下一页'"
        :container-class="'pagination'"
        :page-class="'page-item'"
        :prev-class="'page-item'"
        :next-class="'page-item'">
      </paginate>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import _ from 'lodash'
import Paginate from 'vuejs-paginate'
import sanitize from 'sanitize-html'

export default {
  computed: {
    ...mapState(['questions', 'totalPages']),
    currentQuestion: {
      get () { return this.$store.state.currentQuestion },
      set (value) { this.$store.commit('setQuestion', value) }
    }
  },
  components: {
    Paginate
  },
  methods: {
    onCurrentPageChange(currentPage) {
      this.$store.dispatch('fetchList', { page: currentPage })
    },
    editQuestion(index) {
      this.$store.commit('editQuestion', { question: _.cloneDeep(this.questions[index]) })
    },
    deleteQuestion(questionId) {
      console.log(questionId)
      if (confirm('真要删除这条题目吗？')) {
        this.$store.dispatch('deleteQuestion', { id: questionId })
      }
    },
    sanitized(value) {
      if (!value) return ''
      return sanitize(value)
    }
  }
}
</script>
