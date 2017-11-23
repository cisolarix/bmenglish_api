<template lang="html">
  <div id="scoreboard" class="wide column overlay fixed">
    <div class="num hidden-xs">
      <div id="count_down" class="ui segment">
        <div class="time-item"><strong class="minute_show">00分</strong> <strong class="second_show">00秒</strong>
        </div>
      </div>
      <div>
        <div class="ui segment btn-num">
          <a v-for="(question, index) in questions" :href="`#question_${index+1}`" class="btn btn-white" :class="[finished.includes(index) ? 'active' : '']">{{ index + 1 }}</a>
        </div>
        <a href="javascript:;" class="btn btn-white state bg1"></a><span>未答题</span>
        <a href="javascript:;" class="btn btn-white state bg2"></a><span>已答题</span>
      </div>
    </div>
    <div class="row">
      <div class="four wide column"></div>
      <div class="twelve wide column">
        <button type="button" name="action" id="submit" class="ui button mobile-submit" :class="[finished.length == questionsLength ? '' : 'disabled']">
          交卷
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['questions', 'finished', 'questionsLength'])
  }
}
</script>

<style lang="css">
</style>
