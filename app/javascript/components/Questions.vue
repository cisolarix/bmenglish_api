<template>
  <el-container>
    <el-header style="height: auto;">
      <el-container>
        <el-main width="50%">
          <el-row type="flex" class="row-bg">
            <el-col :span="6"><h1>题目录入管理</h1></el-col>
            <el-col :span="6"></el-col>
            <el-col :span="6"></el-col>
            <el-col :span="6">
              <el-button type="primary" @click="buildQuestion">新增题目</el-button>
            </el-col>
          </el-row>
        </el-main>
        <el-aside width="40%"></el-aside>
      </el-container>
    </el-header>

    <el-container>
      <el-main id="container-main">
        <el-table
          :data="questions"
          width='50%'
          border
          @current-change="onCurrentChange">
          <el-table-column
            prop="id"
            label="ID"
            min-width='10%'>
          </el-table-column>
          <el-table-column
            label="题目"
            min-width='90%'>
            <template slot-scope="scope">
              <span v-html="scope.row.title"></span>
            </template>
          </el-table-column>

          <el-table-column
            fixed="right"
            label="操作"
            width="120">
            <template slot-scope="scope">
              <el-button
                @click.prevent="deleteRow(scope.row.id)"
                type="text"
                size="small">
                移除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-main>
      <el-aside width="40%">
        <el-main>
          <question-form v-if="currentQuestion"></question-form>
        </el-main>
      </el-aside>
    </el-container>

    <el-footer>
      <el-pagination
        layout="prev, pager, next"
        :total="50"
        @current-change="onCurrentPageChange">
      </el-pagination>
    </el-footer>
  </el-container>
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
        chapter_ids: [],
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
    },
    deleteRow(questionId) {
      if (confirm('真要删除这条题目吗？')) {
        this.$store.dispatch('deleteQuestion', { id: questionId })
      }
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

<style scoped>
  .el-button.el-button--primary {
    transform: translate(84%, 50%);
  }
</style>
