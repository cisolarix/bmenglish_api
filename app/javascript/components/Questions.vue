<template>
  <div class="row">
    <el-container>
      <el-header>
        <el-row type="flex" class="row-bg">
          <el-col :span="6"><div class="grid-content bg-purple"><h1>题目录入管理</h1></div></el-col>
          <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
          <el-col :span="6"><div class="grid-content bg-purple-light"></div></el-col>
          <el-col :span="6"><el-button type="primary" @click="buildQuestion">新增题目</el-button><div class="grid-content bg-purple"></div></el-col>
        </el-row>
      </el-header>
      <el-container>
        <el-main>
          <el-table
            :data="questions"
            width='100%'
            border
            highlight-current-row
            @current-change="onCurrentChange">
            <el-table-column
              prop="id"
              label="ID"
              min-width='10%'>
            </el-table-column>
            <el-table-column
              prop="title"
              label="题目"
              min-width='90%'>
            </el-table-column>
          </el-table>

          <el-pagination
            layout="prev, pager, next"
            :total="50"
            @current-change="onCurrentPageChange">
          </el-pagination>
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
  computed: {
    ...mapState(['questions']),
    currentQuestion: {
      get () { return this.$store.state.currentQuestion },
      set (value) { this.$store.commit('setQuestion', value) }
    }
  },
  methods: {
    clicked(index) {
      this.$store.commit('selectQuestion', { currentQuestion: this.questions[index] })
    },
    onCurrentChange(currentRow) {
      this.$store.commit('selectQuestion', { currentQuestion: _.cloneDeep(currentRow) })
    },
    buildQuestion() {
      this.currentQuestion = {
        id: null,
        title: '',
        options: [
          { id: null, content: '', correct: false },
          { id: null, content: '', correct: false },
          { id: null, content: '', correct: false },
          { id: null, content: '', correct: false }
        ]
      }
    },
    onCurrentPageChange(currentPage) {
      this.$store.dispatch('fetchList', { page: currentPage })
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
