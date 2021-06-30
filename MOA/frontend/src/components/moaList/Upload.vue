<template>
<div id="app">
  <div class="custom-file">
    <input id="customFile" type="file" @change="handleFileChange"/>
    <label class="custom-file-label" for="customFile">{{file_name}}</label>
  </div>
</div>

</template>

<script>

export default{
    data:function(){
        return{
            file_name:"파일을 선택하세요",
            message: "Hello.world"
        }
    },


    methods: {
        handleFileChange(e){
            this.file_name = e.target.files[0].name;
        },
        upload:function(){
            this.$http.post("/api/upload/uploadFile",{
                userfile : this.userfile,
            })
            .then(
                (res) => {
                    console(res);
                }
            )
        }
    },
}
</script>
