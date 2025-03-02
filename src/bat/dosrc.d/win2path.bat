@echo off
if exist %USERDRV%:\windows\nul goto add_p
echo windows-3.1 can be installed with: inswin31
goto done
:add_p
path %PATH%;%USERDRV%:\windows
:done
