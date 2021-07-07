<template>
    <div class="list_detail">
        <div class="post_title">
            <div class="ic_circle">
                <img src="../../assets/img/folder.png" class="folder_ic"/>
            </div>
            <input v-model="detailInfo.NTCART_TITLE_NM" class="title" disabled/>
        </div>
        <div class="post_contents">
            <ul>
                <li>
                    <div class="sm_title">담당자</div>
                    <div>
                        <input v-model="detailInfo.TKCGR_NM" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">사용자</div>
                    <div>
                        <input v-model="detailInfo.RUSER_NM" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">잔행단계</div>
                    <input v-model="detailInfo.TROBL_SVC_TYPE_CD" disabled>
                </li>
                <li>
                    <div class="sm_title">작동시기</div>
                    <div>
                         <input v-model="detailInfo.CYCL_DATE_TYPE_CD" disabled>
                        <input v-model="detailInfo.DATA_EXE_TIME" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">대상시스템</div>
                    <div>
                        <input v-model="detailInfo.SYS_DIV_CD" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">사용기술</div>
                    <div>
                        <input v-model="detailInfo.LANG_CD" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">실행방법</div>
                    <div>
                        <input v-model="detailInfo.EXE_SBST" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">실행환경</div>
                    <input v-model="detailInfo.TROBL_SVC_TYPE_CD" disabled>
                </li>
                <li>
                    <div class="sm_title">Input</div>
                    <div>
                        <input v-model="detailInfo.INPUT_VAL" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">Output</div>
                    <div>
                        <input v-model="detailInfo.OTPUT_SBST" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">실행후결과</div>
                    <div>
                        <input v-model="detailInfo.RPY_RESLT_CD" disabled>
                    </div>
                </li>
                <li>
                    <div class="sm_title">Workaround</div>
                    <input v-model="detailInfo.TROBL_SVC_TYPE_CD" disabled>
                </li>
                <li>
                    <div class="sm_title">매뉴얼여부</div>
                    <div>
                        <input v-model="detailInfo.ATC_FILE_MANUAL_YN" disabled>
                    </div>
                </li>
                <li class="height_fit_content" style="margin-bottom:28px">
                    <div class="sm_title" style="margin-bottom:5px">매뉴얼파일</div>
                    <!-- 매뉴얼파일 리스트 -->
                    <hr class="file_hr"/>
                    <div class="file_list" id="mannual_file_list">
                        <span class="fileType" id="fileType"></span>
                        <sapn class="fileContent" id="fileContent"></sapn>
                        <!-- <input v-model="detailInfo.ATC_FILE_UPLD_PATH_NM" disabled> -->
                        <hr class="file_hr"/>
                    </div>
                </li>
                <li class="height_fit_content" style="margin-bottom:28px">
                    <div class="sm_title" style="margin: 5px 0px">자동화파일</div>
                    <!-- 자동화파일 리스트 -->
                    <hr class="file_hr"/>
                    <div class="file_list" id="auto_file_list" style="display:none">
                        <span class="fileType" id="fileType"></span>
                        <sapn class="fileContent" id="fileContent"></sapn>
                        <hr class="file_hr"/>
                    </div>
                </li>
                <li class="height_fit_content" style="margin-top:15px">
                    <div class="sm_title" style="margin: 5px 0px">상세설명</div>
                    <div class="textarea">
                        <textarea v-model="detailInfo.ATTEN_MTR_SBST" disabled>
    
                        </textarea>
                    </div>
                </li>
                <li class="height_fit_content" style="margin-top:15px">
                    <div class="sm_title" style="margin: 5px 0px">실행시주의점</div>
                    <div class="textarea">
                        <textarea v-model="detailInfo.EXE_SBST" disabled>
                        </textarea>
                    </div>
                </li> 
                <li class="height_fit_content" style="margin-top:15px">
                    <div class="sm_title" style="margin: 5px 0px">기타사항</div>
                    <div class="textarea">
                        <textarea v-model="detailInfo.EXE_SBST" disabled>
                        </textarea>
                    </div>
                </li>
            </ul>

        </div>
        
        <div class="post_btn">
            <v-btn v-on:click="cancel" class="close">취소</v-btn>
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
            team_div_cd: [
                {name: "1팀",idx: "T01", idx2:"D01"},
                {name: "2팀",idx: "T02", idx2:"D01"},
                {name: "3팀",idx: "T03", idx2:"D01"}, 
                {name: "4팀",idx: "T04", idx2:"D01"},
                {name: "5팀",idx: "T05", idx2:"D02"},
                {name: "6팀",idx: "T06", idx2:"D02"}
            ],
            cd_nm:"",
        }
        
    },
    methods:{
            getInfo : async function(){
                var id = this.$route.params.id
                await this.$http.post(`/api/mlist/listDetail/${id}`)
                .then(
                (res)=>{
                    this.detailInfo = res.data[0];
                    //ATC_FILE_UPLD_PATH_NM SROC_FILE_PATH_NM
                    //파일 존재 여부 체크
                    
                    //코드성 변경
                    for(let i=0; i<Object.keys(this.detailInfo).length; i++){
                        if(Object.keys(this.detailInfo)[i].includes("_CD")){
                            this.cd_nm = Object.values(this.detailInfo)[i];
                            this.$http.post(`/api/mlist/codeselect/${Object.values(this.detailInfo)[i]}`)
                            .then(
                                (response)=>{
                                    this.detailInfo[Object.keys(this.detailInfo)[i]] = response.data[0].CD_NM;
                                }
                            )   
                        }
                    }
 
            });

            const mannual_f = this.detailInfo.ATC_FILE_MANUAL_YN;
            if(mannual_f=="N"){
                document.querySelector('#mannual_file_list').parentNode.style.display="none";
            }
            else{
                const moa_file_path = this.detailInfo.ATC_FILE_UPLD_PATH_NM;
                const spltArr_type = moa_file_path.split('.');
                const splthArr_name = moa_file_path.split('\\');

                let filetype = spltArr_type[spltArr_type.length-1];
                let filename = splthArr_name[splthArr_name.length-1];

                const file_div = document.querySelector('#mannual_file_list');
                const fileType = file_div.querySelector('#fileType');
                const fileContent = file_div.querySelector('#fileContent');
                
                fileType.innerHTML = filetype;
                fileContent.innerHTML = filename;
                file_div.style.display="block";
            }
            const moa_file_path = this.detailInfo.SROC_FILE_PATH_NM;
            if(moa_file_path!=''){
                const spltArr_type = moa_file_path.split('.');
                const splthArr_name = moa_file_path.split('\\');

                let filetype = spltArr_type[spltArr_type.length-1];
                let filename = splthArr_name[splthArr_name.length-1];

                const file_div = document.querySelector('#auto_file_list');
                const fileType = file_div.querySelector('#fileType');
                const fileContent = file_div.querySelector('#fileContent');
                
                fileType.innerHTML = filetype;
                fileContent.innerHTML = filename;
                file_div.style.display="block";
            }
        },

        cancel:function(){
            window.close();
        }
    },
    created() {
        this.getInfo();
    },
    mounted(){
        // const mannual_f = this.detailInfo.ATC_FILE_UPLD_PATH_NM;
        // const moa_f = this.detailInfo.ATC_FILE_UPLD_PATH_NM;
        
        // if(mannual_f!='') document.querySelector('#mannual_file_list').style.display="block";
        // if(moa_f!='') document.querySelector('#auto_file_list').style.display="block";

        // console.log(this.detailInfo);
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
        width:80%;
    }
    
</style>