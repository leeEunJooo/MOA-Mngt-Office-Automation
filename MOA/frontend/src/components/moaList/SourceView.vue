<template>
  <div class="source">
    <div class="post_title">
          <div class="ic_circle" @click="Back">
              <v-img src="../../assets/img/back_ic.png" class="back_ic"></v-img>
          </div>
          <input class="title source-title" v-model="title" disabled/>
    </div>

    <div class="code">
        <codemirror
          ref="editor"
          class="codemirror" 
          v-model="code" 
          :options="cmOptions" />
    </div>
  </div>  
</template>

<script>

import 'codemirror/lib/codemirror.css'
import 'codemirror/mode/go/go.js'
import 'codemirror/theme/ayu-mirage.css'
import { codemirror } from 'vue-codemirror'

export default {
  // contentDetail.Vue에서 id와 file_path데이터 가져오기
  props: {
    file_path:{
      type: String,
      default : ''
    }
  },

  data () {
    return {
      title:this.$route.params.title,
      code: '',
      cmOptions: {
        // codemirror options
        tabSize: 4,
        mode: 'go',
        // theme: 'abbott',
        lineNumbers: true,
        line: true,
        autoCloseTags: true,
        extraKeys: {"Ctrl-Space": "autocomplete"},
        styleActiveLine: true,
        lineWrapping: true,
        theme: 'ayu-mirage',
        matchBrackets: true,
        autoCloseBrackets: true,
        foldGutter: true,
        gutters: ['CodeMirror-linenumbers', 'CodeMirror-foldgutter'],
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
    noRefresh(){
      console.log(window.event.keyCode);
         if ((window.event.keyCode == 78) && (window.event.ctrlKey == true))
        {
            window.event.keyCode = 0;
            return false;
        }
        /* F5 번키 막음. */
        if(window.event.keyCode == 116)
        {
            window.event.keyCode = 0;
            return false;
        }
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
    },
    fread(){
      this.$http.post(`api/download/readfile/${this.file_path}`)
      .then(
        (res)=>{
          this.code = res.data;
        }
      )
    }
  },
  created(){   
  },
  mounted() {
    //codemirror
    // const cm = editor.codemirror;
    this.noRefresh();
    //파일 읽기
    this.fread();
    
    
    
    

  }

}
</script>

<style>

 .p-text-editor {
    height: 100%;
    min-height: 5rem;
  }
  .CodeMirror {
    margin-top:20px;
    line-height: 1.5;
    height: 850px;
    padding: 1rem;
    border-radius: 10px;
  }
  .source-title{
    border-bottom:none !important;
  }
  .source .ic_circle{
    cursor: positer;
  }
</style>