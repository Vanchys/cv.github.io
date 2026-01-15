@echo off
echo ========================================
echo   Portfolio 3D - Ivan Apolinar
echo ========================================
echo.
echo Instalando dependencias...
call npm install
echo.
echo Iniciando servidor de desarrollo...
echo.
echo El portfolio estara disponible en:
echo http://localhost:5173
echo.
echo Presiona Ctrl+C para detener el servidor
echo.
call npm run dev

