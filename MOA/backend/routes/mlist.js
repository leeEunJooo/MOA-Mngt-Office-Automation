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
      console.log(rows);
      res.send(rows);
    });
  });

  //목록 등록


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
          if (err) throw err;
          console.log(rows);
          if(rows!=""){
            res.send(rows);
          }else{
            res.send("not found");
          }
        });
      }

      //자동화 명칭(ETC2)
      if(search.search_select_code=="ETC2"){
        connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where NTCART_TITLE_NM LIKE "%'+search.search_text +'%"', function (err, rows) {
          if (err) throw err;
          console.log(rows);
          if(rows!=""){
            res.send(rows);
          }else{
            res.send("not found");
          }
        });
      }

      //전체검색(ETC3)
      if(search.search_select_code=="ETC3"){
        // var sql1 = 'SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM) against("' + search.search_text + '*" in boolean mode)';
        // var sql2 = 'SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE CD_NM LIKE "%' + search.search_text + '%"';
        // var sqlResult;
        
        connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE CD_NM LIKE "%' + search.search_text + '%"', function (err, row) {
          if (err) throw err;
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
            connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM) against("' + search.search_text + '*" in boolean mode)',function(err,row1) {
              if(err) throw err;

              if (row1 != "") {
                console.log("22222 - 코드외 존재");
                console.log("22222 - row1 길이? ", row1.length);
                for (var i = 0; i < row.length; i++) {
                  connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("' + row[i].CD_ID + '*" in boolean mode)',function(err,row2) {
                    // console.log("row : ", row[i].CD_ID);
                    if(err) throw err;
                    // console.log("row2 : ", row2);
                    // console.log("row22 : ", row2[i]);
                    // sqlResult = row2[i];
  
                    // console.log(row1 + row2);
                    
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
                  // console.log("sqlResult : ", sqlResult);
                }
              } else {
                console.log("55555 - 코드외 존재 안함 & 코드성만 존재");
                console.log("55555 - row 길이? ", row.length);
                for (var i = 0; i < row.length; i++) {
                  connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(LANG_CD, SYS_DIV_CD, CYCL_DATE_TYPE_CD, RPY_RESLT_CD, TROBL_SVC_TYPE_CD, CONN_EVN_DIV_CD) against("' + row[i].CD_ID + '*" in boolean mode)',function(err,row2) {
                    // console.log("row : ", row[i].CD_ID);
                    if(err) throw err;
                    // console.log("row2 : ", row2);
                    // console.log("row22 : ", row2[i]);
                    // sqlResult = row2[i];
                    
                    console.log("??", row2);
                    
                    if (row2 != "") {
                      console.log("???", row2);
                      res.send(row2);
                    } 
                    // else {
                    //   // 이 부분 에러 처리 필요
                    //   res.send("not found");
                    // }
                  });
                  // console.log("sqlResult : ", sqlResult);
                }
              }
            });
          } else {
            console.log("88888 - 코드 검색 포함 안함");
            console.log("88888 - row 길이? ", row.length);
            connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq where match(SROC_FILE_PATH_NM, DOW_NM, DATA_EXE_TIME, INPUT_VAL, TRT_STEP_NM, ATTEN_MTR_SBST, ATC_FILE_MANUAL_YN, ATC_FILE_UPLD_PATH_NM, OTPUT_SBST, ETC_SBST, EXE_SBST, NTCART_TITLE_NM, TKCGR_NM, RUSER_NM) against("' + search.search_text + '*" in boolean mode)',function(err,row1) {
              if(err) throw err;

              console.log("??", row1);

              if(row1 != ""){
                console.log("99999 - 코드외만 존재");
                console.log("???", row1);
                res.send(row1);
              }else{
                console.log("10 - 코드성 & 코드외 존재 안함");
                console.log("???", row1);
                res.send("not found");
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
          if(err) throw err;
          if(row!=""){
            //조회한 CD_ID를 가지고 USER_BAS에서 사용자 일련번호를 조회
            connection.query('SELECT CUST_IDFY_SEQ FROM TBL_MOA_USER_BAS WHERE TEAM_DIV_CD = "'+ row[0].CD_ID+'"',function(err,rows){
              if(err) throw err;
              console.log("사용자일련번호 조회");
              console.log(rows);
              for(var i=0; i<rows.length; i++){
                //조회한 사용자 일련번호로 자동화 목록리스트 조회
                connection.query('SELECT NTCART_TITLE_NM, TKCGR_NM, FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE m.CUST_IDFY_SEQ in('+ rows[i].CUST_IDFY_SEQ+')',function(err,row3){
                  if(err) throw err;
                  console.log("자동화목록 조회");
                  console.log(row3);
                  if(row3 != ""){
                    console.log("왔다");
                    res.send(row3);
                  }
                });
              }             
            });
          }else{
            res.send("not found");
          }
        });
      }else{
        //그게 아닌 다른 코드 테이블포함된 경우
        //사용기술(LDC)
        if(search.search_select_code == 'LDC'){
          connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "%' + search.search_text + '%"', function (err, row) {
            if (err) throw err;
            console.log(row);
            if(row!=""){
              connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE LANG_CD = "'+ row[0].CD_ID+'"', function (err, rows) {
                if (err) throw err;
                console.log(rows);
                res.send(rows);
              });
            }else{
              res.send("not found");
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
              connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE SYS_DIV_CD = "'+ row[0].CD_ID+'"', function (err, rows) {
                if (err) res.send("");
                console.log(rows);
                res.send(rows);
              });
            }else{
              res.send("not found");
            }
          });
        }

        //수행시간(CDC)
        if(search.search_select_code == 'CDC'){
          connection.query('SELECT CD_ID FROM TBL_MOA_CD_BAS WHERE ITG_CD_GROUP_ID = "' + search.search_select_code + '" and CD_NM like "%' + search.search_text + '%"', function (err, row) {
            if (err) throw err;
            console.log(row);
            if(row!=""){
              connection.query('SELECT m.NTCART_TITLE_NM, m.TKCGR_NM,m.FIRST_REG_DATE, ifnull(e.EXE_DATE,"0000-00-00 00:00:00") as EXE_DATE FROM TBL_MOA_BAS as m left join TBL_MOA_EXECUTION_TXN as e on e.file_seq = m.file_seq WHERE CYCL_DATE_TYPE_CD = "'+ row[0].CD_ID+'"', function (err, rows) {
                if (err) throw err;
                console.log(rows);
                res.send(rows);
              });
            }else{
              res.send("not found");
            }
          });
        }
        
      };
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
      console.log("1", rows);
      console.log("2", rows[0]);
      
      console.log("!@!@", Object.keys(rows[0])[0]);
      // console.log("!@!@", Object.keys(rows[0]).indexOf[0]);
      // console.log("!@!@", Object.keys(rows[0]).slice(0, 2));
      // console.log("!@!@", Object.keys(rows[0]).find);
      
      for(let i = 0; i < Object.keys(rows[0]).length; i++) {
        console.log("for 들어옴");
        if(Object.keys(rows[0])[i].includes("_CD")) {
          console.log("if 들어옴");
          // console.log(Object.keys(rows[0])[i]);
          // console.log(i);
          // console.log("??????", Object.values(rows[0])[i]);
          // console.log(Object.keys(rows[0])[i].)
          connection.query('SELECT CD_NM FROM TBL_MOA_CD_BAS WHERE CD_ID = "'+ Object.values(rows[0])[i]+'"',function(err,row2){
            console.log("두 번째 쿼리");
            if(err) throw err;
            console.log("!!!", row2[0].CD_NM);
            // console.log(rows[0][i]);.
            // rows[0][i].values = row2[0].CD_NM;
            // Object.keys(rows[0])[i].values = row2[0].CD_NM;
            console.log("###", Object.keys(rows[0])[i]);
            console.log("$$$", Object.values(rows[0])[i]);
            // Object.values(rows[0])[i] = row2[0].CD_NM;
            
            console.log("---0", rows[0]['CYCL_DATE_TYPE_CD']);

            console.log("---1", rows[0][Object.keys(rows[0])[i]]);

            rows[0][Object.keys(rows[0])[i]] = row2[0].CD_NM;
            
            console.log("---2", rows[0][Object.keys(rows[0])[i]]);
            // console.log("%%%", rows);

            // console.log("@@@", Object.values(rows[0])[i]);
            // Object.keys(rows[0])[i] = row2[0].CD_NM;
            // console.log("@@@", Object.values(rows[0])[i]);
            // console.log("###", Object.keys(rows[0])[i]);
            
            // res.send(row2);

            console.log("??", rows[0]);
          });
          console.log("next");
      }
      // console.log(Object.keys(rows[0]).length);
      // console.log("###", rows[0].CYCL_DATE_TYPE_CD);
    }
    console.log("~~~", rows[0]);

    res.send(rows);

    });
  });


//코드성조회
  router.post('/codeselect/:cd_nm', function(req,res){
    const cd_nm = req.params.cd_nm;
    console.log("??????????",cd_nm);
    connection.query('SELECT CD_NM FROM TBL_MOA_CD_BAS WHERE CD_ID = "'+ cd_nm+'"',function(err,row2){
      if(err) throw err;
      console.log("11111111111", row2[0].CD_NM);
      console.log("22222222222", row2);
      res.send(row2);
    });
  });

module.exports = router;