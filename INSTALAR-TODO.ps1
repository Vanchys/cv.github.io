# Script de instalación automática para Portfolio 3D
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Instalador Automático - Portfolio 3D" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si Node.js está instalado
Write-Host "Verificando Node.js..." -ForegroundColor Yellow
$nodeVersion = Get-Command node -ErrorAction SilentlyContinue

if (-not $nodeVersion) {
    Write-Host "Node.js no está instalado." -ForegroundColor Red
    Write-Host ""
    Write-Host "Opciones:" -ForegroundColor Yellow
    Write-Host "1. Instalar Node.js automáticamente (requiere permisos de administrador)" -ForegroundColor White
    Write-Host "2. Descargar Node.js manualmente desde https://nodejs.org/" -ForegroundColor White
    Write-Host ""
    
    $installChoice = Read-Host "¿Deseas instalar Node.js automáticamente? (S/N)"
    
    if ($installChoice -eq "S" -or $installChoice -eq "s") {
        Write-Host "Instalando Node.js usando Chocolatey..." -ForegroundColor Yellow
        
        # Verificar si Chocolatey está instalado
        $choco = Get-Command choco -ErrorAction SilentlyContinue
        
        if (-not $choco) {
            Write-Host "Chocolatey no está instalado. Instalando Chocolatey..." -ForegroundColor Yellow
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        }
        
        Write-Host "Instalando Node.js LTS..." -ForegroundColor Yellow
        choco install nodejs-lts -y
        
        Write-Host "Refrescando variables de entorno..." -ForegroundColor Yellow
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    } else {
        Write-Host ""
        Write-Host "Por favor, instala Node.js manualmente desde:" -ForegroundColor Yellow
        Write-Host "https://nodejs.org/" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Después de instalar Node.js, ejecuta este script nuevamente." -ForegroundColor Yellow
        pause
        exit
    }
}

# Verificar nuevamente Node.js
$nodeVersion = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodeVersion) {
    Write-Host "Node.js aún no está disponible. Por favor, reinicia la terminal e intenta nuevamente." -ForegroundColor Red
    pause
    exit
}

Write-Host "Node.js encontrado!" -ForegroundColor Green
node --version
npm --version
Write-Host ""

# Navegar al directorio del proyecto
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

Write-Host "Instalando dependencias del proyecto..." -ForegroundColor Yellow
Write-Host ""

# Instalar dependencias
npm install

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ¡Instalación completada!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Para iniciar el servidor de desarrollo, ejecuta:" -ForegroundColor Yellow
    Write-Host "  npm run dev" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "O ejecuta el archivo INICIO-RAPIDO.bat" -ForegroundColor Yellow
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "Error al instalar dependencias." -ForegroundColor Red
    Write-Host "Por favor, verifica que Node.js esté correctamente instalado." -ForegroundColor Yellow
}

pause

