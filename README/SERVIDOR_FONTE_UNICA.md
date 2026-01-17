# 🔒 Sistema Centralizado no Servidor - Todos Veem Tudo

## 📋 Visão Geral

Agora o sistema foi reorganizado para que **o servidor seja a ÚNICA fonte de verdade**. Todos os dados são sempre sincronizados bidireccionalmente:

```
┌─────────────────────┐
│   Servidor IPIAL    │  ← FONTE ÚNICA DE DADOS
│ (data/ipial_data.json) │
└──────────┬──────────┘
           │
    ┌──────┴──────────────────┬────────────────────────────┐
    │                         │                            │
┌───▼──────────┐      ┌───────▼────────┐        ┌───────────▼─────┐
│ Celular 1    │      │ Celular 2      │        │ Celular 3       │
│ (João)       │      │ (Maria)        │        │ (Pedro)         │
│ localhost    │      │ localhost      │        │ localhost       │
└──────────────┘      └────────────────┘        └─────────────────┘

Todos veem SEMPRE os mesmos dados!
```

## 🔄 Fluxo de Sincronização (Novo Sistema)

### 1️⃣ Quando você adiciona um candidato:

```
User inputs data → appState.addCandidate() → appState.save()
                                                    ↓
                     ┌────────────────────────────────┴─────────────────┐
                     ↓                                                   ↓
          Storage.saveCandidates()          dataSync.syncToServer()
          (localStorage local)              (POST /api/data)
                                                    ↓
                                       Servidor salva em JSON
                                       (data/ipial_data.json)
                                                    ↓
                                       dataSync.syncFromServer()
                                       Retorna dados finais
                                                    ↓
                                       localStorage atualizado
                                       appState atualizado
```

### 2️⃣ Outros utilizadores recebem automaticamente:

```
Timer: A cada 15 segundos
           ↓
dataSync.syncFromServer()  (GET /api/data)
           ↓
Comparação com servidor
           ↓
Se há novos dados:
  - Atualiza localStorage
  - Atualiza appState
  - Re-renderiza a página
```

### 3️⃣ Quando você muda de aba/janela:

```
Usuário clica fora → window 'blur' event
                        ↓
             dataSync.syncToServer()  (UPLOAD)
                        ↓
             dataSync.syncFromServer()  (DOWNLOAD)
                        ↓
             localStorage + appState atualizados
```

### 4️⃣ Quando você volta à aba:

```
Usuário volta → window 'focus' event
                        ↓
             dataSync.syncFromServer()
                        ↓
             Dados do servidor carregados
                        ↓
             Página re-renderizada
```

## 🎯 Pontos de Sincronização

| Evento | Tipo | Ação |
|--------|------|------|
| **Adicionar candidato** | MANUAL | ✅ UPLOAD + DOWNLOAD |
| **Editar candidato** | MANUAL | ✅ UPLOAD + DOWNLOAD |
| **Publicar resultados** | MANUAL | ✅ UPLOAD + DOWNLOAD |
| **A cada 15 segundos** | AUTOMÁTICO | ✅ DOWNLOAD |
| **Sair da aba** | AUTOMÁTICO | ✅ UPLOAD + DOWNLOAD |
| **Voltar da aba** | AUTOMÁTICO | ✅ DOWNLOAD |
| **Fechar página** | AUTOMÁTICO | ✅ UPLOAD |
| **Carregar página** | AUTOMÁTICO | ✅ DOWNLOAD |

## 📊 Dados que são Sincronizados

```javascript
{
  "candidates": [
    {
      "id": "cand_1705498582000",
      "fullName": "João Silva",
      "age": 18,
      "idNumber": "12345678",
      "contact": "912345678",
      "course": "Engenharia Informatica",
      "score": 85.5,
      "status": "APROVADO",
      "photo": "data:image/jpeg;base64,...",
      "createdAt": "2025-01-17T14:16:22.000Z"
    },
    // ... mais candidatos
  ],
  "logs": [
    {
      "action": "Novo candidato: João Silva (APROVADO)",
      "timestamp": "2025-01-17T14:16:22.000Z",
      "user": "Admin"
    },
    // ... mais logs
  ],
  "config": {
    "isPublished": false
  },
  "published": false,
  "lastSync": "2025-01-17T14:16:22.000Z"
}
```

