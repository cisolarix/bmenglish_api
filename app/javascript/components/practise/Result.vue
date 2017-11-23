<template lang="html">
  <div id="score_modal" v-if="showModal" class="ui long scrolling modal" style="display: block; width: 550px; left: 62%; top: 45%;">
    <div class="header"><div class="hidden"></div>考核结果</div>
    <div class="content" style="text-align: center; min-height: 20px">
      <ul style="text-align: left;">
        <li style="list-style-type: none;">得分: <span class="text-orange">{{result.score}}</span></li>
        <li style="list-style-type: none;">题目总数：{{result.total}}</li>
        <li style="list-style-type: none;">答对总数：{{result.correct}}</li>
      </ul>
    </div>
    <div class="actions">
      <button class="ui cancel button" @click="reload">
        再试一次 😢
      </button>

      <button class="ui positive button" @click="showAnswer">
        查看答案
      </button>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['showModal', 'result'])
  },
  methods: {
    reload() {
      this.$store.commit('reload')
    },
    showAnswer() {

    }
  }
}
</script>
