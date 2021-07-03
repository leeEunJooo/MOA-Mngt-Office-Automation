<template>
    <div class="list_detail">
        <div class="post_title">
            <div class="ic_circle"></div>
            <input value="ITMS 스펙처리 자동화" class="title"/>
        </div>
        <div class="post_contents">
            <ul>
                <li>
                    <div class="sm_title">담당자</div>
                    <div>
                        <input v-model="detailInfo.TKCGR_NM">
                    </div>
                </li>
                <li>
                    <div class="sm_title">사용자</div>
                    <div>
                        <input v-model="detailInfo.RUSER_NM">
                    </div>
                </li>
                <li>
                    <div class="sm_title">작동시기</div>
                    <div>
                        <input v-model="detailInfo.CYCL_DATE_TYPE_CD">
                        <input v-model="detailInfo.DATA_EXE_TIME">
                    </div>
                </li>
                <li>
                    <div class="sm_title">대상시스템</div>
                    <div>
                        <input v-model="detailInfo.SYS_DIV_CD">
                    </div>
                </li>
                <li>
                    <div class="sm_title">사용기술</div>
                    <div>
                        <input v-model="detailInfo.LANG_CD">
                    </div>
                </li>
                <li>
                    <div class="sm_title">실행방법</div>
                    <div>
                        <input v-model="detailInfo.EXE_SBST">
                    </div>
                </li>
                <li>
                    <div class="sm_title">Input</div>
                    <div>
                        <input v-model="detailInfo.INPUT_VAL">
                    </div>
                </li>
                <li>
                    <div class="sm_title">Output</div>
                    <div>
                        <input v-model="detailInfo.OTPUT_SBST">
                    </div>
                </li>
                <li>
                    <div class="sm_title">실행후결과</div>
                    <div>
                        <input v-model="detailInfo.RPY_RESLT_CD">
                    </div>
                </li>
                <li>
                    <div class="sm_title">Workaround</div>
                    <input v-model="detailInfo.TROBL_SVC_TYPE_CD">
                </li>
                <li>
                    <div class="sm_title">매뉴얼여부</div>
                    <div>
                        <input v-model="detailInfo.ATC_FILE_MANUAL_YN">
                    </div>
                </li>
                <li>
                    <div class="sm_title">매뉴얼파일</div>
                    <div>
                        <input v-model="detailInfo.ATC_FILE_UPLD_PATH_NM">
                    </div>
                </li>
                <li>
                    <div class="sm_title">파일첨부</div>
                    <div>
                        <input v-model="detailInfo.SROC_FILE_PATH_NM">
                    </div>
                </li>
                <li>
                    <div class="sm_title">상세설명</div>
                    <div class="textarea">
                        <textarea v-model="detailInfo.ATTEN_MTR_SBST">
    
                        </textarea>
                    </div>
                </li>
                <li>
                    <div class="sm_title">실행시주의점</div>
                    <div class="textarea">
                        <textarea v-model="detailInfo.EXE_SBST">

                        </textarea>
                    </div>
                </li> 
            </ul>

        </div>
        <div class="post_btn">
        </div>
    </div>
</template>

<script>


export default {
    props : {
        Id : Number,
        detailInfo : {},
    },

    data:function(){
        return {
            cd_nm:"",
        }
    },
    methods:{
            getInfo : function(){
                var id = this.$route.params.id
                this.$http.post(`/api/mlist/listDetail/${id}`)
                .then(
                (res)=>{
                    this.detailInfo = res.data[0]
                    console.log("detail",this.detailInfo);
                    // console.log("갯수", this.detailInfo);
                    //코드성
                    console.log(this.detailInfo);
                    console.log(this.detailInfo.CYCL_DATE_TYPE_CD);
                    // this.cd_nm = this.detailInfo.CYCL_DATE_TYPE_CD;
                    // this.$http.post(`/api/mlist/codeselect/${this.detailInfo.CYCL_DATE_TYPE_CD}`)
                    // .then(
                    //     (response)=>{
                    //         console.log(response.data[0].CD_NM);
                    //         this.detailInfo.CYCL_DATE_TYPE_CD = response.data[0].CD_NM;
                    //         console.log("this.detailInfo.CYCL_DATE_TYPE_CD",this.detailInfo.CYCL_DATE_TYPE_CD);
                    //     }
                    // )

                    // console.log(this.detailInfo.LANG_CD);
                    // this.$http.post(`/api/mlist/codeselect/${this.detailInfo.LANG_CD}`)
                    // .then(
                    //     (response)=>{
                    //         console.log(response.data[0].CD_NM);
                    //         this.detailInfo.LANG_CD = response.data[0].CD_NM;
                    //         console.log("this.detailInfo.LANG_CD",this.detailInfo.LANG_CD);
                    //     }
                    // )
                    
                    // console.log(this.detailInfo.SYS_DIV_CD);
                    // this.$http.post(`/api/mlist/codeselect/${this.detailInfo.SYS_DIV_CD}`)
                    // .then(
                    //     (response)=>{
                    //         console.log(response.data[0].CD_NM);
                    //         this.detailInfo.SYS_DIV_CD = response.data[0].CD_NM;
                    //         console.log("this.detailInfo.SYS_DIV_CD",this.detailInfo.SYS_DIV_CD);
                    //     }
                    // )

                    // console.log(this.detailInfo.TROBL_SVC_TYPE_CD);
                    // this.$http.post(`/api/mlist/codeselect/${this.detailInfo.TROBL_SVC_TYPE_CD}`)
                    // .then(
                    //     (response)=>{
                    //         console.log(response.data[0].CD_NM);
                    //         this.detailInfo.TROBL_SVC_TYPE_CD = response.data[0].CD_NM;
                    //         console.log("TROBL_SVC_TYPE_CD",this.detailInfo.TROBL_SVC_TYPE_CD);
                    //     }
                    // )

                    // console.log(this.detailInfo.RPY_RESLT_CD);
                    // this.$http.post(`/api/mlist/codeselect/${this.detailInfo.RPY_RESLT_CD}`)
                    // .then(
                    //     (response)=>{
                    //         console.log(response.data[0].CD_NM);
                    //         this.detailInfo.RPY_RESLT_CD = response.data[0].CD_NM;
                    //         console.log("RPY_RESLT_CD",this.detailInfo.RPY_RESLT_CD);
                    //     }
                    // )
            });
        }
    },
    created() {
        this.getInfo();
    },
    mounted(){
        console.log(this.detailInfo);
    }

    
}
</script>

<style>
    .list_detail{
        margin:40px;
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
        padding: 19.3px 17.4px 21.1px 17.5px;
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
    }
    .post_contents ul li{
        width: 100%;
        height: 50px;
        margin-bottom: 10px;
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

</style>