## 🔐 Por que o Servidor é a Autoridade

1. **Um único ponto de verdade** → Sem conflitos entre dispositivos
2. **Dados persistentes** → Não são perdidos ao fechar o navegador
3. **Acessível remotamente** → Via IP (192.168.100.X:3000)
4. **Escalonável** → Suporta múltiplos utilizadores simultaneamente

## 🧪 Teste o Sistema

### Teste 1: Dois Celulares no Mesmo WiFi
1. **Celular A**: Abra `http://192.168.100.X:3000`
2. **Celular B**: Abra `http://192.168.100.X:3000`
3. **Celular A**: Adicione um novo candidato
4. **Resultado**: Em menos de 15 segundos, aparece no Celular B! ✅

### Teste 2: Lista Pública em Tempo Real
1. **Dispositivo A**: Adicione candidato + Publique
2. **Dispositivo B**: Abra a página pública (`/`)
3. **Resultado**: Vê logo o candidato! ✅

### Teste 3: Múltiplos Utilizadores Editando
1. **User 1**: Adiciona "Candidato A"
2. **User 2**: Adiciona "Candidato B"  
3. **User 1**: Atualiza nota do "Candidato B"
4. **Resultado**: Todos veem as mesmas mudanças na mesma ordem! ✅

## 📝 Logs de Sincronização

No console do navegador (F12):

```
[Sync] Inicializando sincronização de dados...
[Sync] ✅ Dados baixados do servidor
[Sync] ✅ Dados enviados para servidor
[Sync] Página perdeu foco, sincronizando...
[Sync] Página voltou ao foco, sincronizando...
```

Na aba "Relatórios" → "Logs de Atividade":

```
Novo candidato: João Silva (APROVADO)        | 17/01/2025 14:16:22 | Admin
Dados sincronizados com servidor (1 candidatos) | 17/01/2025 14:16:23 | Admin
```

## 🚀 Melhorias Implementadas

| Mudança | Antes | Depois |
|---------|-------|--------|
| **Intervalo de sync** | 30 segundos | **15 segundos** |
| **Ao carregar página** | Usa localStorage | **Busca do servidor** |
| **Ao sair da aba** | Sincroniza upload | **Upload + Download** |
| **Ao voltar da aba** | Nada | **Download automático** |
| **Após adicionar candidato** | Upload apenas | **Upload + Download** |
| **Prioridade** | localStorage | **Servidor (verdade)** |

## ⚠️ Pontos Importantes

1. **Servidor deve estar sempre rodando** → `node server.js`
2. **Todos devem acessar a MESMA URL** → `http://192.168.100.X:3000`
3. **Sem conflitos de dados** → Servidor resolveu tudo
4. **Dados persistentes** → Nunca perdem (guardados em JSON)

## 🎓 Para Desenvolvedores

Se quiser adicionar mais sincronizações em algum lugar:

```javascript
// Sincronizar apenas download (receber dados dos outros)
if (typeof dataSync !== 'undefined') {
    dataSync.syncFromServer();
}

// Sincronizar apenas upload (enviar nossos dados)
if (typeof dataSync !== 'undefined') {
    dataSync.syncToServer();
}

// Sincronizar bidireccional (completo)
if (typeof dataSync !== 'undefined') {
    await dataSync.syncToServer();
    await dataSync.syncFromServer();
}
```

## 📞 Resumo

**Antes**: Cada dispositivo guardava dados no localStorage → **Não sincronizava**

**Agora**: Servidor é a ÚNICA fonte de verdade → **Todos veem tudo em tempo real** ✅

