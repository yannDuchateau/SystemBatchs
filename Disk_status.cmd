@ECHO OFF
SETLOCAL enableextensions
(for /f "tokens=1-3" %%a in ('
  WMIC LOGICALDISK GET FreeSpace^,Name^,Size ^|FINDSTR /I /V "Name"
  ') do (
    if not "%%c"=="" (
      echo wsh.echo vbNewLine ^& "%%b" ^& " free=" ^& FormatNumber^(cdbl^(%%a^)/1024/1024/1024, 2^)^& " GB"^& " size=" ^& FormatNumber^(cdbl^(%%c^)/1024/1024/1024, 2^)^& " GB"
    )
  )
) > "%temp%\tmp.vbs"
cscript //nologo "%temp%\tmp.vbs" > C:\Temp\Disk_status.txt
del "%temp%\tmp.vbs"
notepad C:\Temp\Disk_status.txt