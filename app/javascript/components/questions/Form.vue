<template lang="html">
  <div class="modal modal-lg active question-form" v-if="showModal">
    <a href="javascript:;" class="modal-overlay" aria-label="Close"></a>
    <div class="modal-container">

      <div class="modal-header">
        <div class="modal-title h5 text-center">{{ modalTitle }}</div>
      </div>
      <div class="modal-body">
        <div class="content">
          <form class="form-horizontal">
            <div class="form-group">
              <div class="col-1">
                <label class="form-label" for="question_title">题干</label>
              </div>
              <div class="col-11">
                <vue-editor v-model="currentQuestion.title"></vue-editor>
              </div>
            </div>
            <div class="form-group">
              <div class="col-1">
                <label class="form-label" for="question_chapter">所属章节</label>
              </div>
              <div class="col-11">
                <multiselect
                  v-model="currentQuestion.chapter_options"
                  :multiple="true"
                  :close-on-select="false"
                  :hide-selected="true"
                  :options="chapters"
                  :value="currentQuestion.chapter_options"
                  label="title"
                  placeholder="选择章节"
                  selectLabel=''>
                </multiselect>
                <div class="form-group">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="col-1">
                <label class="form-label">选项</label>
              </div>
              <div class="col-11">
                <div class="form-group" v-for="option in currentQuestion.options">
                  <label class="form-checkbox option-checkbox">
                    <input type="checkbox" v-model="option.correct">
                    <i class="form-icon option-icon"></i>
                  </label>
                  <input class="form-input" type="text" v-model="option.content" placeholder="选项内容">
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn" @click="cancel">取消</button>
        <button class="btn btn-primary" @click='save'>保存</button>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapState } from 'vuex'
  import { VueEditor } from 'vue2-editor'
  import Multiselect from 'vue-multiselect'
  import 'vue-multiselect/dist/vue-multiselect.min.css'

  export default {
    computed: {
      ...mapState(['currentQuestion', 'chapters', 'showModal', 'modalTitle'])
    },
    methods: {
      save() {
        let currentQuestion = this.currentQuestion
        let checked = currentQuestion.options.filter(o => o.correct == true).length
        if (checked == 0) {
          alert("至少选择一个正确答案")
        } else {
          let data = {
            id: currentQuestion.id,
            title: currentQuestion.title,
            options_attributes: currentQuestion.options,
            chapter_options: currentQuestion.chapter_options
          }
          this.$store.dispatch('updateQuestion', {
            question: data
          })
        }
      },
      cancel() {
        this.$store.commit('canceledQuestion')
      }
    },
    components: {
      VueEditor,
      Multiselect
    }
  }
</script>
