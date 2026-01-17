#!/bin/bash

# Script para iniciar o servidor Node.js e Python simultaneamente
# Execute com: bash iniciar_servidores.sh

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║       IPIAL - Sistema de Gestao de Exames de Acesso       ║"
echo "║                 Iniciando Servidores...                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Obter IP da máquina
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | head -1 | awk '{print $2}')
else
    # Linux
    IP=$(hostname -I | awk '{print $1}')
fi

echo ""
echo "[1/2] Iniciando Servidor Node.js (Sincronizacao de Dados)..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Iniciar servidor Node.js em background
npm start &
NODE_PID=$!

sleep 3

echo ""
echo "[2/2] Iniciando Servidor Web (Python HTTP)..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Iniciar servidor Python em background
python -m http.server 8000 --bind 0.0.0.0 &
PYTHON_PID=$!

sleep 2

clear

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                  SERVIDORES INICIADOS! ✓                   ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo ""
echo "📊 SERVIDOR DE SINCRONIZACAO (Node.js):"
echo "   └─ http://localhost:3000"
echo "   └─ Dados: projeto/data/ipial_data.json"
echo ""
echo "🌐 SERVIDOR WEB (Python):"
echo "   └─ Localhost: http://localhost:8000"
echo "   └─ Na Rede: http://$IP:8000"
echo ""
echo "🔐 CREDENCIAIS PADRAO:"
echo "   └─ Usuario: admin"
echo "   └─ Senha: admin"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✨ Dicas:"
echo "   1. Abra http://localhost:8000 no seu navegador"
echo "   2. Compartilhe http://$IP:8000 com seus colegas"
echo "   3. Todos verão e compartilharão os mesmos dados!"
echo "   4. Deixe este terminal aberto enquanto usar"
echo ""
echo "⚠️  Para parar: Pressione Ctrl+C (pode ser necessário 2x)"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Manter terminal aberto até Ctrl+C
wait
