<template lang="html">
  <div class="practice">
    <div class="header">
      <header class="navbar">
        <section class="navbar-section">
          <a :href="`/workbooks/${workbook_id}`" class="navbar-brand mr-2">回到练习册</a>
        </section>
        <section class="navbar-center">
          <span>{{ workbook_title }}</span>
        </section>
        <section class="navbar-section text-right">
          <div class="dropdown dropdown-right">
            <button class="btn btn-link dropdown-toggle" tabindex="0">
              {{ current_user.name }} <i class="icon icon-caret"></i>
            </button>
            <ul class="menu">
              <li class="menu-item">
                <a href="/sign_out">注销</a>
              </li>
            </ul>
          </div>
        </section>
      </header>
    </div>

    <div class="container">
      <div class="columns">
        <div class="column col-10">
          <Questions></Questions>
        </div>
        <div class="column col-2">
          <Scoreboard></Scoreboard>
        </div>
      </div>
    </div>

    <Result></Result>
  </div>
</template>

<script>
import Questions from './practise/Questions.vue'
import Scoreboard from './practise/Scoreboard.vue'
import Result from './practise/Result.vue'

export default {
  data() {
    return { workbook_id: '', workbook_title: '', current_user: null }
  },
  components: {
    Questions,
    Scoreboard,
    Result
  },
  created() {
    this.$store.dispatch('fetchList')
    this.workbook_title = gon.workbook_title
    this.lesson_title = gon.lesson_title
    this.current_user = gon.current_user
    this.workbook_id = gon.workbook_id
  }
}
</script>
