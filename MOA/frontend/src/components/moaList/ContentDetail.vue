<template>
    <!-- 자식 -->

    <div>
        sdsdsd
        {{file_seq}}
    </div>
</template>

<script>



export default {
    props: ['file_id'],
    // name: 'Content',
    // mounted () {
    //     console.log(this.$props.ContentDetail)
    // }
    data:function(){
        return {
            file_seq:""
        }
    },
    created() {
        // this.getInfo();
        this.file_seq = this.file_id
    },
    mounted(){
    }
 
}
</script>

<style>

</style>