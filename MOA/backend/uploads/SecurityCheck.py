import requests
import time
import os
import win32com.client as win32

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.common.action_chains import ActionChains
from bs4 import BeautifulSoup

# sr_config = f.read()
login_id = '82202394'
login_pw = 'wndud1234!'

print('==DS Works Start ==')
driver = webdriver.Chrome(r'D:\주영\초기 설정파일\chromedriver.exe')  # 드라이버사용
driver.get("https://works.ktds.co.kr")  # ds works 호출
driver.maximize_window()

print('login Start')

time.sleep(0.5)

driver.find_element_by_id("userId").send_keys(login_id) #로그인 할 계정

driver.find_element_by_id("userPwd").send_keys(login_pw) #로그인 할 계정 패스워드

driver.find_element_by_id('login_area').click() #  로그인버튼 클릭
time.sleep(5.0)

driver.switch_to.default_content()
driver.find_element_by_id('36502').click()  #  work space 클릭
time.sleep(3.0)

#프레임변경
driver.switch_to.default_content()
iframes = driver.find_elements_by_tag_name('iframe')
#iframes = driver.find_element_by_css_selector('iframe')
driver.switch_to.frame(iframes[0])
#print(driver.page_source)
#채널폴더 클릭
driver.find_element_by_xpath('//*[@id="root"]/div/div/div[2]/div[2]/div[1]/div[2]/ul/li[3]/span').click()
time.sleep(7.0)

#하나 더 아래있는 파일폴더 프레임으로 한번더 프레임이동 필요
iframes = driver.find_elements_by_tag_name('iframe')
driver.switch_to.frame(iframes[0])
#print(iframes)
#print(driver.page_source)


#일일보안점검자 파일 클릭
#driver.find_element_by_xpath('/html/body/div[3]/div[2]/div[3]/table/tbody/tr[1]').click()
driver.find_element_by_xpath('//*[@id="fileList"]/tr[9]/td[2]/a').click()
time.sleep(7.0)

#새로열린 브라우저창으로 이동
#driver.window_handles
driver.switch_to.window(driver.window_handles[1])
#print(driver.page_source)
time.sleep(1.0)

#수정모드버튼 클릭
driver.find_element_by_xpath('/html/body/header/div[1]/ul/img').click()
time.sleep(7.0)

iframes = driver.find_elements_by_tag_name('iframe')
driver.switch_to.frame(iframes[0])

#맨왼쪽 시트로 이동하기
driver.find_element_by_xpath('/html/body/div/div/div/div[3]/div[1]/div[1]/button[1]').click()
time.sleep(0.5)
driver.find_element_by_xpath('/html/body/div/div/div/div[3]/div[1]/div[6]/div/ul[1]/li[2]/span').click()
time.sleep(0.5)

# import win32com.client as win32

fname = 'C:/Users/김주영/고객개발2팀_일일보안점검.xlsx'
excel = win32.gencache.EnsureDispatch('Excel.Application')
wb = excel.Workbooks.Open(fname)
ws = wb.ActiveSheet

# 엑셀파일을 읽어서 일자가 비어있는 부분을 찾아서 curRow로 셋팅해준다.
curRow = 2

for i in range(2, 100):
    if ws.Cells(i, 2).Value == None:
        curRow = i
        break

# 엑셀내에서 고객개발2팀 찾기
for i in range(2, 26):
    driver.find_element_by_id('ce-cell-name').clear()
    driver.find_element_by_id('ce-cell-name').send_keys("B" + str(i))
    driver.find_element_by_id('ce-cell-name').send_keys(Keys.RETURN)

    # 고객개발2팀인 경우
    if driver.find_element_by_id('ce-cell-content').get_attribute('value') == '고객개발2팀':
        driver.find_element_by_id('ce-cell-name').clear()
        driver.find_element_by_id('ce-cell-name').send_keys('C' + str(i))
        driver.find_element_by_id('ce-cell-name').send_keys(Keys.RETURN)

        # 보안점검자 비어있는 경우
        if driver.find_element_by_id('ce-cell-content').get_attribute('value') == '':
            # 사용자명 입력
            driver.find_element_by_id('ce-cell-content').clear()
            driver.find_element_by_id('ce-cell-content').send_keys(ws.Cells(curRow, 4).Value)  # 점검자명 입력
            driver.find_element_by_id('ce-cell-content').send_keys(Keys.RETURN)

            # 이메일 입력
            driver.find_element_by_id('ce-cell-name').clear()
            driver.find_element_by_id('ce-cell-name').send_keys('D' + str(i))
            driver.find_element_by_id('ce-cell-name').send_keys(Keys.RETURN)
            driver.find_element_by_id('ce-cell-content').clear()
            driver.find_element_by_id('ce-cell-content').send_keys(ws.Cells(curRow, 5).Value)  # 이메일 입력
            driver.find_element_by_id('ce-cell-content').send_keys(Keys.RETURN)

            # 엑셀파일에 일자 써주기
            driver.find_element_by_id('ce-cell-name').clear()
            driver.find_element_by_id('ce-cell-name').send_keys("A" + str(i))
            driver.find_element_by_id('ce-cell-name').send_keys(Keys.RETURN)
            ws.Cells(curRow, 2).Value = driver.find_element_by_id('ce-cell-content').get_attribute('value')  # 점검일자 입력

            # 엑셀 1행 아래로 이동
            curRow = curRow + 1

            # 비어있는 경우, break
    elif driver.find_element_by_id('ce-cell-content').get_attribute('value') == '':
        break

# 엑셀저장
wb.Save()

# 엑셀파일닫기
wb.Close()