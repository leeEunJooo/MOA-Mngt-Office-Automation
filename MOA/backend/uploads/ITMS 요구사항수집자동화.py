import time
import win32com.client as win32
from datetime import datetime, timedelta
from dateutil.relativedelta import relativedelta
import re
import os
import pandas as pd
import zipfile
import win32clipboard

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

login_id = ''
login_pw = ''

chrome_options = Options()
chrome_options.add_argument("--headless")

driver = webdriver.Chrome(r'D:\업무화일\01.개발\14.SR자동분배\SR자동접수_20190918\chromedriver.exe')
                          #, options=chrome_options)  # 드라이버사용

Vivace_Url        = 'http://vivace.kos.kt.com/services/LoginSO.do'
Vivace_Id_Path    = 'userId'
Vivace_Pw_Path    = 'userPassWord'
Vivace_Login_path = '//*[@id="login"]'

Itms_Url        = 'http://itms.kt.com/itmsapp/itms/portal/login.jsp'
Itms_Id_Path    = 'USERID'
Itms_Pw_Path    = 'pw'
Itms_Login_path = '/html/body/div/form/input[2]'

Mail_Url        = 'https://groupmail.kt.co.kr/login'
Mail_Id_Path    = 'ipt-id'
Mail_Pw_Path    = 'ipt-pw'
Mail_Login_path = '/html/body/div[1]/div/div/form/button'

toyear  = time.strftime('%Y', time.localtime(time.time()))
tomonth = time.strftime('%Y%m', time.localtime(time.time())) #임의수정
nextmonth = (datetime.now() + relativedelta(months=1)).strftime('%m') #임의수정

#tomonth = '202105'
#nextmonth = '06'

path = 'D:\Python\ITMS_요구사항분석서작성_자동화'
zip_file = path + '\\' + tomonth + '.zip'
vivace_file = r'C:\Users\KTDS\Downloads\과제 확정_유선KT_'+ toyear +'-'+ nextmonth +'.xlsx'

Lob_Group= {'대우석' : 'PSTN'
           ,'남진홍' : 'SOIP'
           ,'주미선' : 'KOS공통'
           ,'배성현' : '전용회선'
           ,'전태환' : 'TV'
           ,'성다영' : '인터넷'
           #,'김정원' : '유선공통'
           ,'이재룡' : 'ICIS공통'
           ,'장진원' : '지능망' }
No_SR_List = []

def main():
    print('ITMS 요구사항수집자동화.main Start')

    #SearchSR()
    Download_Vivace(driver) #Vivace 수집
    markdir()
    SerchItms_ExcelWrite(driver)
    zipfiellist()
    SndEmail(driver, Mail_Url,Mail_Id_Path,Mail_Pw_Path,Mail_Login_path)

def cleanText(readData):
    #텍스트에 포함되어 있는 특수 문자 제거
    text = re.sub('[-=+,#/\?:^$.@*\"※~&%ㆍ!』\\‘|\[\]\<\>`\'…》]', '', readData)
    return text

def Seach_File(path):
    File_list = []
    for path, dir, files in os.walk(path):
        if len(files) > 0:
            for file_name in files:
                File_list.append(file_name)
    return File_list
"""
def SearchSR():
    path = 'D:\Python\ITMS_요구사항분석서작성_자동화\요구사항정의서작성대상.sql'
    with open(path, 'r') as f:
        content = f.readlines()

    for x in content:
        SRList.append(x.strip())
"""
def markdir():
    # 해당 경로에 담당자 별 폴더 생성
    FileList = os.listdir(path)
    os.chdir(path)

    if tomonth not in FileList:
        os.mkdir(tomonth)
        os.chdir(tomonth)
        for Lob in Lob_Group.values():
            os.mkdir(Lob)

def login(driver,Url,Id_Path, Pw_Path,Login_path, login_id=login_id, login_pw=login_pw):
    print(Url, '로그인 시작')

    driver.get(Url)
    driver.maximize_window()

    time.sleep(0.5)

    login = driver.find_element_by_id(Id_Path)
    login.clear()
    login.send_keys(login_id)  # 로그인 할 계정
    loginpw = driver.find_element_by_id(Pw_Path)
    loginpw.clear()
    loginpw.send_keys(login_pw)  # 로그인 할 계정 패스워드

    time.sleep(0.5)

    driver.find_element_by_xpath(Login_path).click()  # 로그인버튼 클릭

    time.sleep(0.5)

    print(Url, '로그인 종료')

