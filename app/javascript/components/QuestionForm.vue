<template lang="html">
  <div class="">
    <form class="" action="index.html" method="post">
      <label for="">题干</label>
      <input type="text" name="" v-model="currentQuestion.title" placeholder="题干内容">

      <!-- <ul>
        <li><input type="checkbox" /><input type="text" placeholder="选项内容"></li>
      </ul> -->
      <button type="button" @click.preventDefault="click">保存</button>
    </form>

  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['currentQuestion'])
  },
  methods: {
    click(event) {
      console.log(this.$store)
      console.log('dispatch createQuestion')
      this.$store.dispatch('createQuestion', {
        newQuestion: currentQuestion
      })
    }
  }
}
</script>

<style lang="css">
</style>
