@echo off
REM =========================================================================
REM IPIAL - Sistema de Gestao de Exames de Acesso
REM Script de inicializacao com multiplas opcoes
REM =========================================================================

setlocal enabledelayedexpansion
color 0A
title IPIAL - Sistema de Gestao de Exames - Menu Principal

:menu
cls
echo.
echo =========================================================================
echo.
echo        IPIAL - Sistema de Gestao de Exames de Acesso
echo.
echo =========================================================================
echo.
echo.
echo  Selecione uma opcao para iniciar o sistema:
echo.
echo.
echo  [1] Localhost Simples
echo      - Servidor Web apenas (Python)
echo      - Acesso: http://localhost:8000
echo      - Sem sincronizacao (ideal para testes locais)
echo.
echo  [2] Localhost + Servidor (RECOMENDADO)
echo      - Servidor Node.js + Servidor Web
echo      - Acesso: http://localhost:8000
echo      - Com sincronizacao e backup
echo.
echo  [3] Rede Local (Compartilhado)
echo      - Acesso pela rede: http://[SEU-IP]:8000
echo      - Colega consegue acessar pelo celular
echo      - Com sincronizacao em tempo real
echo.
echo  [4] Apenas Servidor Node.js
echo      - Apenas para API REST
echo      - Acesso: http://localhost:3000/api
echo      - Para desenvolvedores/testes
echo.
echo  [5] Apenas Servidor Web
echo      - Apenas Python
echo      - Sem sincronizacao com arquivo
echo      - Dados apenas em localStorage
echo.
echo  [0] Sair
echo.
echo =========================================================================
echo.
set /p opcao="  Escolha uma opcao (0-5): "

if "%opcao%"=="0" goto sair
if "%opcao%"=="1" goto localhost_simples
if "%opcao%"=="2" goto localhost_servidor
if "%opcao%"=="3" goto rede_local
if "%opcao%"=="4" goto apenas_node
if "%opcao%"=="5" goto apenas_web
goto menu_invalido

:menu_invalido
cls
echo.
echo =========================================================================
echo.
echo                      OPCAO INVALIDA!
echo.
echo =========================================================================
echo.
echo  Digite um numero entre 0 e 5.
echo.
pause
goto menu

REM =========================================================================
REM OPCAO 1: Localhost Simples (Apenas Python)
REM =========================================================================
:localhost_simples
cls
echo.
echo =========================================================================
echo.
echo              [1] Localhost Simples - Servidor Web (Python)
echo.
echo =========================================================================
echo.
echo  Iniciando Servidor Web (Python)...
echo.

timeout /t 2 /nobreak

start "IPIAL - Web Server (Localhost)" cmd /k "python -m http.server 8000"

cls
echo.
echo =========================================================================
echo.
echo                    SERVIDOR WEB INICIADO!
echo.
echo =========================================================================
echo.
echo.
echo  WEB SERVER (Python):
echo     - http://localhost:8000
echo.
echo.
echo  CREDENCIAIS PADRAO:
echo     - Usuario: admin
echo     - Senha: admin
echo.
echo.
echo  NOTA:
echo     - Sincronizacao DESATIVADA
echo     - Dados armazenados apenas em localStorage
echo     - Nao compartilha com outros dispositivos automaticamente
echo.
echo  Para compartilhar dados:
echo     - Use Exportar/Importar JSON nas Publicacoes
echo.
echo =========================================================================
echo.
pause
goto menu

REM =========================================================================
REM OPCAO 2: Localhost + Servidor (RECOMENDADO)
REM =========================================================================
:localhost_servidor
cls
echo.
echo =========================================================================
echo.
echo       [2] Localhost + Servidor - Node.js + Python (RECOMENDADO)
echo.
echo =========================================================================
echo.
echo  Iniciando Servidor Node.js (Sincronizacao)...
echo.

timeout /t 1 /nobreak

start "IPIAL - Node Server" cmd /k "cd /d %cd% && npm start"

timeout /t 3 /nobreak

echo.
echo  Iniciando Servidor Web (Python)...
echo.

timeout /t 1 /nobreak

start "IPIAL - Web Server (Localhost)" cmd /k "python -m http.server 8000"

timeout /t 2 /nobreak

cls
echo.
echo =========================================================================
echo.
echo                    AMBOS SERVIDORES INICIADOS!
echo.
echo =========================================================================
echo.
echo.
echo  SERVIDOR DE SINCRONIZACAO (Node.js):
echo     - http://localhost:3000
echo     - Dados: data/ipial_data.json
echo.
echo  SERVIDOR WEB (Python):
echo     - http://localhost:8000
echo.
echo.
echo  CREDENCIAIS PADRAO:
echo     - Usuario: admin
echo     - Senha: admin
echo.
echo.
echo  RECURSOS ATIVADOS:
echo     [OK] Sincronizacao em tempo real
echo     [OK] Backup em arquivo JSON
echo     [OK] Fallback offline (localStorage)
echo     [OK] API REST completa
echo.
echo  DICA:
echo     - Use esta opcao para desenvolvimento
echo     - Dados sincronizam automaticamente
echo.
echo =========================================================================
echo.
pause
goto menu

REM =========================================================================
REM OPCAO 3: Rede Local (Compartilhado)
REM =========================================================================
:rede_local
cls
echo.
echo =========================================================================
echo.
echo       [3] Rede Local (Compartilhado) - Acessivel pelo Celular
echo.
echo =========================================================================
echo.
echo  Obtendo seu endereco IP...
echo.

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| find "IPv4"') do (
    set IP=%%a
    goto :ip_encontrado
)

