<template>
    <!-- 자식 -->

    <div>

         {{$props.ContentDetail}}

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
        
        <div class="post_btn">
            <v-btn v-on:click="cancel" class="close">닫기</v-btn>
        </div>
    </div>
</template>

<script>



export default {
    props: ['ContentDetail'],
    name: 'Content',
    mounted () {
        console.log(this.$props.ContentDetail)
    },
    created() {
        this.getInfo();
    },
 
}
</script>

<style>

</style>