def Download_Vivace(driver):
    if os.path.isfile(vivace_file):
        os.remove(vivace_file)
        print('기존에 생성된 과제확정 파일을 제거 합니다. 파일명 : ' + vivace_file)

    #Vivace 로그인
    login(driver, Vivace_Url, Vivace_Id_Path, Vivace_Pw_Path, Vivace_Login_path)

    print('Vivace 수집 시작')

    # 스팩사이트 이동
    driver.get('http://vivace.kos.kt.com/services/dev/pages/biz/dev-confirm?')

    #과제 확정 클릭
    WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.XPATH, '//*[@id="referrer"]/li[3]/a'))).click()
    time.sleep(0.5)

    #조회(돋보기) 클릭
    driver.find_element_by_xpath('//*[@id="searchForm"]/a').click()

    WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.XPATH, '//*[@id="tuiGrid"]/div/div[1]/div[1]/div[2]/div/div[1]/table/tbody/tr[1]/td[2]/div/p')))

    # 다운로드 클릭
    driver.find_element_by_xpath('//*[@id="download"]').click()
    time.sleep(2)

    #driver.close()

    print('Vivace 수집 종료')

def SerchItms_ExcelWrite(driver):

    print('과제내역 수집 시작')

    #read_excel  = pd.read_excel(r'C:\Users\KTDS\Downloads\2021년5월 유선영업시스템 개발과제_마스터_v2.xlsx', header=1, encoding='CP949')
    read_excel = pd.read_excel(vivace_file, encoding='CP949')

    #SR_Decide   = read_excel[['SR번호', '오더\n확정 결과', '담당자\n오더)']]
    SR_Decide = read_excel[['SR번호', '오더확정', '오더담당자']]
    SR_Decide_1 = SR_Decide.dropna(axis=0).reset_index(drop=True)
    #SR_Decide_2 = SR_Decide_1[SR_Decide_1['오더\n확정 결과'].str.contains('대상|장기|증액|개발|프로젝트')]
    #SR_List     = SR_Decide_2[SR_Decide_2['오더\n확정 결과'].str.contains('FT|개발완료|이월') == False].reset_index(drop=True).values.tolist()
    SR_Decide_2 = SR_Decide_1[SR_Decide_1['오더확정'].str.contains('LONG|DEV|DEVF|PROJECT|ETC')] #중기,개발,개발(F),프로젝트,기타
    SR_List     = SR_Decide_2.reset_index(drop=True).values.tolist()

    print('과제내역 수집 종료')

    Path_List = Seach_File(path + '\\' + tomonth)
    seq_num = 0

    print('SR 생성 총건수 :' + str(len(SR_List)))

    #ITSM 로그인
    login(driver, Itms_Url, Itms_Id_Path, Itms_Pw_Path, Itms_Login_path)

    for SR in SR_List:
        seach_dr = SR[0]
        print('순번 : ', seq_num, '(', seach_dr, ') 수집 시작')

        if any(seach_dr in File_List for File_List in  Path_List):
            print('이미 생성 된 Excel 파일이 존재합니다. DR : ',seach_dr )
            seq_num += 1
        elif seach_dr == '미등록':
            print('SR 번호에 문자열이 포함되어 있습니다. DR : ', seach_dr)
            seq_num += 1
        elif seach_dr.split('-')[2].isdigit() == 0:
            print('SR 번호에 문자열이 포함되어 있습니다. DR : ',seach_dr)
            seq_num += 1
        else:
            # 검색화면 이동
            driver.get('http://itms.kt.com/itmsapp/itms/pim/request/search_request_pop.jsp?radioCheckValue=')
            time.sleep(0.5)

            driver.find_element_by_name('number').send_keys(seach_dr) # DR 입력
            driver.find_element_by_xpath('/html/body/form/div[1]/div[2]/div[3]/button[1]').click() # 검색 클릭

            iframes = driver.find_elements_by_tag_name('iframe')
            driver.switch_to_frame(iframes[0])
            WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.XPATH, '/html/body/form/table/tbody/tr[2]/td[2]/font/a'))).click() # 첫번째 요구사항 클릭

            time.sleep(3)

            handles = driver.window_handles
            driver.switch_to.window(handles[1])

            time.sleep(0.5)

            if driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[1]/tbody/tr[6]/td').text == '개발요청':

                request_office_code = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[1]/tbody/tr[3]/td[2]').text                 #요청자소속
                requestor           = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[1]/tbody/tr[3]/td[1]/a').text.split('/')[0] #요청자명
                complete_hope_day   = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[1]/tbody/tr[5]/td').text                    #완료희망일
                request_day         = complete_hope_day[0:8] + '01'                                                                                 #요청일
                rcv_day             = complete_hope_day[0:8] + '01'                                                                                 #접수일
                title               = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[1]/tbody/tr[2]/td').text                    #요청제목
                take_type           = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[3]/tbody/tr[5]/td').text                    #과제 유형
                request_purpose     = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[3]/tbody/tr[3]/td').text                    #개발요청요약
                requirement         = driver.find_element_by_xpath('/html/body/form/div[1]/div[3]/table[3]/tbody/tr[4]/td/div').text                #요청내용

                driver.close()
                driver.switch_to.window(handles[0])

                time.sleep(0.5)

                # 엑셀파일 편집 및 저장
                excel = win32.Dispatch("Excel.Application")
                excel.Visible = True

                #성장형/유지형 파일 분리
                if SR[2] in ('성다영','전태환','남진홍','안혜경'):
                    workbook = excel.Workbooks.Open('D:\Python\ITMS_요구사항분석서작성_자동화\템플릿_IT기능정의서_(요구사항번호)_요구사항명_v1.0_성장형.xlsx')
                else:
                    workbook = excel.Workbooks.Open('D:\Python\ITMS_요구사항분석서작성_자동화\템플릿_IT기능정의서_(요구사항번호)_요구사항명_v1.0.xlsx')
                sheet = workbook.Sheets("요구사항분석서")

                sheet.Cells( 3, 5).Value = seach_dr              # 요청번호
                sheet.Cells( 4, 5).Value = request_office_code   # 요청자소속
                sheet.Cells( 4, 6).Value = requestor             # 요청자명
                sheet.Cells( 6, 5).Value = complete_hope_day     # 완료희망일
                sheet.Cells( 5, 5).Value = request_day           # 요청일
                sheet.Cells( 7, 5).Value = rcv_day               # 접수일
                sheet.Cells( 8, 5).Value = title                 # 요청제목
                sheet.Cells( 9, 5).Value = take_type             # 과제 유형
                sheet.Cells(10, 5).Value = request_purpose       # 개발요청요약
                sheet.Cells(11, 5).Value = requirement           # 요청내용
                sheet.Cells(16, 5).Value = '40'                  # 예상공수
                sheet.Cells(22, 5).Value = '정규'                # 정규/비정규
                sheet.Cells(24, 5).Value = title                 # 요구명

                # 성장형/유지형 입력 변경
                if SR[2] in ('성다영','전태환','남진홍'):
                    sheet.Cells(17, 5).Value = '서비스 및 제도변경' # 유지보수유형
                    sheet.Cells(25, 5).Value = title                # 요구사항
                else:
                    sheet.Cells(17, 5).Value = '처리기준 변경'   # 유지보수유형

                sheet.Cells(26, 5).Value = '요구사항분석서 참조' # 변경전 상태
                sheet.Cells(27, 5).Value = '요구사항분석서 참조' # 변경후 상태
                sheet.Cells(28, 5).Value = '요구사항분석서 참조' # 테스트 내용
                sheet.Cells(30, 5).Value = '▣ ' + title + '\n'   # 개요

                if SR[2] not in ('성다영', '전태환', '남진홍'):
                    sheet.Cells(47, 5).Value =  complete_hope_day  # 업무적용(예정)

                time.sleep(0.5)

                #담당자 SR 별로 엑셀 저장
                for key, value in Lob_Group.items():
                    if key in SR[2]:
                        sheet.Cells(14, 5).Value = key  # 구현담당자
                        sheet.Cells(15, 5).Value = key  # 개발담당자
                        excel_name = path + '\\' + tomonth + '\\' + value + '\\' + 'IT기능정의서_(' + seach_dr + ')_' + cleanText(title) + '_v1.0.xlsx'
                        print('엑셀 저장      : ' , excel_name)
                        workbook.SaveAs(excel_name)
                        print('엑셀 저장 완료 : ', excel_name)
                workbook.Close()

                print('순번 : ', seq_num, '(', seach_dr, ') 수집 종료')

                seq_num += 1

                #workbook.Close()
            else:
                print('요청구분이 개발요청이 아닙니다 : ', seach_dr)
                driver.close()
                seq_num += 1
                driver.switch_to.window(handles[0])
                No_SR_List.append(seach_dr)

    #excel.quit()

