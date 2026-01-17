# 🚀 Guia de Inicialização - IPIAL System

## 📁 Arquivos de Inicialização

Existem **4 arquivos** para iniciar o sistema. Escolha o que preferir:

---

## 1️⃣ Menu Interativo (RECOMENDADO) ⭐

### Windows:
```
iniciar_sistema.bat
```
**Clique 2x no arquivo**

### Linux/Mac:
```bash
bash iniciar_sistema.sh
```

### O que faz:
- Menu com 5 opções
- Escolhe localhost vs rede vs servidores
- Volta ao menu a qualquer momento
- **MELHOR OPÇÃO PARA A MAIORIA**

### Opções do Menu:
```
[1] Localhost Simples
[2] Localhost + Servidor (RECOMENDADO)
[3] Rede Local (Compartilhado)
[4] Apenas Node.js (Desenvolvedor)
[5] Apenas Web (Simples)
```

---

## 2️⃣ Tudo Automático (Rápido)

### Windows:
```
iniciar_servidores.bat
```
**Clique 2x no arquivo**

### Linux/Mac:
```bash
bash iniciar_servidores.sh
```

### O que faz:
- Inicia **ambos os servidores**
- Node.js + Python automaticamente
- 5 segundos e está pronto
- **MELHOR PARA QUEM SABE O QUE QUER**

### Resultado:
- ✅ Servidor Node.js em http://localhost:3000
- ✅ Servidor Web em http://localhost:8000
- ✅ Sincronização ativada

---

## 3️⃣ Localhost com Python (Simples)

### Terminal PowerShell/Bash:
```bash
python -m http.server 8000
```

### O que faz:
- Apenas servidor Python
- Sem sincronização
- Dados apenas em localStorage
- **MAIS SIMPLES POSSÍVEL**

### Quando usar:
- Testes rápidos
- Offline
- Sem múltiplos dispositivos

---

## 4️⃣ Rede Local com Python

### Terminal PowerShell/Bash:
```bash
python -m http.server 8000 --bind 0.0.0.0
```

### O que faz:
- Servidor Web acessível na rede
- Sem sincronização automática
- Dados apenas em localStorage
- **COMPARTILHA LINK, NÃO DADOS**

### Quando usar:
- Compartilhar link apenas
- Sem servidor Node.js
- Sem arquivo de backup

---

## 📊 Comparação

| Arquivo/Comando | Localhost | Rede | Sync | Facilidade | Melhor Para |
|---|---|---|---|---|---|
| **iniciar_sistema.bat/.sh** | ✅ | ✅ | ✅ | ⭐⭐⭐⭐⭐ | **Maioria dos usuários** |
| **iniciar_servidores.bat/.sh** | ✅ | ✅ | ✅ | ⭐⭐⭐⭐⭐ | Usuários avançados |
| **python 8000** | ✅ | ❌ | ❌ | ⭐⭐⭐⭐⭐ | Testes rápidos |
| **python 8000 --bind 0.0.0.0** | ✅ | ✅ | ❌ | ⭐⭐⭐⭐ | Compartilhar link |

---

## 🎯 Qual Escolher?

### 👨‍💼 "Sou usuário normal"
```
→ Use: iniciar_sistema.bat (Menu Interativo)
→ Escolha opção [2] ou [3]
```

### 👨‍💻 "Sou desenvolvedor"
```
→ Use: iniciar_sistema.bat opção [4]
→ Ou: npm start (apenas Node.js)
```

### ⚡ "Quero mais rápido possível"
```
→ Use: iniciar_servidores.bat
→ Ou: npm start + python 8000 em 2 terminais
```

### 📱 "Vou compartilhar com colega"
```
→ Use: iniciar_sistema.bat opção [3]
→ Copie o link: http://192.168.100.209:8000
→ Envie para colega
```

### 🧪 "Estou testando algo"
```
→ Use: python -m http.server 8000
→ Sem sincronização, mais leve
```

---

## 🔐 Credenciais

**Todos os métodos usam:**
- **Usuário:** admin
- **Senha:** admin

---

## 📍 Acessar a Aplicação

Depende do método escolhido:

### Localhost:
```
http://localhost:8000
```

### Rede Local:
```
http://192.168.100.209:8000
(substitua pelo seu IP real)
```

### API REST (Node.js):
```
http://localhost:3000/api
```

---

## ⚙️ Requisitos

### Obrigatórios:
- Node.js (para sincronização)
- Python 3.7+
- Navegador moderno

### Instalação (primeira vez):
```bash
npm install
```

---

## 🐛 Troubleshooting

### "Porta 8000 em uso"
```bash
# Usar porta diferente
python -m http.server 9000
```

### "npm command not found"
```
→ Instale Node.js: https://nodejs.org/
→ Reinicie o terminal
```

### "Não consegue sincronizar"
```bash
# Verifique se Node.js está rodando
curl http://localhost:3000/api/status
```

---

## 💾 Dados

### Onde são armazenados?

1. **localStorage** (navegador) - Rápido
2. **data/ipial_data.json** - Arquivo permanente (se Node.js rodando)
3. **Sincronizado** - Entre dispositivos (se Node.js + --bind 0.0.0.0)

---

## 🎓 Próximos Passos

1. **Escolha um método** acima
2. **Inicie o sistema**
3. **Acesse http://localhost:8000**
4. **Faça login** (admin/admin)
5. **Adicione candidatos**
6. **Publique resultados**
7. **Compartilhe link** com colegas

---

## 📚 Documentação Completa

- **QUICKSTART.md** - 10 segundos de setup
- **SERVIDOR_SINCRONIZACAO.md** - Setup Node.js detalhado
- **README.md** - Overview geral
- **GUIA_COMPLETO.md** - Manual de referência

---

## ✨ Resumo

**Para 90% dos usuários:**
```
1. Duplo clique em: iniciar_sistema.bat
2. Escolha opção [2] ou [3]
3. Pronto! Sistema está funcionando
```

**Simples assim!** 🚀
