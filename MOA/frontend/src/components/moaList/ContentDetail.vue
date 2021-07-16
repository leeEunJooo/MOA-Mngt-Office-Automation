<template>

    <div>
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
                    <div v-if="detailInfo.DOW_NM === ''">
                        <input v-model="detailInfo.CYCL_DATE_TYPE_CD" disabled style="width:90px">
                        <input v-model="detailInfo.DATA_EXE_TIME" disabled style="width:90px">
                    </div>
                    <div v-else>
                        <input v-model="detailInfo.CYCL_DATE_TYPE_CD" disabled style="width:90px">
                        <input v-model="detailInfo.DOW_NM" disabled style="width:90px">
                        <input v-model="detailInfo.DATA_EXE_TIME" disabled style="width:90px">
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
                    <div class="sm_title">업무목적</div>
                    <div>
                        <input v-model="detailInfo.WRKJOB_PRPS_NM" disabled>
                    </div>
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
                        <span class="sourcebtn" id="sourcebtn" @click="sourcebtn($event)">
                            <v-img src="../../assets/img/code_ic.png" class="arrow_ic"></v-img>
                        </span>
                        <span class="downloadsbtn" id="downloadsbtn" @click="downloadsbtn($event)">
                            <v-img src="../../assets/img/downloads_ic.png" class="arrow_ic"></v-img>
                        </span>
                        <hr class="file_hr"/>
                    </div>
                </li>
                <li class="height_fit_content" style="margin-top:15px">
                    <div class="sm_title" style="margin: 5px 0px">실행방법</div>
                    <div class="textarea">
                        <textarea v-model="detailInfo.EXE_SBST" disabled>
    
                        </textarea>
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
    </div>
</template>

<script>


export default {
    props: ['file_id'],
    methods:{
        getInfo : async function(){
                var id = this.file_id
                await this.$http.post(`/api/mlist/listDetail/${id}`)
                .then(
                (res)=>{
                    this.detailInfo = res.data[0];
                    //ATC_FILE_UPLD_PATH_NM SROC_FILE_PATH_NM
                    //파일 존재 여부 체크
                    console.log(this.detailInfo);
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
                this.menu_nm = filename;
                
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
                this.file_nm = filename;
            }
 
        },

    },
    data:function(){
        return {
            file_seq:"",
            detailInfo:{}
        }
    },
    created() {
        this.getInfo();

    },
    mounted(){
    }
 
}
</script>

<style>

</style>