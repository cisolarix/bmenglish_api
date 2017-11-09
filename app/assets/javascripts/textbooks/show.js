$(() => {
  $(document).on('turbolinks:load', e => {
    $('.ui.dropdown').dropdown()
  })
})
