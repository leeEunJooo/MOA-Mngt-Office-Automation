<template>
  <div class="code">
     <!-- Two-way Data-Binding -->
      <codemirror v-model="code" :options="cmOptions" />

      <!-- Or manually control the data synchronization -->
      <!-- <codemirror
        ref="cmEditor"
        :value="code"
        :options="cmOptions"
        @ready="onCmReady"
        @focus="onCmFocus"
        @input="onCmCodeChange"
      /> -->
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