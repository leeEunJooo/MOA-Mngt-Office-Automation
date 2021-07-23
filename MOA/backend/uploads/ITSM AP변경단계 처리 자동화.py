#!/usr/bin/env python
# coding: utf-8

import time
import math
from selenium import webdriver
from selenium.webdriver.common.alert import Alert
from selenium.common.exceptions import NoSuchElementException

itsm_url = 'http://itsm.ktds.co.kr/oper/index.do'
chrome_driver = r'D:\업무\ITSM_자동화\chrome_driver\chromedriver.exe'
driver = webdriver.Chrome(chrome_driver)

login_id = '82022369'
pass_wd = 'wnaltjs1!!'

path = r'D:\업무\ITSM_자동화\data\개발SR_PSTN테스트.sql'

contetList = []
with open(path, 'rt', encoding='UTF-8') as f:
    content = f.readlines()
for x in content:
    contetList.append(x.strip().split(","))

print(contetList)


"""
함수명 : main
기능 :  main 함수
"""
def main():
    print('ITMS 개발 Sepc 자동화.main Start')
    login(driver, itsm_url, login_id, pass_wd)
    click_menu(driver)

    for i in range(0, len(contetList)):
        crmList = contetList[i]
        print(crmList)
        chk_sts = check_CrmSatus(driver, crmList)

        # 앞단계

        # AP변경등록에서 변경수행완료까지
        if chk_sts in ["AP변경 등록", "접수 및 분류", "영향도 분석 및 설계"]:
            from_APchng_to_chngList(driver, crmList, chk_sts)

        # 다음단계


"""
함수명 : login
기능 :  ITSM 로그인
"""
def login (driver ,itsm_url,login_id,pass_wd) :
    print("login 시작")
    driver.get(itsm_url)
    driver.maximize_window()

    driver.find_element_by_id("LoginId").send_keys(login_id) #driver.find_element_by_xpath('//*[@id="LoginId"]').send_keys(login_id)
    driver.find_element_by_id("LoginPw").send_keys(pass_wd) #driver.find_element_by_xpath('//*[@id="LoginPw"]').send_keys(pass_wd)

    driver.find_element_by_xpath('//*[@id="LoginForm"]/fieldset/div/input[6]').click()
    driver.implicitly_wait(3)
    time.sleep(3)

    print("login 종료")


"""
함수명 : click_menu
기능 :  서비스 매니저 진입 및 개발 SR 선택
"""
def click_menu(driver) :
    print("click_menu 시작")
    driver.find_element_by_xpath('//*[@id="RootMenuArea"]/ul/li[2]/a').click()  # 서비스매니저 메뉴 진입
    driver.implicitly_wait(10)
    time.sleep(3)

    try :
        driver.find_element_by_xpath("//*[text()='뒤로']").click()
        time.sleep(3)
    except NoSuchElementException as error:
        pass

    print("click_menu 종료")


"""
함수명 : check_CrmSatus
기능 :  개발 SR에 대한 승인완료 여부 확인 
"""
def check_CrmSatus(driver, crmList) :
    print("check_CrmSatus 시작")

    #iframe 위치 설정
    driver.switch_to.default_content()
    driver.switch_to.frame(
        driver.find_element_by_xpath('/html/body/div[3]/div[2]/div/div/div[1]/div/div[5]/div/div[2]/iframe'))

    try :
        chk_crm = driver.find_element_by_xpath("//*[text()='" + crmList[0].strip() + "']")
    except  NoSuchElementException as error :
        return "해당 CRM번호 미존재"
        pass

    # CRM 번호에 해당하는 table id 값 확인 및 CRM번호 상태 확인
    id_num = int(chk_crm.get_attribute("id").split('-')[-1]) + 3
    crm_ariaid = chk_crm.get_attribute("id")[:-len(str(id_num))] + str(id_num)
    chk_status = driver.find_element_by_xpath("//*[@aria-activedescendant='" + crm_ariaid + "']").text
    print(chk_crm, id_num, crm_ariaid, chk_status)
    print(chk_status)

    print("check_CrmSatus 종료")

    return chk_status


