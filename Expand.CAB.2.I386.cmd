@echo off
ECHO CREATION DES DOSSERS DE TRAVAIL
mkdir Cabs
move *.cab Cabs
mkdir tmpdir
del tmpdir\*.*
mkdir Add_To_I386

ECHO DECOMPRESSION EXTRACT
cd Cabs
for %%i in (*.cab) do ..\extract.exe /Y /E /L ..\tmpdir\ %%i
cd..

cd tmpdir
attrib -R *.*
dir /W
cd..

ECHO RESULTAT DECOMPRESSION EXTRACT
pause

ECHO DECOMPRESSION EXPAND
cd Cabs
for %%i in (*.cab) do expand.exe  -F:*.* %%i ..\tmpdir\
cd..

cd tmpdir
attrib -R *.*
dir /W
del *.cab
cd..
ECHO RESULTAT DECOMPRESSIONS
pause

cd tmpdir
for %%j in (*.*) do makecab %%j
dir /w
ECHO RESULTAT DECOMPRESSION-COMPRESSION
pause
ECHO DEPLACEMENT COMPRESSION

move *.**_ ..\Add_To_I386
cd..

call listeX.cmd Add_To_I386
rmdir /q /s tmpdir
start liste_des_fichiers_de_Add_To_I386.txt