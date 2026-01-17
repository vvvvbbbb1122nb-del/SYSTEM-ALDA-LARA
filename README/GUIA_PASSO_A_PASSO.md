# 📖 Guia Passo-a-Passo: Sincronização de Dados

## 🎯 Objetivo
Compartilhar dados IPIAL entre seu PC e outros dispositivos (celulares, laptops) em tempo real.

---

## 🔴 Pré-Requisitos

### O que precisa estar instalado?

✅ **Node.js** (inclui npm)
- Baixe: https://nodejs.org/ (versão LTS)
- Verificar: `node --version` (deve aparecer versão)

✅ **Python** (normalmente já vem instalado)
- Verificar: `python --version`

✅ **npm packages** (já instalado via `npm install`)
- Express, CORS, Body-Parser

---

## 🚀 Opção 1: Iniciar Automaticamente (RECOMENDADO)

### Passo 1: Clicar 2x no arquivo

**Windows:**
```
Vá até: d:\Users\joac\Downloads\fff-main\fff-main\
Procure: iniciar_servidores.bat
Clique 2x
```

**Linux/Mac:**
```bash
cd ~/Downloads/fff-main/fff-main
bash iniciar_servidores.sh
```

### Passo 2: Aguardar inicialização

Você verá 2 janelas abrir:
1. "IPIAL - Node Server" (servidor de dados)
2. "IPIAL - Web Server" (servidor web)

Aguarde 5 segundos até stabilizar.

### Passo 3: Abrir no navegador

Automaticamente abrirá em: `http://localhost:8000`

Se não abrir, copie manualmente: `http://localhost:8000`

**Pronto!** Sistema rodando! ✨

---

## 🔧 Opção 2: Iniciar Manualmente

### Se preferir mais controle, siga abaixo:

#### Passo 1: Abrir Terminal (PowerShell no Windows)

```powershell
# Windows - clique em: Menu Iniciar > PowerShell
# Ou pressione: Windows + R
# Digite: powershell
# Enter
```

#### Passo 2: Navegar até a pasta do projeto

```powershell
cd d:\Users\joac\Downloads\fff-main\fff-main
```

#### Passo 3: Iniciar Servidor de Dados (TERMINAL 1)

```bash
npm start
```

**Você verá:**
```
╔════════════════════════════════════════════╗
║   IPIAL - Servidor de Sincronização       ║
╚════════════════════════════════════════════╝

✅ Servidor iniciado em http://localhost:3000
📁 Dados salvos em: C:\...\data\ipial_data.json
```

**Deixe este terminal aberto!**

#### Passo 4: Abrir OUTRO Terminal (TERMINAL 2)

Abra um novo PowerShell (não feche o anterior!)

```powershell
cd d:\Users\joac\Downloads\fff-main\fff-main
python -m http.server 8000 --bind 0.0.0.0
```

**Você verá:**
```
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

**Deixe este terminal também aberto!**

#### Passo 5: Abrir no navegador

Em qualquer navegador, acesse:

```
http://localhost:8000
```

**Pronto!** Ambos os servidores rodando! 🎉

---

## 📱 Acessar de Outro Dispositivo

### Obter seu IP

No **TERMINAL 1** (que está rodando npm start), procure pela linha:

```
🌐 SERVIDOR WEB (Python):
   └─ Na Rede: http://192.168.100.209:8000
```

Anote este número (seu IP):
```
192.168.100.209
```

### No celular/laptop do seu colega

1. Conecte à **mesma rede WiFi** que você
2. Abra o navegador
3. Copie e cole:

```
http://192.168.100.209:8000
```

(Substitua `192.168.100.209` pelo seu IP real)

4. **VOILÀ!** Ele vê os mesmos dados que você! 🎊

---

## 🔐 Fazer Login

### Credenciais padrão:

```
Usuário: admin
Senha:   admin
```

**Nota:** Primeira vez, você entra automaticamente.

---

## 💾 Adicionar Candidatos

### Seu PC (você é admin):

1. Clique em **"Candidatos"** (menu lateral)
2. Clique em **"Adicionar novo"**
3. Preencha:
   - Nome
   - BI/Passaporte
   - Curso
   - Nota (0-20)
   - Foto (opcional, max 2MB)
4. Clique **"Guardar"**

### Resultado:
- ✅ Dados salvos no localStorage (seu PC)
- ✅ Dados sincronizados com servidor
- ✅ **Aparece IMEDIATAMENTE no celular do colega!**

---

## 📊 Ver Dados Publicados

### Opção A: Como Administrador (seu PC)
1. Clique em **"Publicações"** (menu lateral)
2. Clique em **"Publicar Resultados"**
3. Marque **"Publicar"**
4. Clique **"Salvar"**

### Opção B: Como Público (celular colega)
1. Qualquer pessoa acessa: `http://192.168.100.209:8000`
2. Clica em **"Consultar Resultados Públicos"** (se publicados)
3. Vê:
   - 📊 Estatísticas gerais
   - 🏆 Top 10 ranking com fotos
   - 🔍 Pesquisa por BI
   - 📋 Lista completa

