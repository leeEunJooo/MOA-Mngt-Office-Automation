<template>
<v-app>
<div class="posting">
    <div class="post_title">
        <div class="ic_circle" >
            <img src="../../assets/img/folder.png" class="folder_ic"/>
        </div>
        <input class="title" placeholder="자동화 제목을 입력해 주세요" v-model="detailInfo.NTCART_TITLE_NM"/>
    </div>
    <div class="post_contents">
        <ul>
            <li>
                <div class="sm_title"><span class="necessary">* </span>담당자</div>
                <div>
                    <input v-model="users.USER_NM" class="typing" disabled/>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>사용자</div>
                <div>
                    <input class="typing" v-model="detailInfo.RUSER_NM"/>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>진행단계</div>
                <input class="typing" v-model="detailInfo.TRT_STEP_NM"/>
                <!-- <v-select
                    :items="select_stage"
                    item-text="name"
                    item-value="idx"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select> -->
                </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>작동시기</div>
                <div class="cycle">
                        <!-- <input class="typing sm_typing" v-model="detailInfo.CYCL_DATE_TYPE_CD"/>
                        <input class="typing sm_typing" v-model="detailInfo.DATA_EXE_TIME"/> -->
                        <v-select
                        v-model="detailInfo.CYCL_DATE_TYPE_CD"
                        :items="select_option[1]"
                        item-text="name"
                        item-value="cd"
                        item-color='#f2f3ff'
                        solo
                        return-object
                        
                        ></v-select>
                        <v-select
                        v-model="detailInfo.DOW_NM"
                        :items="select_option[0]"
                        item-text="name"
                        item-value="cd"
                        item-color='#f2f3ff'
                        solo
                        return-object
                        
                        ></v-select>
                        
                        <input type="number" min="0" max="100" class="typing" id = "hour" value=""/>
                        <input type="number" min="0" max="100" class="typing" id = "min" value=""/>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>대상시스템</div>
                <div>
                    <!-- <input class="typing" v-model="detailInfo.SYS_DIV_CD"/> -->
                    <v-select
                    v-model="detailInfo.SYS_DIV_CD"
                    :items="select_option[2]"
                    item-text="name"
                    item-value="cd"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>사용기술</div>
                <div>
                    <!-- <input class="typing" v-model="detailInfo.LANG_CD"/> -->
                    <v-select
                    v-model="detailInfo.LANG_CD"
                    :items="select_option[3]"
                    item-text="name"
                    item-value="cd"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>실행환경</div>
                <!-- <input class="typing" v-model="detailInfo.CONN_EVN_DIV_CD"> -->
                <v-select
                    v-model="detailInfo.CONN_EVN_DIV_CD"
                    :items="select_option[4]"
                    item-text="name"
                    item-value="cd"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select>
            </li>
            <li>
                <div class="sm_title">Input</div>
                <div>
                    <input class="typing" v-model="detailInfo.INPUT_VAL"/>
                </div>
            </li>
            <li>
                <div class="sm_title">Output</div>
                <div>
                    <input class="typing" v-model="detailInfo.OTPUT_SBST"/>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>실행후결과</div>
                <div>
                    <!-- <input class="typing" v-model="detailInfo.RPY_RESLT_CD"/> -->
                    <v-select
                        v-model="detailInfo.RPY_RESLT_CD"
                        :items="select_option[5]"
                        item-text="name"
                        item-value="cd"
                        item-color='#f2f3ff'
                        solo
                        return-object
                  ></v-select>
                </div>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">*</span> Workaround</div>
                <!-- <input class="typing" v-model="detailInfo.TROBL_SVC_TYPE_CD"/> -->
                <v-select
                    v-model="detailInfo.TROBL_SVC_TYPE_CD"
                    :items="select_option[6]"
                    item-text="name"
                    item-value="cd"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>업무목적</div>
                    <input type="radio" id="customer" value="고객업무대상" v-model="detailInfo.WRKJOB_PRPS_NM" checked>
                    <label for="customer">고객업무대상</label>
                    <input type="radio" id="staff" value="스탭업무대상" v-model="detailInfo.WRKJOB_PRPS_NM">
                    <label for="staff">스탭업무대상</label>
            </li>
            <li>
                <div class="sm_title"><span class="necessary">* </span>매뉴얼여부</div>
                    <input type="radio" id="y" value="Y" v-model="detailInfo.ATC_FILE_MANUAL_YN" checked>
                    <label for="y">Y</label>
                    <input type="radio" id="n" value="N" v-model="detailInfo.ATC_FILE_MANUAL_YN">
                    <label for="n">N</label>
            </li>
            <div v-show="detailInfo.ATC_FILE_MANUAL_YN === 'Y'">
            <li class="height_fit_content" id="mannual_file" >
                <div class="sm_title" style="margin-bottom:5px">매뉴얼파일</div>
                <v-btn class="addfilebtn">
                    <img src="../../assets/img/paperclip.png" class=""/>
                </v-btn>   
                 
                
                <!-- 매뉴얼파일 리스트 -->
                <hr class="file_hr"/>
                <div class="filebox1 file_list">
                    <span class="fileType" id="fileType"></span>
                    <span class="fileContent" id="fileContent"></span>
                    <input type="file" id="realFile" name="mannual" @change="menu_changeVal($event)" hidden/>
                    <span class="deletebtn" id="deletebtn" @click="cancelVal($event)"></span>
                    <hr class="file_hr" id="file_hr" style="margin-top:8px; margin-bottom:35px; display:none;"/>
                </div>
            </li>
            </div>
            <li class="height_fit_content">
                <div class="sm_title" style="margin: 5px 0px"><span class="necessary">* </span>자동화파일</div>
                <v-btn class="addfilebtn">
                    <img src="../../assets/img/paperclip.png" class=""/>
                </v-btn>
                <!-- 자동화파일 리스트 -->
                <hr class="file_hr"/>
                <div class="filebox2 file_list">
                    <span class="fileType" id="fileType"></span>
                    <span class="fileContent" id="fileContent"></span>
                    <input type="file" id="realFile" name='moafile' @change="changeVal($event)" hidden/>
                    <span class="deletebtn" id="deletebtn" @click="cancelVal($event)"></span>
                    <hr class="file_hr" id="file_hr" style="margin-top:8px; margin-bottom:35px; display:none;"/>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px"><span class="necessary">* </span>실행방법</div>
                <div class="textarea">
                    <textarea v-model="detailInfo.EXE_SBST">

                    </textarea>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">상세설명</div>
                <div class="textarea">
                    <textarea v-model="detailInfo.DTL_DESC_SBST">

                    </textarea>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">실행시주의점</div>
                <div class="textarea">
                    <textarea  v-model="detailInfo.ATTEN_MTR_SBST">
                    </textarea>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">기타사항</div>
                <div class="textarea">
                    <textarea  v-model="detailInfo.ETC_SBST">
                    </textarea>
                </div>
            </li>  
        </ul>

    </div>
    <div class="post_btn">
        <v-btn class="close" v-on:click="close_browser">취소</v-btn>
        <v-btn class="save" v-on:click="save">저장</v-btn>
    </div>
