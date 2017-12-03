<template>
  <div>
    <input :id="`trix-input-${_uid}`" type="hidden" :value="value">
    <trix-editor ref="editor" :input="`trix-input-${_uid}`"></trix-editor>
  </div>
</template>

<script>
import Trix from 'trix'
import 'trix/dist/trix.css'

Trix.config.attachments.preview.caption = {
  name: false,
  size: false
}

export default {
  props: ['value'],
  mounted() {
    this.$refs.editor.addEventListener('trix-change', (event) => {
      this.$emit('input', event.currentTarget.innerHTML)
    })

    this.$refs.editor.addEventListener('trix-attachment-add', (event) => {
      // Create our form data to submit
      let attachment = event.attachment
      let file = attachment.file;
      let form = new FormData;
      form.append("Content-Type", file.type);
      form.append("photo[image]", file);

      // Create our XHR request
      let xhr = new XMLHttpRequest;
      xhr.open("POST", "/photos.json", true);
      // xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());

      // Report file uploads back to Trix
      xhr.upload.onprogress = function(event) {
        let progress = event.loaded / event.total * 100;
        attachment.setUploadProgress(progress);
      }

      // Tell Trix what url and href to use on successful upload
      xhr.onload = function() {
        if (xhr.status === 200) {
          let data = JSON.parse(xhr.responseText);
          return attachment.setAttributes({
            url: data.image_url,
            href: data.url
          })
        }
      }

      return xhr.send(form);
    })
  },
}
</script>

<style>
  figcaption.attachment__caption {
    /*隐藏 Add a captain 字样*/
    display: none;
  }

  trix-editor button.attachment__remove--icon {
    /*隐藏删除按钮*/
    display: none;
  }
</style>
