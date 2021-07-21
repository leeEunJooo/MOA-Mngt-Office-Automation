<template>
    <div>
        <div class="list_detail">
            <router-view></router-view>
        <div class="post_btn">
            <v-btn v-on:click="cancel" class="close">닫기</v-btn>
            <v-btn v-show="this.user === this.cust_idfy_seq" v-on:click="deletedetail" class="deletedetail">삭제</v-btn>
        </div>
        
        </div>
    </div>
</template>

<script>
export default {
    components:{
    },

    data:function(){
        return {
            team_div_cd: [
                {name: "1팀",idx: "T01", idx2:"D01"},
                {name: "2팀",idx: "T02", idx2:"D01"},
                {name: "3팀",idx: "T03", idx2:"D01"}, 
                {name: "4팀",idx: "T04", idx2:"D01"},
                {name: "5팀",idx: "T05", idx2:"D02"},
                {name: "6팀",idx: "T06", idx2:"D02"}
            ],
            cd_nm:"",
            file_nm:"",
            menu_nm:"",
            file_seq:"",
            user:"",
            cust_idfy_seq:"",
        }
        
    },
    methods:{
        cancel:function(){
            window.close();
        },
        deletedetail:function(){
            console.log("삭제하기", this.file_seq);
            this.$http.post(`/api/mlist/deleteDetail/${this.file_seq}`)
            .then(
                (response)=>{
                    alert(response.data.message);
                    opener.parent.location.reload();
                    window.close();
                }
            )   
        }
    },
    created() {
        this.file_seq = this.$route.params.id;  
        this.user = JSON.parse(localStorage.getItem('token')).user.CUST_IDFY_SEQ;
        console.log("cust_idfy_seq", this.user);
    },
    mounted(){
        
    }
}
</script>

<style>
    .list_detail{
        margin:40px;
    }
    .list_detail .folder_ic{
        width:28px;
        height:22px;
    }
    .list_detail .post_title{
        width:100%;
        height:60px;
    }
    .list_detail .ic_circle,
    .list_detail .title{
        display: block;
        float: left;
    }
    .list_detail .ic_circle{
        width: 55px;
        height: 55px;
        padding: 17px 14px;
        border-radius: 50px;
        background-color: #e5e7fd;
    }
    .list_detail .title{
        width: 85%;
        height: 90%;
        margin-left: 20px;
        border-bottom: solid 2.5px #5d51eb;
        font-family: AppleSDGothicNeoEB00;
        font-size: 26px;
        line-height: 1;
        letter-spacing: normal;
        text-align: left;
        color: #5d51eb;
    }
    /* post content */
    .post_contents ul{
        margin: 50px 15px;
        margin-bottom: 0px;
    }
    .post_contents ul li{
        width: 100%;
        height: 50px;
        margin-bottom: 5px;
    }
    .post_contents ul li:nth-last-child(2){
        height: 150px;
        width:100%;
    }
    .post_contents ul li div{
        display: inline-block;
    }
    .post_contents ul li .sm_title{
        width:20%;
        font-family: AppleSDGothicNeoB00;
        font-size: 16px;
        font-weight: normal;
        font-stretch: normal;
        font-style: normal;
        line-height: 1.89;
        letter-spacing: normal;
        text-align: left;
        color: #3b3b3b;
    }
    .post_contents .textarea{
        width: 100%;
        height: 108px;
        margin-top:5px;
        border-radius: 12px;
        background-color: #f2f3ff;
    }
    .post_contents .textarea textarea{
        width: 100%;
        height: 100% !important;
        padding: 15px;
    }
       .list_detail .file_list{
        width: 100%;
        margin: 10px 0px;
    }
    .list_detail .checkbox{
        width: 18px;
        height: 18px;
        margin: 5px;
        border: solid 1px #707070;
        vertical-align: text-bottom;
        background-color: #ffffff;
    }
    .list_detail label{
        margin-left: 5px !important ;
        font-size: 18px;
        text-align: left;
        color: #3b3b3b;
    }
    .list_detail .file_hr{
        opacity: 0.2;
        border: solid 0.5px #707070;
        margin-top:5px;
    }
    .height_fit_content{
        height: fit-content !important;
    }
    .post_btn .close{
        float: right;
        width: 105px;
        height: 40px !important;
        margin: 30px 20px 30px 0px;
        color: #3b2fcb;
        font-size: 14px;
        border-radius: 24px;
        box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);
        border: solid 3px #3b2fcb;
        background: white;
    }


    /* 파일 */
    .list_detail .fileType,
    .list_detail .fileContent,
    .list_detail .deletebtn{
        display: inline-block;
        text-align: left;
        padding:0px 10px;
    }

    .list_detail .fileType{
        width:15%;
    }
    .list_detail .fileContent{
        width:75%;
    }
    .list_detail .sourcebtn{
        display: inline-block;
        float: right;
        margin: 0px 10px;
        width: 21px;
        cursor:pointer;
    }
    .list_detail .downloadsbtn{
        display: inline-block;
        float: right;
        width: 21px;
        cursor:pointer;
    }
    .list_detail input{
        width: 500px;
    }
    .list_detail .small_input{
        width:150px;
    }
    .list_detail .back_ic{
        width:28px;
        height:22px;
        cursor: pointer;
    }
    
</style>