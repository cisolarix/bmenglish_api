<template lang="html">
  <el-form ref="form" :model="currentQuestion" label-width="80px" size="mini">
    <el-form-item label="题目">
      <el-input type="textarea" :autosize="{ minRows: 2 }" v-model="currentQuestion.title"></el-input>
    </el-form-item>

    <el-form-item label="所属章节">
      <el-select v-model="currentQuestion.chapter_ids" multiple placeholder="请选择">
        <el-option
          v-for="item in chapters"
          :key="item.id"
          :label="item.title"
          :value="item.id">
        </el-option>
      </el-select>
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
    ...mapState(['currentQuestion', 'chapters'])
  },
  methods: {
    submitted(event) {
      let currentQuestion = this.currentQuestion
      let data = {
        id: currentQuestion.id,
        title: currentQuestion.title,
        options_attributes: currentQuestion.options,
        chapter_ids: currentQuestion.chapter_ids
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

<style scoped>
  .el-select.el-select--mini {
    width: 100%;
  }
</style>
