<template lang="html">
  <div class="header">
    <header class="navbar">
      <section class="navbar-section">
        <button class='btn btn-primary' @click='newQuestion'>新增题目</button>
      </section>
      <section class="navbar-center">
        <h3>题库管理</h3>
      </section>
      <section class="navbar-section text-right">
        <div class="dropdown dropdown-right">
          <a class="btn btn-link dropdown-toggle" tabindex="0">
            {{ current_user.name }} <i class="icon icon-caret"></i>
          </a>
          <ul class="menu">
            <li class="menu-item"><a href="/chapters">章节管理</a></li>
            <li class="menu-item"><a href="/questions">题目管理</a></li>
            <li class="menu-item"><a href="/students">学生管理</a></li>
            <li class="menu-item"><a href="/sign_out">注销</a></li>
          </ul>
        </div>
      </section>
    </header>
  </div>
</template>

<script>
export default {
  data() {
    return { current_user: null }
  },
  created() {
    this.current_user = gon.current_user
  },
  methods: {
    newQuestion() {
      this.$store.commit('newQuestion')
    }
  }
}
</script>
