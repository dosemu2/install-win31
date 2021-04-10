@echo off
unix -s dosemu-preinstallwin31
if exist %USERDRV%:\inst\win31\setup.exe %USERDRV%:\inst\win31\setup.exe /h:f:\win31\dosemu.shh
if exist %USERDRV%:\windows\nul path %PATH%;%USERDRV%:\windows