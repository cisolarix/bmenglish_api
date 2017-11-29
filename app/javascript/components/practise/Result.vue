<template lang="html">
  <div class="modal active" v-if="showModal">
    <a href="#close" class="modal-overlay" aria-label="Close"></a>
    <div class="modal-container">
      <div class="modal-header">
        <div class="modal-title h5">考核结果</div>
      </div>
      <div class="modal-body">
        <div class="content">
          <ul>
            <li style="list-style-type: none;">得分: {{ result.score }}</li>
            <li style="list-style-type: none;">题目总数：{{ result.total }}</li>
            <li style="list-style-type: none;">答对总数：{{ result.correct }}</li>
          </ul>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn" @click="reload">再试一次 😢</button>
        <button class="btn btn-primary" @click="showAnswer">查看答案</button>
      </div>
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
      this.$store.commit('showAnswer')
    }
  }
}
</script>
