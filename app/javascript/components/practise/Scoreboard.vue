<template lang="html">
  <div id="scoreboard" class="fixed">
    <strong>答题板</strong>
    <div id='numbers'>
      <span class="chip" :class="[finished.includes(index) ? 'answered' : '']" v-for="(question, index) in questions">
        <a :href="`#question_${index+1}`">{{ index + 1 }}</a>
      </span>
    </div>
    <button type="button" name="action" id="submit" class="btn" :class="[finished.length == questionsLength ? '' : 'disabled']" @click="onClick">
      交卷
    </button>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['questions', 'finished', 'questionsLength'])
  },
  methods: {
    onClick() {
      this.$store.dispatch('submitPractice')
    }
  }
}
</script>
