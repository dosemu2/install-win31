@echo off
if exist %USERDRV%:\windows\nul goto add_p
echo.
echo windows-3.1 can be installed with: inswin31
echo.
goto done
:add_p
path %PATH%;%USERDRV%:\windows
:done
