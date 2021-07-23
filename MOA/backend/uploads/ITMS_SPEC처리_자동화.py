import time
from calendar import monthrange
from datetime import date, timedelta, datetime
import re
import pandas as pd
import os
from dateutil.relativedelta import relativedelta

pd.set_option('display.max_rows', 300)
pd.set_option('display.max_columns', 80)

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import Select

from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait

"""
SPC21022536308,7,cawking@kt.com
D:\Python\ITMS_SPEC처리_자동화\정기배포_SPEC.sql
    FileList = r'D:\Python\ITMS_SPEC처리_자동화\정기배포_SPEC.sql'
"""

login_id = ''
login_pw = ''

ITSM_URL = 'http://itsm.ktds.co.kr/oper/index.do'
CHROME_DRIVER = r'D:\업무화일\01.개발\14.SR자동분배\SR자동접수_20190918\chromedriver.exe'  # 드라이버사용

spec  = []
md    = []
email = []

today = date.today()
#first_day = today.replace(day=1) #임의수정
first_day = today.replace(day=2)
last_day = datetime(today.year, today.month, 1) + relativedelta(months = 1, days = -1)

def main():
    print('ITMS SPEC처리_자동화.main Start')

    driver = webdriver.Chrome(CHROME_DRIVER)
    driver.get(ITSM_URL)
    driver.maximize_window()

    SpecList()
    login(driver)
    SpecCompliete(driver)

def login(driver, login_id=login_id, login_pw=login_pw):
    print('로그인 시작')

    time.sleep(0.5)

    driver.find_element_by_xpath('//*[@id="LoginId"]').send_keys(login_id) #로그인 계정 입력
    time.sleep(0.5)
    driver.find_element_by_xpath('//*[@id="LoginPw"]').send_keys(login_pw) #로그인 패스워드 입력
    time.sleep(0.5)

    driver.find_element_by_xpath('//*[@id="LoginForm"]/fieldset/div/input[6]').click()  # 로그인 클릭

    time.sleep(2)

    print('로그인 종료')

def SpecList():
    FileList = r'D:\Python\ITMS_SPEC처리_자동화\정기배포_SPEC.sql'
    with open(FileList, 'r') as spec_list:
        for line in spec_list.readlines():
            spec.append(line.split(',')[0])
            md.append(line.split(',')[1])
            email.append(line.split(',')[2].rstrip('\n').rstrip(' '))

