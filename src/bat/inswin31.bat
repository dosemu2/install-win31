@echo off
if exist %USERDRV%:\windows\nul goto already
unix -s dosemu-preinstallwin31
if errorlevel 1 goto faildownload
%USERDRV%:\tool\stuffkey\stuffkey.com /F:f:\stuffkey\w31skbsw.txt
set W31SETUP=setup
if not exist %USERDRV%:\inst\win31\%W31SETUP%.exe set W31SETUP=install
if not exist %USERDRV%:\inst\win31\%W31SETUP%.exe goto failfindsetup
%USERDRV%:\inst\win31\%W31SETUP%.exe /h:f:\win31\dosemu.shh
if errorlevel 1 goto failwinsetup
%USERDRV%:\tool\stuffkey\stuffkey.com /R > NUL
if exist %USERDRV%:\windows\nul path %PATH%;%USERDRV%:\windows
if exist %USERDRV%:\windows\system\midimap.cfg del %USERDRV%:\windows\system\midimap.cfg
%USERDRV%:\tool\stuffkey\stuffkey.com /F:f:\stuffkey\sb16inst.txt
%USERDRV%:\inst\win31drv\audio\disk1\install.exe
if errorlevel 32 goto failsb16setup
if not errorlevel 31 goto failsb16setup
%USERDRV%:\tool\stuffkey\stuffkey.com /R > NUL
echo Windows 3.1 was successfully installed.
echo Type "win" and press enter to start Windows.
goto end

:faildownload
echo There was an error downloading the required files to install Windows 3.1.
goto end

:failfindsetup
echo The executable to start Windows Setup could not be found.
echo Neither setup.exe nor install.exe exists in %USERDRV%:\inst\win31
goto end

:failwinsetup
%USERDRV%:\tool\stuffkey\stuffkey.com /R
echo The Windows 3.1 Setup program did not complete successfully.
goto end

:failsb16setup
%USERDRV%:\tool\stuffkey\stuffkey.com /R
echo The Sound Blaster 16 Installation program did not complete as expected.
goto end

:already
echo %USERDRV%:\windows already exists, not installing
goto end

:end
