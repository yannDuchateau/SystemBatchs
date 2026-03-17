@echo off
echo Default Microsoft Internet Browser cleanup. Beware, it can erase your cached passwords too...
echo Do not pay attention to messages saying directory not found...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo.
echo.
echo ATTRIBUTS
echo.
echo.
attrib -R -S -H "%TEMP%\*.*"
attrib -R -S -H "%systemroot%\*.*"
attrib -R -S -H "%windir%\Temp\*.*"
attrib -R -S -H "%USERPROFILE%\Local Settings\Temporary Internet Files\*.*"
attrib -R -S -H "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
attrib -R -S -H "%USERPROFILE%\AppData\Local\Temp\*.*"
attrib -R -S -H "%USERPROFILE%\AppData\LocalLow\Temp\*.*"
echo.
echo.
echo End Changing attributes for hidden suspicious files...
echo.
echo PURGING TEMP Files...
echo.
echo.
erase /f /s /q "%TEMP%\*.*"
erase /f /s /q "%windir%\Temp\*.*"
erase /f /s /q "%USERPROFILE%\AppData\Local\Temp\*.*"
erase /f /s /q "%USERPROFILE%\AppData\LocalLow\Temp\*.*"
echo.
echo.
echo TEMP Files PURGE DONE
echo.
echo NETTOYAGE INTERNET EXPLORER
echo.
echo Vidage de l'historique
echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
erase /f /s /q "%USERPROFILE%\Local Settings\Historique\*.*"
erase /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\*.*"
echo.
echo.
echo Purging temporary internet Files...
echo.
echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 
erase /f /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files\*.*"
erase /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
erase /f /s /q "%USERPROFILE%AppData\Local\Microsoft\Windows\Temporary Internet Files"
echo.
echo.
echo Purging Cookies
echo.
echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2 
erase /f /s /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Cookies"
echo.
echo.
echo INTERNET EXPLORER CLEANUP DONE
echo.
echo.
echo If you do not want to erase your cached passwords 
echo and your form data, please close this window
echo by clicking the close window button.
echo Otherwise...
pause
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
cls
echo FULL internet browser CLEANUP DONE
pause
