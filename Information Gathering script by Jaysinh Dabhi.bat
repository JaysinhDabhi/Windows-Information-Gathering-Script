@ECHO OFF

Echo Instagram-@imjaysinhdabhi
Echo Github-jaysinhdabhi




echo -------------------------- System-Info --------------------------- > autoscan.txt
systeminfo >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt


echo -------------------------- Users-Info --------------------------- >> autoscan.txt
net users admin >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt

echo -------------------------- Network-Info --------------------------- >> autoscan.txt
ipconfig /allcompartments /all >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt

echo -------------------------- Program-info --------------------------- >> autoscan.txt
TASKLIST /FI "USERNAME ne NT AUTHORITY\SYSTEM" /FI "STATUS eq running" >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt

echo --------------------------------------------------------------------- >> autoscan.txt
TASKLIST /SVC /FO LIST >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt
echo. >> autoscan.txt

echo -------------------------- Wifi-Info --------------------------- >> autoscan.txt
echo. >> autoscan.txt
@echo off
setlocal enabledelayedexpansion
for /f  "tokens=2 delims=:"  %%a  in  ('netsh wlan show profile')  do  (
            set  "ssid=%%~a"
            call  :getpwd "%%ssid:~1%%"
)

:getpwd
set  "ssid=%*"
for /f "tokens=2 delims=:"  %%i  in  ('netsh wlan show profile  name^="%ssid:"=%"  key^=clear ^|findstr /c:"Key Content"')  do  (
             echo Wi-Fi Name:  %ssid%  Password  :  %%i
 ) >> autoscan.txt 




