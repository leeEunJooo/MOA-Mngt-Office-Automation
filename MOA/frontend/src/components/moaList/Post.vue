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
                <div class="sm_title">담당자</div>
                <div>
                    <input v-model="users.USER_NM" class="typing" disabled/>
                </div>
            </li>
            <li>
                <div class="sm_title">사용자</div>
                <div>
                    <input class="typing" v-model="detailInfo.RUSER_NM"/>
                </div>
            </li>
            <li>
                <div class="sm_title">진행단계</div>
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
                <div class="sm_title">작동시기</div>
                <div class="cycle">
                        <!-- <input class="typing sm_typing" v-model="detailInfo.CYCL_DATE_TYPE_CD"/>
                        <input class="typing sm_typing" v-model="detailInfo.DATA_EXE_TIME"/> -->
                        <v-select
                        :items="select_option[1]"
                        item-text="name"
                        item-value="cd"
                        item-color='#f2f3ff'
                        solo
                        return-object
                        
                        ></v-select>
                        <v-select
                        :items="select_option[0]"
                        item-text="name"
                        item-value="cd"
                        item-color='#f2f3ff'
                        solo
                        return-object
                        
                        ></v-select>
                        
                        <input type="number" min="0" max="100" class="typing"/>
                        <input type="number" min="0" max="100" class="typing"/>
                </div>
            </li>
            <li>
                <div class="sm_title">대상시스템</div>
                <div>
                    <!-- <input class="typing" v-model="detailInfo.SYS_DIV_CD"/> -->
                    <v-select
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
                <div class="sm_title">사용기술</div>
                <div>
                    <!-- <input class="typing" v-model="detailInfo.LANG_CD"/> -->
                    <v-select
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
                <div class="sm_title">실행방법</div>
                <div>
                    <input class="typing" v-model="detailInfo.EXE_SBST"/>
                </div>
            </li>
            <li>
                <div class="sm_title">실행환경</div>
                <!-- <input class="typing" v-model="detailInfo.CONN_EVN_DIV_CD"> -->
                <v-select
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
                <div class="sm_title">실행후결과</div>
                <div>
                    <!-- <input class="typing" v-model="detailInfo.RPY_RESLT_CD"/> -->
                    <v-select
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
                <div class="sm_title">Workaround</div>
                <!-- <input class="typing" v-model="detailInfo.TROBL_SVC_TYPE_CD"/> -->
                <v-select
                    :items="select_option[6]"
                    item-text="name"
                    item-value="cd"
                    item-color='#f2f3ff'
                    solo
                    return-object
                  ></v-select>
            </li>
            <li>
                <div class="sm_title">매뉴얼여부</div>
                <div>
                    <input type="checkbox" class="checkbox" name="Y" v-model="checkedY">
                    <label>Y</label>
                    <input type="checkbox" class="checkbox" name="N" v-model="checkedN">
                    <label>N</label>
                </div>
            </li>
            <li class="height_fit_content">
                <div class="sm_title" style="margin-bottom:5px">매뉴얼파일</div>
                
                <v-btn class="addfilebtn">
                    <img src="../../assets/img/paperclip.png" class=""/>
                </v-btn>    
                
                <!-- 매뉴얼파일 리스트 -->
                <div class="filebox1">
                    <input class="typing file_list" disabled/>
                    <hr class="file_hr"/>
                </div>
            </li>
            <li class="height_fit_content">
                <div class="sm_title" style="margin: 5px 0px">자동화파일</div>
                <v-btn class="addfilebtn">
                    <img src="../../assets/img/paperclip.png" class=""/>
                </v-btn>
                <!-- 자동화파일 리스트 -->
                <div class="filebox2">
                    <input class="typing file_list" disabled/>
                    <hr class="file_hr"/>
                </div>
            </li>
            <li class="height_fit_content" style="margin-top:15px">
                <div class="sm_title" style="margin: 5px 0px">상세설명</div>
                <div class="textarea">
                    <textarea v-model="detailInfo.ATTEN_MTR_SBST">

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
        users: "",
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
            RPY_RESLT_CD:"",
            TROBL_SVC_TYPE_CD:"",
            ATTEN_MTR_SBST:"",
            DOW_NM:"",
            TRT_STEP_NM:"",
            CONN_EVN_DIV_CD:"",
            ATC_FILE_MANUAL_YN:"N",
            ETC_SBST:"",
        },
        checkedY:false,
        checkedN:false,
        
        //Select 박스 Option (name, code)
        select_option:[
            // 0 : select_cycle
            // 1 : select_target_system
            // 2 : select_tech_lng
            // 3 : select_conn_env
            // 4 : select_rpy_result
            // 5 : select_trobl
        ],
    }
},

methods:{
    close_browser: function(){
        window.close();
    },
    save: function(){
        // var checkY = document.querySelector('input[name="Y"]');
        // console.log(checkY);
        // check

            //코드성 변경
            for(let i=0; i<Object.keys(this.detailInfo).length; i++){
                if(Object.keys(this.detailInfo)[i].includes("_CD")){
                    console.log(Object.values(this.detailInfo)[i]);
                    // this.cd_nm = Object.values(this.detailInfo)[i];
                    this.$http.post(`/api/mlist/cdidselect/${Object.values(this.detailInfo)[i]}`)
                    .then(
                        (response)=>{
                            console.log("?????",response.data[0].CD_ID);
                            this.detailInfo[Object.keys(this.detailInfo)[i]] = response.data[0].CD_ID;
                            console.log("this.detailInfo",Object.values(this.detailInfo)[i]);
                        }
                    )   
                }
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

            setTimeout(() => {
                //그다음 순서\
                this.$http.post("/api/mlist/addFile", {
                    detailInfo: this.detailInfo,
                    users:this.users,
                })
                .then(
                    (res) => {
                        console.log(res);
                    }
                )
            },500)
    },

    loadCD: function(){


        this.$http
            .post("/api/musers/userinfo", {
            user_id: JSON.parse(localStorage.getItem('token')).user.user_id
            })
            .then(
            (response) => {
            this.login_state = false;
            console.log(response.data[0].USER_NM);
            this.users = response.data[0];
                }
            )


        // 코드성테이블에서 CD_ID와 CD_NM조회
        var allCode = [];
        const cd = ['CDC','SYD','LDC','CEC','RRC','TSC'];
        for(let i=0;i<cd.length; i++){
            const code = cd[i];
                    this.$http.post(`/api/mlist/select/${code}`)
                    .then(
                        (res) => {
                            var groupCode = [];
                            res.data.forEach(val => {
                                groupCode.push({'name':val.CD_NM, 'cd':val.CD_ID});
                            }); 
                            allCode.push(groupCode);
                        }
                    )
        }
        

        //주기
        let days = ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'];
        for(let i=1; i<31; i++) 
            days.push(i +'일');
        allCode.push(days);

        this.select_option = allCode;
        }
        
        

        
},

created() {
    // Select박스 Option 호출
    this.loadCD();
},
mounted(){
    
    //for문으로 묶어준다
    // this.$http
    // .post("/api/mlist/searchcdinfo",{

    // })
    // .then(
    //     (response) => {
    //         console.log("response", response.data[0]);

    //     }
    // )
    
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
</style>