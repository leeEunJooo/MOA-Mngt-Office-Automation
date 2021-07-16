<template>
  <div class="code">
    <br>
    <v-row>
      <button @click="Back" type="button">
        <v-img src="../../assets/img/back_ic2.png" class="back_ic"></v-img>
      </button>
    </v-row>
    <br>
    <br>
      <codemirror class="codemirror" v-model="code" :options="cmOptions" />
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
.back_ic{
  width: 35%;
  vertical-align: left;
}
</style>