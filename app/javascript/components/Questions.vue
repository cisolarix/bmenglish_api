<template>

  <div class="row">
    <el-container>
      <el-header>题目录入管理</el-header>
      <el-container>
        <el-main>
          <el-table
            :data="questions"
            width='100%'
            border
            highlight-current-row
            @current-change="onCurrentChange">
            <el-table-column
              prop="title"
              label="题目"
              min-width='100%'
              >
            </el-table-column>
          </el-table>
        </el-main>
        <el-aside width="40%">
          <question-form v-if="currentQuestion"></question-form>
        </el-aside>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import _ from 'lodash'
import QuestionForm from './QuestionForm.vue'

export default {
  // data() {
  //   selectedQuestion: null
  // },
  computed: {
    ...mapState(['questions', 'currentQuestion'])
  },
  methods: {
    clicked(index) {
      this.$store.commit('selectQuestion', { currentQuestion: this.questions[index] })
    },
    onCurrentChange(currentRow) {
      this.$store.commit('selectQuestion', { currentQuestion: _.cloneDeep(currentRow) })
      console.log('onCurrentChange: ' + JSON.stringify(currentRow))
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
