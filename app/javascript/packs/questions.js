import Vue from 'vue/dist/vue.esm'
import store from '../store'
import ElementUI from 'element-ui'
import Questions from '../components/Questions.vue'

Vue.use(ElementUI)

document.addEventListener('DOMContentLoaded', () => {
  var element = document.getElementById("questions")
  if (element != null) {
    const app = new Vue({
      el: '#questions',
      components: { Questions },
      store,
      render: h => h(Questions)
    })
  }
})
