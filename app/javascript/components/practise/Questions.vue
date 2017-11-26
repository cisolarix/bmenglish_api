<template lang="html">
  <div class="twelve wide column exam-content">
    <div class="ui segment"><span id="exam_title">{{ lesson_title }}</span></div>

    <div :id="`question_${questionIndex+1}`" class="ui segment question transition visible" style="display: block !important;" v-for="(question, questionIndex) in questions">
      <div id="question-1" class="card card-scss">
        <div class="card-content">
          <p style="position: absolute; left: 20px; top: 20px; margin: 0;">{{ questionIndex+1 }}</p>
          <p style="margin-left: 30px; margin-top: 6px;" v-html="`${question.title}`"></p>
        </div>
        <div class="card-action card-action-scss">
          <div class="skin skin-square">
            <div class="skin-section">
              <div class="field right" v-for="(option, optionIndex) in question.options">
                <label>
                  <input type="checkbox" @change="check(questionIndex, question.id, option.id, $event)" :value="option.id">
                  {{ optionPrefixes[optionIndex] }}. {{ option.content }}
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  data() {
    return { lesson_title: '' }
  },
  computed: {
    ...mapState(['questions', 'optionPrefixes', 'choices'])
  },
  methods: {
    check(questionIndex, questionId, optionId, event) {
      if (event.target.checked) {
        this.$store.commit('checkedOption', { questionIndex, questionId, optionId })
      } else {
        this.$store.commit('uncheckedOption', { questionIndex, questionId, optionId })
      }
    }
  },
  created() {
    this.lesson_title = gon.lesson_title
  }
}
</script>