def SpecCompliete(driver):
    print('SPEC 처리 시작')
    print("총 처리 건수 : " + str(len(spec)))

    for i in range(0, len(spec)):
        print("순번 "+ str(i) + "  SPEC ID : " + spec[i])
        print("순번 "+ str(i) + "  MD ID : " + md[i])
        print("순번 " + str(i) + "  EMAIL ID : " + email[i])
        driver.get('http://itsm.ktds.co.kr/oper/spec/list.do?selectedMnuID=OPR00019&brdOid=0&mnuIndex=1&isFirst=true')  # SPEC검색싸이트로 이동

        driver.find_element_by_name('searchSpecId').send_keys(spec[i])  # SPEC ID 값 입력
        driver.find_element_by_xpath('//*[@id="SearchBtn"]/img').click()  # 검색 클릭
        driver.implicitly_wait(3)

        # 등록, 접수된 항목에 대하서만 처리(기존 발행된 부분에 대해서는 미처리)
        if driver.find_element_by_xpath('//*[@id="datagrid-row-r1-2-0"]/td[13]').text in ('등록','접수'):
            driver.find_element_by_id('datagrid-row-r1-2-0').click()  # 첫번째 검색 클릭

            WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, '//*[@id="ModifyBtn"]/img'))).click()    # 접수/수정 클릭
            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[4]/tbody/tr[2]/td[1]/span/span/span').click()  # 분석결과 클릭
            time.sleep(1)

            driver.find_element_by_xpath('/html/body/div[2]/div/div[3]').click()            # 개발 클릭
            driver.find_element_by_xpath('//*[@id="DivSpecBtnArea"]/a[1]/img').click()      # 월별투입예상공수 추가
            MD_change = driver.find_element_by_xpath('//*[@id="MonthBody"]/tr/td[3]/input') # MD 입력 선택
            MD_change.clear()
            MD_change.send_keys(md[i])

            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[5]/tbody/tr[2]/td[1]/span[1]/input[1]').clear()  # 개발기반(계획) 시작일
            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[5]/tbody/tr[2]/td[1]/span[1]/input[1]').send_keys(first_day.strftime('20' + '%y-%m-%d')) # 당월 첫 날자
            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[5]/tbody/tr[2]/td[1]/span[3]/input[1]').clear()  # 개발기반(계획) 종료일
            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[5]/tbody/tr[2]/td[1]/span[3]/input[1]').send_keys(last_day.strftime('20' + '%y-%m-%d'))  # 당월 마지막 날자
            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[5]/tbody/tr[2]/td[2]/span/input[1]').clear()     # 예상완료일
            driver.find_element_by_xpath('//*[@id="RegistForm"]/fieldset/table[5]/tbody/tr[2]/td[2]/span/input[1]').send_keys(last_day.strftime('20' + '%y-%m-%d'))     # 당월 마지막 날자

            driver.find_element_by_xpath('//*[@id="RfcEdit"]/table/tbody/tr[1]/td/span/span/span').click()  # 요청유형분류
            time.sleep(1)
            driver.find_element_by_xpath('/html/body/div[6]/div/div[2]').click()  # 기능개선 클릭

            driver.find_element_by_xpath('//*[@id="RfcEdit"]/table/tbody/tr[2]/td[1]/span/input[1]').clear()  # 완료요청일
            driver.find_element_by_xpath('//*[@id="RfcEdit"]/table/tbody/tr[2]/td[1]/span/input[1]').send_keys(last_day.strftime('20' + '%y-%m-%d')) # 당월 마지막 날자

            driver.find_element_by_xpath('//*[@id="RfcEdit"]/table/tbody/tr[5]/td[2]/a[1]/img').click()  # RFC(AP변경)담당 클릭
            time.sleep(1)

            driver.find_element_by_xpath("//*[text()=\'" + str(email[i]) + "\']").click()  # 이메일로 찾아서 체크박스 선택
            time.sleep(0.5)

            driver.find_element_by_xpath('//*[@id="PopAssignTabs"]/div[2]/div[1]/div/div/div[2]/input').click()  # 선택 클릭

            #개인정보유형
            driver.find_element_by_xpath('//*[@id="SECURITY_PERSONAL_INFO1"]').click() #KT개인고객
            driver.find_element_by_xpath('//*[@id="SECURITY_PERSONAL_INFO2"]').click() #KT법인고객

            #기능개발 유형
            #driver.find_element_by_xpath('//*[@id="SECURITY_FUNCTION_DEVELOP1"]').clink()  # 인증/결제 기능
            #driver.find_element_by_xpath('//*[@id="SECURITY_FUNCTION_DEVELOP2"]').click()  # 파라미터 추가/변경
            driver.find_element_by_xpath('//*[@id="SECURITY_FUNCTION_DEVELOP3"]').click()  # 기타


            driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(5)

            driver.find_element_by_xpath('//*[@id="RegistForm"]/div[7]/a[1]/img').click() #저장클릭
            time.sleep(2)

            WebDriverWait(driver, 100).until(EC.presence_of_element_located((By.XPATH, '//*[@id="SearchSpecId"]'))) # 저장 이후 다음페이지 나오는거 확인

            print("-----------저장 완료-----------")
        else:
            print('-----------상태 : 등록,접수 가 아니라 Skip 처리-----------')


    print('SPEC 처리 종료')
    # Chrome 종료
    #driver.close()

if __name__ == '__main__':
    main()