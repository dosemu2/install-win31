@echo off
unix -s dosemu-preinstallwin31
if errorlevel 1 goto faildownload
if exist %USERDRV%:\inst\win31\setup.exe %USERDRV%:\inst\win31\setup.exe /h:f:\win31\dosemu.shh
if errorlevel 1 goto failwinsetup
if exist %USERDRV%:\windows\nul path %PATH%;%USERDRV%:\windows
echo Windows 3.1 was successfully installed.
echo Type "win" and press enter to start Windows.
goto end

:faildownload
echo There was an error downloading the required files to install Windows 3.1.
goto end

:failwinsetup
echo The Windows 3.1 Setup program did not complete successfully.
goto end

:end
