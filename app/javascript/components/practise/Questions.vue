<template lang="html">
  <div class="questions-list">
    <div class="panel">
      <div class="panel-header">
        <div class="panel-title">{{ lesson_title }}</div>
      </div>
      <div class="panel-nav">
      </div>
      <div class="panel-body">
        <div :id="`question_${questionIndex+1}`" class="tile" v-for="(question, questionIndex) in questions">
          <div class="tile-icon">{{ questionIndex+1 }}:
          </div>
          <div class="tile-content">
            <p class="tile-title" v-html="`${question.title}`"></p>
            <p class="tile-subtitle" v-for="(option, optionIndex) in question.options">
              <label>
                <input type="checkbox" @change="check(questionIndex, question.id, option.id, $event)" :value="option.id">
                <span class='option-title'>{{ optionPrefixes[optionIndex] }}. {{ option.content }}</span>
              </label>
            </p>
          </div>
        </div>
      </div>
      <div class="panel-footer"></div>
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
