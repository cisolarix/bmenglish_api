<template lang="html">
  <div class="modal active" v-if="showModal">
    <a href="javascript:;" class="modal-overlay"></a>
    <div class="modal-container">
      <div class="modal-header">
        <a href="javascript:;" class="btn btn-clear float-right" @click="closeModal"></a>
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
    closeModal() {
      this.$store.commit('closeModal')
    }
  }
}
</script>
