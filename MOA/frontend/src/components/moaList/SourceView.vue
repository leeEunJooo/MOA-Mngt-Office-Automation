<template>
  <div class="code">
    <button @click="Back" type="button">뒤<br/>로<br/>가<br/>기<br/>버<br/>튼</button> 
      <codemirror v-model="code" :options="cmOptions" />
  </div>
</template>

<script>

import 'codemirror/lib/codemirror.css'
import 'codemirror/mode/go/go.js'
import 'codemirror/theme/abbott.css'
import { codemirror } from 'vue-codemirror'

export default {
  data () {
    return {
      code: 'const a = 10',
      cmOptions: {
        // codemirror options
        tabSize: 4,
        mode: 'go',
        theme: 'abbott',
        lineNumbers: true,
        line: true,
        autoCloseTags: true,
        extraKeys: {"Ctrl-Space": "autocomplete"},
      }
    }
  },
  components:{
    codemirror
  },
  methods:{
    Back(){
        this.$router.go(-1); [2]
    },
    onCmReady(cm) {
      console.log('the editor is readied!', cm)
    },
    onCmFocus(cm) {
      console.log('the editor is focused!', cm)
    },
    onCmCodeChange(newCode) {
      console.log('this is new code', newCode)
      this.code = newCode
    }
  },
  mounted() {
  }

}
</script>

<style>

</style>