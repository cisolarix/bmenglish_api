import Vue from 'vue/dist/vue.esm'
import store from '../store/practise'
import Practise from '../components/Practise.vue'

document.addEventListener('DOMContentLoaded', () => {
  var element = document.getElementById("practise")
  if (element != null) {
    const app = new Vue({
      el: '#practise',
      components: { Practise },
      store,
      render: h => h(Practise)
    })
  }
})
