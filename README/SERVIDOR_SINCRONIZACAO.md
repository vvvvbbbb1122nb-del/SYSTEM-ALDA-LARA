# 🚀 Sincronização de Dados com Servidor Node.js

## 📋 O Problema

Antes: Cada dispositivo tinha seus próprios dados no localStorage (isolado).
Agora: **Um servidor centralizado compartilha os dados entre TODOS os dispositivos!**

---

## ✨ Como Funciona

```
┌─────────────┐        ┌──────────────────┐        ┌─────────────┐
│ PC do Admin │◄──────►│  Servidor Node   │◄──────►│ Celular     │
│ (Port 3000) │        │  (Port 3000)     │        │ Colega      │
└─────────────┘        └──────────────────┘        └─────────────┘
     ↓                        ↓                           ↓
  localStorage          ipial_data.json              localStorage
                     (arquivos sincronizados)
```

**Vantagens:**
- ✅ Dados compartilhados em tempo real
- ✅ Sem precisar exportar/importar JSON
- ✅ localStorage como fallback (funciona offline)
- ✅ Histórico salvo em arquivo permanente
- ✅ Múltiplos usuários, mesmos dados

---

## 🛠️ Instalação

### Passo 1: Instalar Node.js

**Windows:**
1. Baixe em https://nodejs.org/ (LTS recomendado)
2. Execute o instalador
3. Verifique a instalação:
```bash
node --version
npm --version
```

### Passo 2: Instalar dependências

Na pasta do projeto, execute:

```bash
npm install
```

Isso instala Express, CORS e Body-Parser automaticamente.

---

## 🚀 Executar o Servidor

### Opção 1: Servidor + App (Recomendado)

Abra **DOIS terminais** diferentes:

**Terminal 1 - Servidor de Dados:**
```bash
cd d:\Users\joac\Downloads\fff-main\fff-main
npm start
# ou: node server.js
```

**Terminal 2 - Servidor Web:**
```bash
cd d:\Users\joac\Downloads\fff-main\fff-main
python -m http.server 8000 --bind 0.0.0.0
```

**Resultado:**
- Servidor de dados: `http://localhost:3000`
- Aplicação web: `http://localhost:8000` (localhost) ou `http://192.168.100.209:8000` (rede)
- Dados salvos em: `data/ipial_data.json`

### Opção 2: Apenas Servidor Web (sem sincronização)

```bash
python -m http.server 8000 --bind 0.0.0.0
```

**Nota:** A sincronização não funcionará, mas a app continua com localStorage.

---

## 📱 Acessar de Outros Dispositivos

### Do PC (Local):
```
http://localhost:8000
```

### Da Rede (Celular, Laptop, etc):
```
http://192.168.100.209:8000
```

**Todos verão e compartilharão os mesmos dados!** 🎉

---

## 📊 API REST (Técnico)

O servidor oferece uma API completa:

```
GET    /api/data              → Obter todos dados
POST   /api/data              → Salvar todos dados
GET    /api/candidates        → Listar candidatos
POST   /api/candidates        → Adicionar candidato
GET    /api/candidates/:bi    → Buscar por BI
PUT    /api/candidates/:bi    → Atualizar candidato
DELETE /api/candidates/:bi    → Deletar candidato
GET    /api/logs              → Listar logs
POST   /api/logs              → Adicionar log
GET    /api/status            → Status do servidor
```

**Exemplo (curl):**
```bash
curl http://localhost:3000/api/status
```

---

## 💾 Dados

### Localização
Os dados são salvos em:
```
projeto/data/ipial_data.json
```

### Estrutura
```json
{
  "candidates": [...],
  "logs": [...],
  "config": {...},
  "published": false,
  "lastSync": "2026-01-17T10:30:00.000Z"
}
```

### Backup Automático
- ✅ Dados salvos a cada alteração
- ✅ Arquivo JSON permanente
- ✅ Pode fazer backup da pasta `data/`

---

## 🔄 Sincronização Automática

A aplicação sincroniza automaticamente:

1. **Ao carregar a página** - Pega dados do servidor
2. **A cada 30 segundos** - Sincroniza periodicamente
3. **Ao mudar dados** - Envia alterações para servidor
4. **Entre abas** - Detecta mudanças em outras abas

**Você não precisa fazer nada, é automático!**

---

## 🐛 Troubleshooting

### "npm command not found"
- Instale Node.js: https://nodejs.org/
- Reinicie o terminal depois

### "Servidor não inicia"
- Certifique-se que porta 3000 não está em uso
- Use porta diferente: `npm start -- --port 4000` (edite server.js)

### "Dados não sincronizam"
- Verifique se servidor está rodando em outro terminal
- Abra DevTools (F12) → Console para ver mensagens de erro
- Recarregue a página

### "Erro CORS"
- Servidor já tem CORS ativado
- Se problemas, verifique firewall

### "Arquivo ipial_data.json não criado"
- Servidor precisa de permissão para criar arquivo
- Execute terminal como administrador

---

## 🔐 Segurança

⚠️ **Importante:**
- Este servidor é para **desenvolvimento/rede interna**
- **NÃO use em produção** sem adicionar autenticação
- Porta 3000 fica aberta na rede local
- Dados em texto plano no arquivo JSON

Para produção:
- Use HTTPS
- Adicione autenticação (JWT, sessão)
- Use banco de dados (MongoDB, PostgreSQL)
- Deploy em servidor seguro

---

## 📝 Comandos Úteis

```bash
# Iniciar servidor
npm start

# Verificar se servidor está rodando
curl http://localhost:3000/api/status

# Ver arquivo de dados
cat data/ipial_data.json

# Resetar dados (senha: admin@reset)
curl -X POST http://localhost:3000/api/reset \
  -H "Content-Type: application/json" \
  -d '{"password":"admin@reset"}'
```

---

## ❓ Dúvidas Frequentes

**P: Preciso do servidor para usar a app?**
R: Não. A app funciona só com localStorage. O servidor é **opcional** para compartilhar dados.

**P: Se o servidor cair, perco dados?**
R: Não. Os dados estão salvos no arquivo JSON. A app continua funcionando com localStorage.

**P: Posso usar sem Node.js?**
R: Sim, apenas sem sincronização. Mas Node.js é fácil de instalar.

**P: Quantos usuários podem acessar simultaneamente?**
R: Teoricamente ilimitado. Mas para muitos usuários, considere um banco de dados real.

**P: Como fazer backup?**
R: Copie a pasta `data/` ou use "Exportar JSON" na aplicação.

---

## 🎯 Resumo

1. **Instalar Node.js** → `https://nodejs.org/`
2. **Instalar dependências** → `npm install`
3. **Abrir dois terminais**
   - Terminal 1: `npm start` (servidor dados)
   - Terminal 2: `python -m http.server 8000 --bind 0.0.0.0` (servidor web)
4. **Acessar a aplicação** → `http://localhost:8000`
5. **Compartilhar com colegas** → `http://192.168.100.209:8000`

**Pronto! Todos os dados são compartilhados em tempo real.** 🚀