"""
함수명 : write_registerStage
기능 :  접수 및 분류단계 수행
"""
def write_registerStage(driver, crmList, chk_sts):
    print("write_registerStage 시작")

    # 초기 단계가 영향도 분석 및 설계일 경우 수행하지 않음
    if "영향도 분석 및 설계" in chk_sts:
        return

    # 현재 드라이버 위치 확인 필요
    driver.switch_to.default_content()
    driver.switch_to.frame(
        driver.find_element_by_xpath('/html/body/div[3]/div[2]/div/div/div[1]/div/div[5]/div/div[2]/iframe'))

    # crm 번호 클릭
    driver.find_element_by_xpath("//*[text()='" + crmList[0].strip() + "']").click()
    driver.implicitly_wait(10)
    time.sleep(1.5)

    driver.switch_to.default_content()

    # 초기 단계까 AP변경 등록이면 접수 및 분류 단계 버튼 클릭
    if "AP변경 등록" in chk_sts:
        # 접수 및 분류 단계 진입
        driver.find_element_by_xpath(
            '/html/body/div[3]/div[2]/div/div[2]/div[1]/div/div[5]/div/div[1]/div/table/tbody/tr/td[1]/table/tbody/tr/td[4]/table/tbody/tr[2]/td[2]/em/button').click()
        driver.implicitly_wait(10)
        time.sleep(1.5)

    # iframe위치 찾기
    driver.switch_to.frame(
        driver.find_element_by_xpath('/html/body/div[3]/div[2]/div/div[2]/div[1]/div/div[5]/div/div[2]/iframe'))
    # 표준 or 일반으로 변경
    driver.find_element_by_xpath('//*[@id="X82Edit"]/div/input').send_keys(str(crmList[2]))
    # ITO SR 옵션 변경
    driver.find_element_by_xpath('//*[@id="X86Edit"]/div/input').clear()
    driver.find_element_by_xpath('//*[@id="X86Edit"]/div/input').send_keys('개발SR')

    # 접수 및 분류 완료 버튼 클릭
    driver.switch_to.default_content()
    driver.find_element_by_xpath(
        '/html/body/div[3]/div[2]/div/div[2]/div[1]/div/div[5]/div/div[1]/div/table/tbody/tr/td[1]/table/tbody/tr/td[3]/table/tbody/tr[2]/td[2]/em/button').click()
    driver.implicitly_wait(10)
    time.sleep(1.5)

    print("write_registerStage 종료")


"""
함수명 : write_effctAnalize
기능 :  영향도 분석 및 설계 단계 수행
"""
def write_effctAnalize(driver, crmList):
    print("write_effctAnalize 시작")

    # 영향도분석 내용으로 iframe 변경
    driver.switch_to.default_content()
    driver.implicitly_wait(10)
    time.sleep(1.5)
    # 영향도분석 및 설계 클릭
    driver.find_element_by_xpath(
        '/html/body/div[3]/div[2]/div/div[2]/div[1]/div/div[5]/div/div[1]/div/table/tbody/tr/td[1]/table/tbody/tr/td[4]/table/tbody/tr[2]/td[2]/em/button').click()
    driver.implicitly_wait(10)
    time.sleep(1.5)

    driver.switch_to.frame(
        driver.find_element_by_xpath('/html/body/div[3]/div[2]/div/div[2]/div[1]/div/div[5]/div/div[2]/iframe'))

    # CAB내용 입력
    driver.find_element_by_xpath('/html/body/div[1]/div[1]/form/div[6]/div[2]/div[4]/div/textarea').clear()
    driver.find_element_by_xpath('/html/body/div[1]/div[1]/form/div[6]/div[2]/div[4]/div/textarea').send_keys('적합')
    driver.implicitly_wait(10)

    if '일반' in crmList[2]:
        # input 창 clear
        driver.find_element_by_xpath('/html/body/div[1]/div[1]/form/div[6]/div[2]/div[2]/div[1]/input').clear()
        # 담당자 입력
        driver.find_element_by_xpath('/html/body/div[1]/div[1]/form/div[6]/div[2]/div[2]/div[1]/input').send_keys(
            '윤의영, 최고은, ' + crmList[1])
        driver.implicitly_wait(10)
        # 달력에 오늘 날짜 삽입
        driver.find_element_by_xpath('//*[@id="X98Icon"]').click()
        driver.find_element_by_xpath('//*[@id="todayButton"]').click()
        driver.find_element_by_xpath('//*[@id="okButton"]').click()
        driver.implicitly_wait(10)

    print("write_effctAnalize 종료")


"""
함수명 : from_APchng_to_chngList
기능 :  AP변경 등록 ~ 변경수행 단계까지 수행
"""
def from_APchng_to_chngList(driver, crmList, chk_sts):
    print("from_APchng_to_chngList 시작")

    # 접수 및 분류 수행
    write_registerStage(driver, crmList, chk_sts)

    # 영향도 분석및 설계 수행
    write_effctAnalize(driver, crmList)

    # 변경 수행 내역 클릭
    driver.switch_to.default_content()
    driver.find_element_by_xpath(
        '/html/body/div[3]/div[2]/div/div[2]/div[1]/div/div[5]/div/div[1]/div/table/tbody/tr/td[1]/table/tbody/tr/td[4]/table/tbody/tr[2]/td[2]/em/button').click()
    driver.implicitly_wait(10)
    time.sleep(1.5)

    # 창 닫기
    driver.switch_to.default_content()
    driver.find_element_by_xpath('/html/body/div[3]/div[1]/div[1]/ul/li[2]/a').click()
    driver.implicitly_wait(10)
    time.sleep(1.5)

    print("from_APchng_to_chngList 종료")


if __name__ == '__main__':
    main()