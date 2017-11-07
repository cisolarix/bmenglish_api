<template lang="html">
  <el-form ref="form" :model="currentQuestion" label-width="80px" size="mini">
    <el-form-item label="题目">
      <el-input v-model="currentQuestion.title"></el-input>
    </el-form-item>
    <el-form-item label="选项">
      <div v-for="option in currentQuestion.options">
        <el-row type="flex" class="row-bg" justify="start">
          <el-col :span="21">
            <div class="grid-content bg-purple">
              <el-input v-model="option.content" placeholder="请输入内容"></el-input>
            </div>
          </el-col>
           <el-col :span="1"></el-col>
          <el-col :span="2">
            <div class="grid-content bg-purple">
              <el-checkbox v-model="option.correct"></el-checkbox>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-form-item>

    <el-form-item size="large">
      <el-button @click="cancel">取消</el-button>
      <el-button type="primary" @click='submitted'>保存</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['currentQuestion'])
  },
  methods: {
    submitted(event) {
      let currentQuestion = this.currentQuestion
      let data = {
        id: currentQuestion.id,
        title: currentQuestion.title,
        options_attributes: currentQuestion.options
      }
      this.$store.dispatch('updateQuestion', {
        question: data
      })
    },
    cancel() {
      this.$store.commit('canceledQuestion')
    }
  }
}
</script>
