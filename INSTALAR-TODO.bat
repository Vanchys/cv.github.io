@echo off
echo ========================================
echo   Instalador Automático - Portfolio 3D
echo ========================================
echo.

REM Verificar si Node.js está instalado
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Node.js no esta instalado.
    echo.
    echo Por favor, instala Node.js desde:
    echo https://nodejs.org/
    echo.
    echo Despues de instalar Node.js, ejecuta este script nuevamente.
    pause
    exit /b 1
)

echo Node.js encontrado!
node --version
npm --version
echo.

echo Instalando dependencias del proyecto...
echo.

REM Instalar dependencias
call npm install

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ¡Instalacion completada!
    echo ========================================
    echo.
    echo Para iniciar el servidor de desarrollo, ejecuta:
    echo   npm run dev
    echo.
    echo O ejecuta el archivo INICIO-RAPIDO.bat
    echo.
) else (
    echo.
    echo Error al instalar dependencias.
    echo Por favor, verifica que Node.js este correctamente instalado.
)

pause

