@echo off
chcp 65001 >nul

:menu
cls
echo ================================
echo    Spicetify Menu by Tadaky
echo ================================
echo 1. Instalar
echo 2. Atualizar
echo 3. Backup
echo 4. Restore Backup
echo 5. Uninstall
echo 6. SpotX (Github)
echo 0. Exit (Enter)
echo ================================
set /p choice=Select: 

if "%choice%"=="1" (
    cls
    powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex"
    powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex"
    pause
    goto menu
)
if "%choice%"=="2" (
    cls
    spicetify upgrade
    powershell -Command "spicetify upgrade"
    pause
    goto menu
)
if "%choice%"=="3" (
    cls
    spicetify backup apply
    powershell -Command "spicetify backup apply"
    pause
    goto menu
)
if "%choice%"=="4" (
    cls
    spicetify restore backup apply
    pause
    goto menu
)
if "%choice%"=="5" (
    cls
    spicetify restore
    powershell -Command "rmdir -r -fo $env:APPDATA\spicetify"
    powershell -Command "rmdir -r -fo $env:LOCALAPPDATA\spicetify"
    pause
    goto menu
)
if "%choice%"=="6" (
    cls
    :: Line for changing spotx parameters, each parameter should be separated by a space
set param=-new_theme

    set url='https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1'
    set url2='https://spotx-official.github.io/run.ps1'
    set tls=[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12;

    %SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe ^
-Command %tls% $p='%param%'; """ & { $(try { iwr -useb %url% } catch { $p+= ' -m'; iwr -useb %url2% })} $p """" | iex
    pause
    goto menu
)


__________________________

if "%choice%"=="0" (
    exit
)
if "%choice%"=="" (
    exit
)
__________________________



$params = @{
    BypassAdmin = $true
}

echo Opção inválida. Tente novamente.
pause
goto menu
