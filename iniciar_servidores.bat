@echo off
REM Script para iniciar o servidor Node.js e Python simultaneamente
REM Execute este arquivo para iniciar todo o sistema

title IPIAL - Sistema de Gestao de Exames
color 0A

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║       IPIAL - Sistema de Gestao de Exames de Acesso       ║
echo ║                 Iniciando Servidores...                    ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Obter IP da máquina
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "IPv4"') do (
    set IP=%%a
    goto :ip_found
)

:ip_found
set IP=%IP: =%

echo.
echo [1/2] Iniciando Servidor Node.js (Sincronizacao de Dados)...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

REM Iniciar servidor Node.js em nova janela
start "IPIAL - Node Server" cmd /k "cd /d %cd% && npm start"

timeout /t 3 /nobreak

echo.
echo [2/2] Iniciando Servidor Web (Python HTTP)...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

REM Iniciar servidor Python em nova janela
start "IPIAL - Web Server" cmd /k "python -m http.server 8000 --bind 0.0.0.0"

timeout /t 2 /nobreak

cls

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                  SERVIDORES INICIADOS! ✓                   ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo.
echo 📊 SERVIDOR DE SINCRONIZACAO (Node.js):
echo    └─ http://localhost:3000
echo    └─ Dados: projeto/data/ipial_data.json
echo.
echo 🌐 SERVIDOR WEB (Python):
echo    └─ Localhost: http://localhost:8000
echo    └─ Na Rede: http://%IP%:8000
echo.
echo 🔐 CREDENCIAIS PADRAO:
echo    └─ Usuario: admin
echo    └─ Senha: admin
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo ✨ Dicas:
echo    1. Abra http://localhost:8000 no seu navegador
echo    2. Compartilhe http://%IP%:8000 com seus colegas
echo    3. Todos verão e compartilharão os mesmos dados!
echo    4. Deixe ambas as janelas abertas enquanto usar
echo.
echo ⚠️  Para parar: Feche ambas as janelas de terminal
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

REM Manter este terminal aberto
pause