</div>
</v-app>
</template>

<script>

export default {
props : {
    Id : Number,
    // detailInfo : {},
},

data:function(){
    return{
        file_path:[],
        file_seq:"",
        users: "",
        isMenu:"",
        detailInfo:{
            CUST_IDFY_SEQ:"",
            SROC_FILE_PATH_NM:"",
            NTCART_TITLE_NM:"",
            TKCGR_NM:"",
            RUSER_NM:"",
            CYCL_DATE_TYPE_CD:"",
            DATA_EXE_TIME:"",
            SYS_DIV_CD:"",
            LANG_CD:"",
            EXE_SBST:"",
            INPUT_VAL:"",
            OTPUT_SBST:"",
            CONN_EVN_DIV_CD:"",
            RPY_RESLT_CD:"",
            TROBL_SVC_TYPE_CD:"",
            ATTEN_MTR_SBST:"",
            DOW_NM:"",
            TRT_STEP_NM:"",
            ATC_FILE_MANUAL_YN:"Y",
            ETC_SBST:"",
            ATC_FILE_UPLD_PATH_NM:"",
            DTL_DESC_SBST:"",
            WRKJOB_PRPS_NM:"고객업무대상",
        },
        
        // Select 박스 Option (name, code)
        select_option:[
            // 0 : 시간(월화수목금1일~31일)
            // 1 : 작동시기(매일,매주, 매월...)
            // 2 : 대상시스템(DT플랫폼, 비바체...)
            // 3 : 사용기술(AntBot, 파이썬...)
            // 4 : 실행환경(로컬,사외망)
            // 5 : 실행후결과(매일, SMS, 없음)
            // 6 : workaround
        ],
    }
},

methods:{
    close_browser: function(){
        window.close();
    },
    checkContent : function(){
        console.log(this.detailInfo);
        //작동시기
        var checkArr = [
            this.detailInfo.NTCART_TITLE_NM,
            this.detailInfo.CYCL_DATE_TYPE_CD,
            this.detailInfo.EXE_SBST,
            this.detailInfo.SYS_DIV_CD,
            this.detailInfo.LANG_CD,
            this.detailInfo.CONN_EVN_DIV_CD,
            this.detailInfo.RPY_RESLT_CD,
            this.detailInfo.TROBL_SVC_TYPE_CD,
            this.detailInfo.RUSER_NM,
            this.detailInfo.TRT_STEP_NM,
            this.detailInfo.WRKJOB_PRPS_NM,
            this.detailInfo.ATC_FILE_MANUAL_Y,
            this.detailInfo.SROC_FILE_PATH_NM,
            ]
            //forEach문 안먹혀서 for문으로 적용
            for(var val of checkArr){
                if(val ==""){
                    return false;
                }
            }
        return true;
    },
    save: function(){
        console.log(this.checkContent());
        if(!this.checkContent()){
            alert('필수 내용을 입력하지 않으셨습니다.');
            return;
        }

        //등록하면 유저에 UPLD_CASCNT값 증가(ok)
        this.$http.post("/api/musers/uploadUpdate",{
            users:this.users
        })
        .then(
            (res)=>{
                console.log(res);
            }
        )
        let hour = document.getElementById('hour').value;
        let min = document.getElementById('min').value;

        min = min ==""? 0 :min;
        hour = hour < 10? "0"+hour : hour;
        min = min < 10? "0"+min : min;

        const datetime = hour +":"+ min;
        this.detailInfo.DATA_EXE_TIME = datetime;

        var formData = new FormData();
        var fd = new FormData();
        //그다음 순서
        this.$http.post("/api/mlist/addFile",{
            detailInfo: this.detailInfo,
            users:this.users,
        })
        .then(
            (res) => {
                console.log(res);
                console.log(res.data.data);
                console.log(res.data);
                this.file_seq = res.data.data;
                console.log("this.file_seq", this.file_seq);
                //파일 업로드
                formData.append('filepath', this.file_path);
                formData.append('file_seq', this.file_seq);

                this.$http.post("/api/upload/upload",formData,{
                    headers:{'Content-Type': 'multipart/form-data'},
                    })
                    .then(
                        (response)=>{
                            console.log(response.data);
                        }
                    )
                // 메뉴얼 파일 업로드
                if(this.detailInfo.ATC_FILE_UPLD_PATH_NM !=""){
                    fd.append('filepath', this.detailInfo.ATC_FILE_UPLD_PATH_NM);
                    fd.append('file_seq', this.file_seq);
                    this.$http.post("/api/upload/menu_upload",fd,{
                    headers:{'Content-Type': 'multipart/form-data'},
                    })
                    .then(
                        (response)=>{
                            console.log(response.data);
                        }
                    )
                }

                setTimeout(function(){
                    alert(res.data.message);
                    window.close();
                },1000);
            }
        )
      
    },

    setCode : async function(iter, allCode, callback){
        if(iter > 5) return;
        const cd = ['CDC','SYD','LDC','CEC','RRC','TSC'];
        const code = cd[iter];
        await this.$http.post(`/api/mlist/select/${code}`)
        .then(
            (res) => {
                callback(iter, res,allCode);
            }
        )
        
    },

    callback : function(iter, res, allCode){
        var groupCode = [];
        res.data.forEach(val => {
            groupCode.push({'name':val.CD_NM, 'cd':val.CD_ID});
        }); 
        allCode.push(groupCode); 
        this.setCode(iter+1, allCode, this.callback);
    },

    loadCD: function(){
        this.$http
            .post("/api/musers/userinfo", {
                user_id: JSON.parse(localStorage.getItem('token')).user.user_id
            })
            .then(
            (response) => {
                this.users = response.data[0];
                }
            )

         
        var allCode = [];
        let days = ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'];
        for(let i=1; i<31; i++) 
            days.push(i +'일');
        allCode.push(days);
        this.setCode(0,allCode, this.callback);

        this.select_option = allCode;
    },
    //매뉴얼 파일
    addFile :function(){
        const addBtn = document.getElementsByClassName('addfilebtn');
        addBtn.forEach(btn => {
            var parent = btn.parentNode;
            var file = parent.querySelector('#realFile');
            btn.onclick = () =>{
                file.click();
            } 
        });   
    },
    cancelVal : function(e){
        const parent = e.target.parentNode;
        const fileType = parent.querySelector('#fileType');
        const fileContent = parent.querySelector('#fileContent');
        const delVtn = parent.querySelector('#deletebtn');
        const hr = parent.querySelector('#file_hr');

        fileType.innerHTML = "";
        fileContent.innerHTML = "";
        delVtn.innerHTML = "";
        hr.style.display="none";
    },
    changeVal : function(e){
        if(window.FileReader){ // modern browser
            const filepath = e.target.value; 
            console.log(e.target.files);
            console.log(e.target.files[0]);
            this.file_path = e.target.files[0];
            this.detailInfo.SROC_FILE_PATH_NM = e.target.files[0];
            console.log(this.detailInfo.SROC_FILE_PATH_NM);
            const spltArr_type = filepath.split('.');
            const splthArr_name = filepath.split('\\');
            let filetype = spltArr_type[spltArr_type.length-1];
            let filename = splthArr_name[splthArr_name.length-1];

            const parent = e.target.parentNode;
            console.log(parent);
            
            const fileType = parent.querySelector('#fileType');
            const fileContent = parent.querySelector('#fileContent');
            const delVtn = parent.querySelector('#deletebtn');
            const hr = parent.querySelector('#file_hr');
            fileType.innerHTML = filetype;
            fileContent.innerHTML = filename;
       
            delVtn.innerHTML = "X";
            hr.style.display="block";
            
         } 
    },
    menu_changeVal : function(e){
        if(window.FileReader){ // modern browser
            const filepath = e.target.value; 
            console.log(e.target.files);
            console.log(e.target.files[0]);
            // this.file_path = e.target.files[0];
            this.detailInfo.ATC_FILE_UPLD_PATH_NM = e.target.files[0];
            console.log(this.detailInfo.ATC_FILE_UPLD_PATH_NM);
            const spltArr_type = filepath.split('.');
            const splthArr_name = filepath.split('\\');
            let filetype = spltArr_type[spltArr_type.length-1];
            let filename = splthArr_name[splthArr_name.length-1];

            const parent = e.target.parentNode;
            console.log(parent);
            
            const fileType = parent.querySelector('#fileType');
            const fileContent = parent.querySelector('#fileContent');
            const delVtn = parent.querySelector('#deletebtn');
            const hr = parent.querySelector('#file_hr');
            fileType.innerHTML = filetype;
            fileContent.innerHTML = filename;
       
            delVtn.innerHTML = "X";
            hr.style.display="block";
            
         } 
    },
    check :function(event){
        const parent = event.target.parentNode;
        console.log(this.checkedY);
        if(this.checkedY == "Y") parent.querySelector("input[name='N']").check = false;
    }     
        
        

        
},

created() {
    // Select박스 Option 호출
    this.loadCD();
    console.log(JSON.parse(localStorage.getItem('token')).user);
},
mounted(){
    this.addFile();
}


}
</script>

