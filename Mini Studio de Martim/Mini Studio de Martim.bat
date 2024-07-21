@echo off
color 0A

:menu
cls
echo Quel mode voulez-vous ?
echo 1. Portrait
echo 2. Paysage
set /p mode=Entrez votre choix (1 ou 2): 

:connection
cls
echo Quelle connexion voulez-vous ?
echo 1. USB
echo 2. WiFi
echo 3. Retour au menu
set /p connection=Entrez votre choix (1, 2 ou 3): 

if "%connection%"=="3" goto menu

if "%connection%"=="1" (
    echo Détection de l'appareil USB en cours...
    adb devices
    timeout /t 5 >nul
    if "%mode%"=="1" (
        scrcpy
    ) else (
        scrcpy -m
    )
) else if "%connection%"=="2" (
    set /p ip=Entrez l'adresse IP de votre appareil: 
    set /p port=Entrez le numéro de port: 
    adb connect %ip%:%port%
    if "%mode%"=="1" (
        scrcpy
    ) else (
        scrcpy -m
    )
) else (
    echo Choix invalide. Retour au menu.
    goto menu
)

pause
goto menu
