var express = require('express');
var router = express.Router();
const bcrypt = require('bcryptjs');

const conn = require('./dbConnection.js');

// Connection 객체 생성
var connection = conn.connection;

  //목록 ALL 조회
  router.get('/selectList', function (req, res) {
    console.log("메인");
    connection.query('SELECT m.FILE_SEQ, m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq ', function (err, rows) {
      if (err) throw err;
      console.log("~?", rows);
      res.send(rows);
    });
  });

  
  //CD_ID, CD_NM조회
  router.post('/select/:group_id', function(req,res){
    const group_id = req.params.group_id;
    console.log("group_id", group_id);
      connection.query('SELECT CD_ID, CD_NM FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID="'+group_id+'"', function(err,rows){
        if(err) throw err;
        // console.log(rows);
        res.send(rows);
      })
  });




  //코드성 조회(CD_ID조회)
  router.post('/cdidselect/:cd_nm', function(req,res){
    const cd_nm = req.params.cd_nm;
    connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE CD_NM = "'+ cd_nm+'"',function(err,row2){
      if(err) throw err;
      console.log(row2[0].CD_ID);
      res.send(row2);
    });
  });

  //목록 등록
  router.post('/addFile',  function(req, res){
    console.log("자동화 목록 등록");
    const detailInfo = {
      'CUST_IDFY_SEQ':req.body.users.CUST_IDFY_SEQ,
      'SROC_FILE_PATH_NM':req.body.detailInfo.SROC_FILE_PATH_NM,
      'NTCART_TITLE_NM':req.body.detailInfo.NTCART_TITLE_NM,
      'TKCGR_NM':req.body.users.USER_NM,
      'RUSER_NM':req.body.detailInfo.RUSER_NM,
      'CYCL_DATE_TYPE_CD':req.body.detailInfo.CYCL_DATE_TYPE_CD.cd,
      'DATA_EXE_TIME':req.body.detailInfo.DATA_EXE_TIME,
      'SYS_DIV_CD':req.body.detailInfo.SYS_DIV_CD.cd,
      'LANG_CD':req.body.detailInfo.LANG_CD.cd,
      'EXE_SBST':req.body.detailInfo.EXE_SBST,
      'INPUT_VAL':req.body.detailInfo.INPUT_VAL,
      'OTPUT_SBST':req.body.detailInfo.OTPUT_SBST,
      'RPY_RESLT_CD':req.body.detailInfo.RPY_RESLT_CD.cd,
      'TROBL_SVC_TYPE_CD':req.body.detailInfo.TROBL_SVC_TYPE_CD.cd,
      'ATTEN_MTR_SBST':req.body.detailInfo.ATTEN_MTR_SBST,
      'ATC_FILE_MANUAL_YN':req.body.detailInfo.ATC_FILE_MANUAL_YN,
      'CONN_EVN_DIV_CD':req.body.detailInfo.CONN_EVN_DIV_CD.cd,
      'DOW_NM':req.body.detailInfo.DOW_NM,
      'TRT_STEP_NM':req.body.detailInfo.TRT_STEP_NM,
      'ETC_SBST':req.body.detailInfo.ETC_SBST,
      'ATC_FILE_UPLD_PATH_NM':req.body.detailInfo.ATC_FILE_UPLD_PATH_NM,
      'DTL_DESC_SBST':req.body.detailInfo.DTL_DESC_SBST,
      'FNS_DATE':"9999-12-31",

    };
    console.log('cust_idfy_seq', detailInfo);
    console.log(detailInfo.CUST_IDFY_SEQ);
    console.log(detailInfo.CYCL_DATE_TYPE_CD);
    //자동화목록등록
    connection.query('INSERT INTO TBL_MOA_BAS (CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, FIRST_REG_DATE, CHG_DATE, FNS_DATE,DTL_DESC_SBST) VALUES ("' + detailInfo.CUST_IDFY_SEQ + '","'+ detailInfo.SROC_FILE_PATH_NM+'", "' + detailInfo.LANG_CD + '", "' + detailInfo.SYS_DIV_CD + '","' + detailInfo.CYCL_DATE_TYPE_CD + '","' + detailInfo.DOW_NM + '","' + detailInfo.DATA_EXE_TIME +'","' + detailInfo.RPY_RESLT_CD+'","' + detailInfo.TROBL_SVC_TYPE_CD  +'","' + detailInfo.INPUT_VAL +'","' + detailInfo.TRT_STEP_NM +'","' + detailInfo.CONN_EVN_DIV_CD +'","' + detailInfo.ATTEN_MTR_SBST+'","' + detailInfo.ATC_FILE_MANUAL_YN+'","' + detailInfo.ATC_FILE_UPLD_PATH_NM+'","' + detailInfo.OTPUT_SBST +'","' + detailInfo.ETC_SBST+'","' + detailInfo.EXE_SBST +'","' + detailInfo.NTCART_TITLE_NM +'","' + detailInfo.TKCGR_NM+'","' +detailInfo.RUSER_NM+'",sysdate(), sysdate(),"'+detailInfo.FNS_DATE+'","'+detailInfo.DTL_DESC_SBST+'")', detailInfo, function (err, row){
      if(err) throw err;
      console.log(row);
      console.log("insertid ",row[0]);
      if(row!=null){
        //file_seq 조회
        connection.query('SELECT FILE_SEQ FROM TBL_MOA_BAS ORDER BY FILE_SEQ DESC limit 1',function(err,rows){
          if(err) throw err;
          console.log(rows[0].FILE_SEQ);
          //이력테이블 등록
          connection.query('INSERT INTO TBL_MOA_HST (FILE_SEQ,CUST_IDFY_SEQ, SROC_FILE_PATH_NM, LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, DOW_NM, DATA_EXE_TIME, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, INPUT_VAL, TRT_STEP_NM, CONN_EVN_DIV_CD, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM, ST_DATE, FNS_DATE, LAST_HST_YN, FILE_UPD_YN, STTUS_DIV_CD,DTL_DESC_SBST) VALUES ("'+rows[0].FILE_SEQ+'","' + detailInfo.CUST_IDFY_SEQ + '","'+ detailInfo.SROC_FILE_PATH_NM+'", "' + detailInfo.LANG_CD + '", "' + detailInfo.SYS_DIV_CD + '","' + detailInfo.CYCL_DATE_TYPE_CD + '","' + detailInfo.DOW_NM + '","' + detailInfo.DATA_EXE_TIME +'","' + detailInfo.RPY_RESLT_CD+'","' + detailInfo.TROBL_SVC_TYPE_CD  +'","' + detailInfo.INPUT_VAL +'","' + detailInfo.TRT_STEP_NM +'","' + detailInfo.CONN_EVN_DIV_CD +'","' + detailInfo.ATTEN_MTR_SBST+'","' + detailInfo.ATC_FILE_MANUAL_YN+'","' + detailInfo.ATC_FILE_UPLD_PATH_NM+'","' + detailInfo.OTPUT_SBST +'","' + detailInfo.ETC_SBST+'","' + detailInfo.EXE_SBST +'","' + detailInfo.NTCART_TITLE_NM +'","' + detailInfo.TKCGR_NM+'","' +detailInfo.RUSER_NM+'",sysdate(),"'+detailInfo.FNS_DATE+'","Y","Y","R","'+detailInfo.DTL_DESC_SBST+'")',detailInfo,function(err,row2){
            if(err) throw err;
            console.log(row2);
            if(row2!=""){
            res.json({
              success: true,
              message: '등록이 완료되었습니다.',
            })
          }else{
            res.json({
              success: false,
              message: '등록이 실패하였습니다.',
            })
          }
          });
        });
      }else{
        res.json({
          success: false,
          message: '등록이 실패하였습니다.'
        })
      }
    });

  });


  //목록 수정

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //목록 검색
  router.post('/search', function (req, res) {
    console.log("목록 검색");

    const search = {
      'search_select_code': req.body.search_select.code,
      'search_text': req.body.search_text,
    };

    console.log("search_select_code : ", search.search_select_code);
    console.log("search_text : ", search.search_text);


    // if문으로 대분류 확인
    if (search.search_select_code.includes("ETC")) {
      console.log("코드 테이블에 포함되어 있지 않은 경우");
      //담당자(ETC1)
      if(search.search_select_code=="ETC1"){
        connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where TKCGR_NM LIKE "%'+search.search_text +'%"', function (err, rows) {
          if (err) res.send("");
          console.log(rows);
          if(rows!=""){
            res.send(rows);
          }else{
            res.send("");
          }
        });
      }

      //자동화 명칭(ETC2)
      if(search.search_select_code=="ETC2"){
        connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where NTCART_TITLE_NM LIKE "%'+search.search_text +'%"', function (err, rows) {
          if (err) res.send("");
          console.log(rows);
          if(rows!=""){
            res.send(rows);
          }else{
            res.send("");
          }
        });
      }

      //전체검색(ETC3)
      if(search.search_select_code=="ETC3"){
        // var sql1 = 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM) against("' + search.search_text + '*" in boolean mode)';
        // var sql2 = 'SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE CD_NM LIKE "%' + search.search_text + '%"';
        // var sqlResult;
        connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE CD_NM LIKE "%' + search.search_text + '%"', function (err, row) {
          if (err) res.send("");
          // console.log(rows);
          
          // console.log("results[0] : ", row[0].CD_ID);
          // console.log("results[1] : ", row[1].CD_ID);

          // var sql1_result = row[0];
          // var sql2_result = row[1];

          // console.log("sql1_result : " + sql1_result);
          // console.log("sql2_result : " + sql2_result);

          if (row != "") {
            console.log("11111 - 코드 검색 포함");
            console.log("11111 - row 길이? ", row.length);
            connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM,DTL_DESC_SBST) against("' + search.search_text + '*" in boolean mode)',function(err,row1) {
              if(err) throw err;

              if (row1 != "") {
                console.log("22222 - 코드외 존재");
                console.log("22222 - row1 길이? ", row1.length);
                for (var i = 0; i < row.length; i++) {
                  connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("' + row[i].CD_ID + '*" in boolean mode)',function(err,row2) {
                    if (err) res.send("");

                    console.log("!!", row1);
                    console.log("@@", row2);

                    if (row2 != "") {
                      console.log("33333 - 코드성 존재 & 코드외 존재");
                      console.log("33333 - row2 길이? ", row2.length);
                      console.log("!!!", row1);
                      console.log("@@@", row2);

                      res.json({
                        row1 : row1,
                        row2 : row2,
                      });
                    } else {
                      console.log("!!!!", row1);
                      console.log("@@@@", row2);
                      console.log("44444 - 코드외만 존재");

                      res.send(row1);
                    }
                  });
                }
              } else {
                console.log("55555 - 코드외 존재 안함 & 코드성만 존재");
                console.log("55555 - row 길이? ", row.length);
              
                for (var i = 0; i < row.length; i++) {
                  connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("' + row[i].CD_ID + '*" in boolean mode)',function(err,row2) {
                    if (err) res.send("");
                    
                    console.log("??", row2);

                    if (row2 != "") {
                      console.log("row2 길이? ", row2.length);
                      console.log("???", row2);
                      res.send(row2);
                    } else {
                      console.log("row2 길이? ", row2.length); 
                    }
                  });
                }
              }
            });
          } else {
            console.log("88888 - 코드 검색 포함 안함");
            console.log("88888 - row 길이? ", row.length);
            connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM,DTL_DESC_SBST) against("*' + search.search_text + '*" in boolean mode)',function(err,row1) {
              if(err) throw err;

              console.log("??", row1);

              if(row1 != ""){
                console.log("99999 - 코드외만 존재");
                console.log("???", row1);
                res.send(row1);
              }else{
                console.log("10 - 코드성 & 코드외 존재 안함");
                console.log("???", row1);
                res.send("");
              }
            });
          }
        });  
      }
      

    } else {
      console.log("코드 테이블에 포함되어 있는 경우");
      //팀(TDC)일 경우
      if(search.search_select_code == "TDC"){
        console.log("팀일 경우");
        //팀의 CD_ID를 조회
        connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "%' + search.search_text + '%"', function (err, row) {
          console.log("row 길이 ?.? ", row.length);
          if (err) res.send("");
          if(row != ""){
            //조회한 CD_ID를 가지고 USER_BAS에서 사용자 일련번호를 조회
            connection.query('SELECT CUST_IDFY_SEQ FROM TBL_MOA_USER_BAS WHERE TEAM_DIV_CD = "'+ row[0].CD_ID+'"',function(err,rows){
              if(rows != "") {
                console.log("rows 길이 ?.? ", rows.length);
                if (err) res.send("");
                console.log("사용자일련번호 조회");
                console.log(rows);
                const value = [];
                for(let i=0; i<rows.length; i++){
                  value.push(rows[i].CUST_IDFY_SEQ);
                }
                console.log(value);
                  //조회한 사용자 일련번호로 자동화 목록리스트 조회
                  connection.query('SELECT NTCART_TITLE_NM, TKCGR_NM, FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE m.CUST_IDFY_SEQ in ('+ value+')',function(err,row3){
                    if(err) throw err;
                    console.log("자동화목록 조회");
                    console.log(row3);
                    if(row3 != ""){
                      console.log("왔다");
                      res.send(row3);
                    } 
                  });
              } else {
                res.send("");
              }   
            });
          }else{
            res.send("");
          }
        });
      } else {
        //그게 아닌 다른 코드 테이블포함된 경우
        //사용기술(LDC)
        if(search.search_select_code == 'LDC'){
          connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "%' + search.search_text + '%"', function (err, row) {
            if (err) res.send("");
            console.log(row);
            if(row!=""){
              let value = '';
              for(let i=0; i<row.length; i++){
                value+=("'"+row[i].CD_ID + "'");
                if(i == row.length-1) continue;
                value+=",";
              }
              console.log(value);
              connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE LANG_CD in ('+value+')', function (err, rows) {
                if (err) throw err;
                console.log(rows);
                res.send(rows);
              });
            }else{
              res.send("");
            }
          });
        }

        //대상시스템(SYD)
        if(search.search_select_code == 'SYD'){
          connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "%' + search.search_text + '%"', function (err, row) {
            if (err) res.send("");
            console.log(row);
            console.log(row[0]);
            // console.log(row[0].CD_ID);
            // res.send(row);
            if(row!=""){
              let value = '';
              for(let i=0; i<row.length; i++){
                value+=("'"+row[i].CD_ID + "'");
                if(i == row.length-1) continue;
                value+=",";
              }
              console.log(value);
                connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE SYS_DIV_CD in ('+value+')', function (err, rows) {
                  if (err) res.send("");
                  console.log(rows);
                  res.send(rows);
                });
            }else{
              res.send("");
            }
          });
        }

        //수행시간(CDC)
        if(search.search_select_code == 'CDC'){
          connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "%' + search.search_text + '%"', function (err, row) {
            if (err) res.send("");
            console.log(row);
            if(row!=""){
              let value = '';
              for(let i=0; i<row.length; i++){
                value+=("'"+row[i].CD_ID + "'");
                if(i == row.length-1) continue;
                value+=",";
              }
              console.log(value);
              connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE CYCL_DATE_TYPE_CD in ('+value+')', function (err, rows) {
                if (err) throw err;
                console.log(rows);
                res.send(rows);
              });
            }else{
              res.send("");
            }
          });
        }
        
      };
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //검색(팀)

    // 공통코드가서 맞는거 가지고 오기

    // tbl_moa_bas에서 맞는거 뿌려주기

    // connection.query('SELECT * FROM TBL_MOA_BAS', function (err, rows) {
    //   if (err) throw err;
    //   console.log(rows);
    //   res.send(rows);
    // });
  });

  //목록 상세 조회
  router.post('/listDetail/:id', function (req, res) {
    const id = parseInt(req.params.id);
    connection.query('SELECT * FROM TBL_MOA_BAS WHERE FILE_SEQ='+id, function (err, rows) {
      if (err) throw err;
      console.log(rows);
      res.send(rows);
    });
  });

 

//코드성조회(cd_nm 조회)
  router.post('/codeselect/:cd_nm', function(req,res){
    const cd_nm = req.params.cd_nm;
    // console.log("??????????",cd_nm);
    connection.query('SELECT CD_NM FROM TBL_MOA_CD_BAS WHERE CD_ID = "'+ cd_nm+'"',function(err,row2){
      if(err) throw err;
      // console.log(row2[0].CD_NM);
      res.send(row2);
    });
  });

module.exports = router;