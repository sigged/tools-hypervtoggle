@echo off

echo   Hyper-V On or Off toggle 
echo ========== by sigged====
SET /P ANSWER=(E)nable or (D)isable Hyper-V (e/d)?
if /i {%ANSWER%}=={E} (goto :enablehyperv)
if /i {%ANSWER%}=={D} (goto :disablehyperv)
goto :noreboot


:enablehyperv
echo.
echo Enabling Hyper-V ......
bcdedit /set hypervisorlaunchtype auto
if ERRORLEVEL 1 goto :error
goto :rebootquestion



:disablehyperv
echo.
echo Disabling Hyper-V ......
bcdedit /set hypervisorlaunchtype off
if ERRORLEVEL 1 goto :error
goto :rebootquestion



:rebootquestion
echo.
SET /P ANSWER=Reboot now (y/n)?
if /i {%ANSWER%}=={y} (goto :reboot)
goto :noreboot

:reboot
echo Rebooting...
shutdown /r /t 00
exit /b 0 

:noreboot
echo Exiting...
exit /b 0

:error
echo.
echo Error occured. Exiting in 15 seconds.
timeout /t 15
exit /b 1 