#폴더별 압축하기
def zipfiellist():
    print('압축 시작')

    print(zip_file)
    print(os.path.isfile(zip_file))
    if os.path.isfile(zip_file):
        os.remove(zip_file)
        print('기존에 생성된 압축파일을 제거 합니다.')

    with zipfile.ZipFile(zip_file, 'w') as myZip:
        # 압축 대상 경로
        des_folder = path + '\\' + tomonth
        # os 모듈로 해당 경로의 파일을 취득한다.(os.walk는 경로의 하위 폴더까지 취득한다.)
        for folder, subfolders, files in os.walk(des_folder):
            # os.walk로 파일 리스트를 받아 루프를 돌린다.
            for file in files:
                # folder와 files명은 다른 변수로 취득된다. 두 변수값으로 파일 절대 경로를 만든다.
                full_name = os.path.join(folder, file)

                # write은 압축 파일에 파일을 쓰는 것이다. 파라미터는 대상 파일, 저장될 경로로 지정된다.
                # 압축 파일에 저장될 경로는 \기준으로 상대 경로로 작성해야 한다.
                myZip.write(full_name, os.path.relpath(full_name, des_folder))

    print('압축 종료')

def SndEmail(driver, Mail_Url,Mail_Id_Path,Mail_Pw_Path,Mail_Login_path):
    login(driver, Mail_Url,Mail_Id_Path,Mail_Pw_Path,Mail_Login_path)
    time.sleep(5)

    driver.find_element_by_xpath('//*[@id="mainPane_cr_view_main"]/div[1]/div[1]/button').click()  # 메일쓰기 클릭
    time.sleep(3)

    cc = '200562845@ktfriend.com,200363217@ktfriend.com,91287101@ktfriend.com,'
    driver.find_element_by_xpath('//*[@id="adr-cc-ipt_ta"]').send_keys(cc) #참조 넣기(이재룡,장진원,배성현)
    time.sleep(1)

    driver.find_element_by_xpath('//*[@id="mcp_wrap"]/div[1]/dl[2]/dd/div[1]').click()
    time.sleep(1)
    """
    to = 'O#7126271014%%0@kt.com'
    driver.find_element_by_xpath('//*[@id="adr-to-ipt_ta"]').send_keys(to)
    time.sleep(1)"""

    driver.find_element_by_xpath('/html/body/div[2]/div[2]/div/div/div/div[2]/div/div[4]/div[2]/div[2]/div[3]/div[2]/div[1]/dl[2]/dd/div[2]').click() #받는 사람 클릭
    time.sleep(2)
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardText('고객개발2팀')
    #win32clipboard.SetClipboardText('O#7126271014%%0@kt.com')
    win32clipboard.CloseClipboard()

    # 클립보드 내용 붙여넣기
    ActionChains(driver).key_down(Keys.CONTROL).send_keys('v').key_up(Keys.CONTROL).perform()
    time.sleep(2)

    driver.find_element_by_id('compose_subject').send_keys('[공유]익월 LOB별 요구사항분석서')
    time.sleep(0.5)

    driver.find_element_by_xpath('//*[@id="uploaderFileBtn"]').send_keys(zip_file) #파일 첨부

    driver.switch_to_default_content()
    iframes = driver.find_elements_by_tag_name('iframe')
    driver.switch_to_frame(iframes[0])
    driver.find_element_by_xpath('/html/body').click()  # 본문 선택


    # 클립보드에 내용 저장
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardText('익월 LOB별 요구사항분석서 기초자료 작성해서 보내드립니다.\n자동화 테스트 자료입니다.')
    win32clipboard.CloseClipboard()

    # 클립보드 내용 붙여넣기
    ActionChains(driver).key_down(Keys.CONTROL).send_keys('v').key_up(Keys.CONTROL).perform()
    time.sleep(2)

    driver.switch_to_default_content()

    # 메일 보내기
    driver.find_element_by_xpath('//*[@id="center-tbar"]/div[3]/button[1]').click()
    time.sleep(30)

    # Chrome 종료
    driver.close()

if __name__ == '__main__':
    main()