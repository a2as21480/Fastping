@echo off
title Fastfing
echo �н�Ʈ���� ���� �Ͻðڽ��ϱ�?
echo ����:��ī�� ���̵� Ȯ���� ��, ������ �������� ������ ��
echo.
set /p a=(����:Y/���� ����:N)
if %a%==y goto excution
if %a%==n goto restore

:excution
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /t "REG_DWORD" /v "TCPNoDelay" /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /t "REG_DWORD" /v "TcpAckFrequency" /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /t "REG_DWORD" /v "TcpDelAckTicks" /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /t "REG_DWORD" /v "TCPNoDelay" /d "1" /f
goto explain

:explain
msg %username% ������ϰų� ��ī�� ����̹��� ������� ���ĺ��� ����˴ϴ�.
goto exit

:restore
reg delete "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /v "TcpAckFrequency" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /v "TcpDelAckTicks" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{eb857c2b-16c4-4b76-a975-95368f0c8e9b}" /v "TCPNoDelay" /f
pause