:ip_encontrado
set IP=%IP: =%

echo  Iniciando Servidor Node.js (Sincronizacao)...
echo.

timeout /t 1 /nobreak

start "IPIAL - Node Server" cmd /k "cd /d %cd% && npm start"

timeout /t 3 /nobreak

echo.
echo  Iniciando Servidor Web (Rede Local)...
echo.

timeout /t 1 /nobreak

start "IPIAL - Web Server (Rede)" cmd /k "python -m http.server 8000 --bind 0.0.0.0"

timeout /t 2 /nobreak

cls
echo.
echo =========================================================================
echo.
echo                  SISTEMA COMPARTILHADO ONLINE!
echo.
echo =========================================================================
echo.
echo.
echo  SERVIDOR DE SINCRONIZACAO (Node.js):
echo     - http://localhost:3000
echo     - Dados: data/ipial_data.json
echo.
echo  SERVIDOR WEB:
echo     - Localhost: http://localhost:8000
echo     - Rede Local: http://%IP%:8000  [COPIE ESTE LINK!]
echo.
echo.
echo  CREDENCIAIS PADRAO:
echo     - Usuario: admin
echo     - Senha: admin
echo.
echo.
echo  COMO COMPARTILHAR:
echo     1. Copie o link acima: http://%IP%:8000
echo     2. Envie para seu colega (WhatsApp, Telegram, etc)
echo     3. Colega abre no celular/tablet/laptop
echo     4. Faz login com admin/admin
echo     5. Todos veem e compartilham os MESMOS dados!
echo.
echo  RECURSOS ATIVADOS:
echo     [OK] Sincronizacao em tempo real entre dispositivos
echo     [OK] Multiplos usuarios acessando simultaneamente
echo     [OK] Backup em arquivo JSON
echo     [OK] Fallback offline
echo.
echo =========================================================================
echo.
pause
goto menu

REM =========================================================================
REM OPCAO 4: Apenas Node.js
REM =========================================================================
:apenas_node
cls
echo.
echo =========================================================================
echo.
echo          [4] Apenas Servidor Node.js - API REST (Desenvolvedor)
echo.
echo =========================================================================
echo.
echo  Iniciando apenas Servidor Node.js...
echo.

timeout /t 1 /nobreak

start "IPIAL - Node Server (API)" cmd /k "cd /d %cd% && npm start"

timeout /t 3 /nobreak

cls
echo.
echo =========================================================================
echo.
echo                    SERVIDOR NODE.JS INICIADO!
echo.
echo =========================================================================
echo.
echo.
echo  SERVIDOR API (Node.js):
echo     - http://localhost:3000
echo     - Dados: data/ipial_data.json
echo.
echo.
echo  ENDPOINTS DISPONIVEIS:
echo     - GET    /api/data              > Obter todos dados
echo     - POST   /api/data              > Salvar dados
echo     - GET    /api/candidates        > Listar candidatos
echo     - POST   /api/candidates        > Adicionar candidato
echo     - GET    /api/candidates/:bi    > Buscar por BI
echo     - PUT    /api/candidates/:bi    > Atualizar candidato
echo     - DELETE /api/candidates/:bi    > Deletar candidato
echo     - GET    /api/logs              > Listar logs
echo     - POST   /api/logs              > Adicionar log
echo     - GET    /api/status            > Status do servidor
echo.
echo.
echo  TESTAR API:
echo     curl http://localhost:3000/api/status
echo.
echo  NOTA:
echo     - Servidor WEB NAO esta rodando
echo     - Acesse API diretamente em localhost:3000
echo     - Para usar a app, abra uma nova janela com opcao 5 (Servidor Web)
echo.
echo =========================================================================
echo.
pause
goto menu

REM =========================================================================
REM OPCAO 5: Apenas Servidor Web
REM =========================================================================
:apenas_web
cls
echo.
echo =========================================================================
echo.
echo             [5] Apenas Servidor Web - Python (Simples)
echo.
echo =========================================================================
echo.
echo  Iniciando apenas Servidor Web...
echo.

timeout /t 1 /nobreak

start "IPIAL - Web Server (Python)" cmd /k "python -m http.server 8000"

cls
echo.
echo =========================================================================
echo.
echo                    SERVIDOR WEB INICIADO!
echo.
echo =========================================================================
echo.
echo.
echo  SERVIDOR WEB (Python):
echo     - http://localhost:8000
echo.
echo.
echo  CREDENCIAIS PADRAO:
echo     - Usuario: admin
echo     - Senha: admin
echo.
echo.
echo  CARACTERISTICAS:
echo     - Sem sincronizacao com servidor Node.js
echo     - Dados armazenados apenas em localStorage
echo     - Nao compartilha com outros dispositivos automaticamente
echo     - Sem arquivo de backup JSON
echo.
echo  USE ESTE MODO PARA:
echo     - Testes rapidos
echo     - Modo offline
echo     - Sem sincronizacao
echo.
echo  PARA COMPARTILHAR:
echo     - Use Exportar/Importar JSON nas Publicacoes
echo.
echo =========================================================================
echo.
pause
goto menu

REM =========================================================================
REM SAIR
REM =========================================================================
:sair
cls
echo.
echo =========================================================================
echo.
echo              Obrigado por usar IPIAL! Ate logo!
echo.
echo =========================================================================
echo.
pause
exit /b
