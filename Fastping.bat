@echo off
title Fastfing
echo 패스트핑을 설정 하시겠습니까?
echo 주의:랜카드 아이디를 확인할 것, 관리자 권한으로 실행할 것
echo.
set /p a=(설정:Y/설정 복구:N)
if %a%==y goto excution
if %a%==n goto restore

:excution
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /t "REG_DWORD" /v "TCPNoDelay" /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /t "REG_DWORD" /v "TcpAckFrequency" /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /t "REG_DWORD" /v "TcpDelAckTicks" /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /t "REG_DWORD" /v "TCPNoDelay" /d "1" /f
goto explain

:explain
msg %username% 재부팅하거나 렌카드 드라이버를 재부팅한 이후부터 적용됩니다.(Win + X, 장치 관리자)
goto exit

:restore
reg delete "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /v "TcpAckFrequency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /v "TcpDelAckTicks" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /v "TCPNoDelay" /f
pause
