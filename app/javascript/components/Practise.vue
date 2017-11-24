<template lang="html">
  <div class='container'>
      <div class="ui fixed inverted menu" style="background: rgb(26, 188, 156); height: 52px;">
        <div class="ui container">
          <a :href="`/workbooks/${workbook_id}`" class="header item router-link-active" style="border: none;"><span class="logo-name" style="padding-left: 5px;">回到练习册</span></a>
          <a href="#" class="header item router-link-active" style="border: none;"><span class="logo-name" style="padding-left: 5px;">{{ workbook_title }}</span>
          </a>
          <div class="right header item">
            <div class="ui hidden divider"></div>
            <div id="userinfo_dropdown" class="ui floating dropdown button" tabindex="0"><i class="user icon"></i>
              <div id="studentname" style="display: inline;">{{ current_user.name }}</div> <i class="dropdown icon" tabindex="0"><div class="menu" tabindex="-1"></div></i>
              <div class="menu" tabindex="-1">
                <a href="javascript:;" class="item"><i class="sign out icon"></i> 注销</a>
              </div>
            </div>
          </div>
        </div>
      </div>

    <section class="app-main" style="min-height: 100%;">
      <div id="exam_wrapper" class="ui stackable two column vertically divided grid container">
        <div class="row">
          <Scoreboard></Scoreboard>
          <div id="padding0" class="four wide column"></div>
          <Questions></Questions>
          <Result></Result>
        </div>
      </div>
    </section>
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
