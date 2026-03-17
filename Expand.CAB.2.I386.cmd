@echo off
ECHO CREATING WORK FOLDERS FO CAB FILES EXTRACTION
mkdir Cabs
move *.cab Cabs
mkdir tmpdir
del tmpdir\*.*
mkdir Add_To_I386

ECHO DECOMPRESSION THRU EXTRACT
cd Cabs
for %%i in (*.cab) do ..\extract.exe /Y /E /L ..\tmpdir\ %%i
cd..

cd tmpdir
attrib -R *.*
dir /W
cd..

ECHO RESULT UNCOMPRESSION EXTRACT
pause

ECHO UNCOMPRESSION EXPAND
cd Cabs
for %%i in (*.cab) do expand.exe  -F:*.* %%i ..\tmpdir\
cd..

cd tmpdir
attrib -R *.*
dir /W
del *.cab
cd..
ECHO UNCOMPRESSION RESULT
pause

cd tmpdir
for %%j in (*.*) do makecab %%j
dir /w
ECHO RESULT UNCOMPRESSION-COMPRESSION
pause
ECHO DISPLACEMENT COMPRESSION

move *.**_ ..\Add_To_I386
cd..

call listeX.cmd Add_To_I386
rmdir /q /s tmpdir
start Add_To_I386.txt