---

## 🔄 Sincronização - Como Funciona?

### Automático (Sem fazer nada):

1. **Ao abrir a página** - Sincroniza com servidor
2. **A cada 30 segundos** - Sincroniza periodicamente
3. **Ao mudar dados** - Envia alterações
4. **Entre abas** - Detecta mudanças em outra aba

### Você não precisa fazer nada, é tudo automático! 🤖

### Verificar sincronização:

Abra **DevTools** (F12) → **Console**

Você verá mensagens tipo:
```
[Sync] Inicializando sincronização de dados...
[Sync] ✅ Dados sincronizados do servidor
```

---

## 🐛 Problemas Comuns

### "Não consigo acessar pelo IP"

**Causa:** Colega não está na mesma rede WiFi

**Solução:**
1. Ambos conectem ao mesmo WiFi
2. Certifique-se que não há VPN ativa
3. Firewall pode bloquear - configure exceção para porta 8000

### "Dados não aparecem no celular"

**Causa:** Sincronização não ativa

**Solução:**
1. Abra DevTools (F12) → Console no celular
2. Procure por erros em vermelho
3. Recarregue a página (F5 ou Ctrl+Shift+R)
4. Verifique se servidor Node.js está rodando no terminal

### "Porta 8000 já está em uso"

**Causa:** Outro programa usando a porta

**Solução:**
```powershell
# Encontre o processo
netstat -ano | findstr :8000

# Feche o programa
# OU use porta diferente:
python -m http.server 9000 --bind 0.0.0.0
```

### "npm not found"

**Causa:** Node.js não instalado corretamente

**Solução:**
1. Baixe Node.js: https://nodejs.org/
2. Execute o instalador
3. **Reinicie o terminal** (feche e abra novo)
4. Teste: `npm --version`

### "Servidor Node.js não inicia"

**Causa:** Dependências não instaladas

**Solução:**
```powershell
cd d:\Users\joac\Downloads\fff-main\fff-main
npm install
npm start
```

---

## 📁 Onde estão os dados?

### LocalStorage (navegador):
- Visível em: DevTools (F12) → Application → Local Storage
- Perdido se limpar cache

### Arquivo JSON (permanente):
```
d:\Users\joac\Downloads\fff-main\fff-main\data\ipial_data.json
```
- Nunca é perdido
- Pode fazer backup copiando este arquivo
- Servidor sincroniza aqui

---

## 💡 Dicas Úteis

### Parar tudo
- Feche ambos os terminais

### Resetar dados
- Delete a pasta: `data/`
- Servidor recria vazia ao iniciar

### Fazer backup
```bash
# Copie a pasta data
cp -r data data_backup

# Ou use "Exportar JSON" na app
# Vá em: Publicações → Exportar JSON
```

### Restaurar backup
```bash
# Copie de volta
cp -r data_backup/* data
```

### Logs de atividade
```bash
# Ver todas as ações registradas
curl http://localhost:3000/api/logs
```

---

## ✨ Recursos Avançados

### API REST (para desenvolvedores)

Obter todos dados:
```bash
curl http://localhost:3000/api/data
```

Adicionar candidato (POST):
```bash
curl -X POST http://localhost:3000/api/candidates \
  -H "Content-Type: application/json" \
  -d '{
    "name": "João Silva",
    "bi": "123456789",
    "course": "Engenharia Informatica",
    "note": 15
  }'
```

Ver status:
```bash
curl http://localhost:3000/api/status
```

---

## 🎓 Próximos Passos

1. ✅ Sistema rodando em seu PC
2. ✅ Colega acessando pelo IP
3. ✅ Dados sincronizando automaticamente
4. ✅ Adicionar mais candidatos
5. ✅ Publicar resultados
6. ✅ Gerar relatórios (PDF/CSV)

---

## 📞 Precisa de Ajuda?

Consulte:
- **QUICKSTART.md** - Início rápido
- **README.md** - Overview
- **SERVIDOR_SINCRONIZACAO.md** - Documentação técnica
- **GUIA_COMPLETO.md** - Manual detalhado

---

## 🎉 Pronto!

Você agora tem um sistema de gestão de exames **totalmente sincronizado** em tempo real entre múltiplos dispositivos!

**Aproveite!** 🚀