<style>
.posting{
    margin:40px;
}
.posting .folder_ic{
    width:28px;
    height:22px;
}

.posting .post_title{
    width:100%;
    height:60px;
}
.posting .title{
    padding: 0px 15px;
    
}
.posting .title:focus{
    outline:none;
    
}
.posting .typing{
    width: 510px;
    height: 42px;
    padding: 0px 10px;
    border-radius: 6px;
    box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16);
    background-color: #ffffff;
    
}
.posting .typing:focus{
    outline: solid 1px #5d51eb;
    border-radius: 6px; 
}
.posting .filebox1,
.posting .filebox2{
    display: block !important;
}
.posting .filebox1 .typing,
.posting .filebox2 .typing{
    width: 640px;
    height: 42px;
    padding: 0px 10px;
    border-radius: 6px;
    box-shadow: none;
    background-color: #ffffff;
}
.posting .addfilebtn{
    display: inline-block;
    min-width: 30px !important;
    width: 30px !important;
    height: 30px !important;
    border-radius: 5px;
    /* padding:5px 10px !important; */
    background-color: #d0ffff !important;
    box-shadow: none;
}
.posting .sm_typing:first-child{
    width:200px;
    margin-right: 10px;
}
.posting .sm_typing{
    width:200px;
}
.posting .ic_circle,
.posting .title{
    display: block;
    float: left;
}
.posting .ic_circle{
    width: 55px;
    height: 55px;
    padding: 17px 14px;
    border-radius: 50px;
    background-color: #e5e7fd;
}
.posting .title{
    width: 85%;
    height: 90%;
    margin-left: 20px;
    border-bottom: solid 2.5px #5d51eb;
    font-family: AppleSDGothicNeoEB00;
    font-size: 27px !important;
    font-weight: 700 !important;
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
    vertical-align: middle;
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
.posting .file_list{
    width: 100%;
    
    margin: 10px 0px;
} 
.posting .checkbox{
    width: 18px;
    height: 18px;
    margin: 5px;
    border: solid 1px #707070;
    vertical-align: text-bottom;
    background-color: #ffffff;
}
.posting label{
    margin: 5px 10px!important ;
    font-size: 18px;
    text-align: left;
    color: #3b3b3b;
}
.posting .file_hr{
    opacity: 0.1;
    border: solid 0.5px #707070;
    margin:5px 0px;
}

.height_fit_content{
    height: fit-content !important;
}
.post_btn .close{
    float: right;
    width: 105px;
    height: 40px !important;
    margin: 30px 20px 50px 0px;
    color: #3b2fcb;
    font-size: 14px;
    border-radius: 24px;
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);
    border: solid 3px #3b2fcb;
    background: white;
}
.post_btn .save{
    float: right;
    width: 105px;
    height: 40px !important;
    margin: 30px 20px 50px 0px;
    color: white;
    font-size: 14px;
    border-radius: 24px;
    box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.16);
    border: solid 3px #3a2fca;
    background-color: #3b2fcb !important;
}
/* 선택박스 */
    .posting .v-input__slot{
        width: 510px !important;
        max-height: 42px !important;
        padding: 0px 10px;
        border-radius: 6px;
        box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16) !important;
        background-color: #ffffff;
        border-radius: 6px;
        margin-top:0px !important;  
        
    }
    .posting .v-text-field input{
        max-width: 0px !important;
    }
    .posting .v-text-field.v-text-field--enclosed:not(.v-text-field--rounded) > .v-input__control > .v-input__slot, .v-text-field.v-text-field--enclosed .v-text-field__details{
        padding:0 !important;
    }
    .posting .v-input__append-inner{
        float: right;
        padding: 10px 20px;
    }
    .posting .v-select__selections{
        width: 60% !important;
        float: left;
        max-height: 40px !important;
        padding: 5px 10px;
    }
    .posting .v-text-field.v-text-field--solo:not(.v-text-field--solo-flat) > .v-input__control > .v-input__slot {
        box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16) !important;
    }
    .posting .typing{
        margin-top:5px !important;
    }
    /* 작동시기 */
    .posting .cycle .v-input__slot{
        width: 150px !important;
        max-height: 42px !important;
        padding: 0px 10px;
        border-radius: 6px;
        box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.16) !important;
        background-color: #ffffff;
        border-radius: 6px;
        margin-top:0px !important;  
        vertical-align: middle !important;
        margin-right: 10px;
    }
    .posting .cycle .typing{
         width: 90px !important;
         margin-right: 10px;    
    }   
    .posting .v-input__control{
        height: 42px !important;
        margin-top: 4px;
        
    }

    /* 파일 */
    .posting .fileType,
    .posting .fileContent,
    .posting .deletebtn{
        display: inline-block;
        text-align: left;
        padding:0px 10px;
        cursor:pointer;
    }

    .posting .fileType{
        width:15%;
    }
    .posting .fileContent{
        width:80%;
    }
    .posting .deletebtn{
        width:5%;
        cursor:pointer;  
    }
    /* 중요표시 */
    .posting .necessary{
        color:red;
    }

</style>