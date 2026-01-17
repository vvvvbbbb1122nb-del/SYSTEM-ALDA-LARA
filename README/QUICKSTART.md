# ⚡ Quickstart - IPIAL System

## 🎯 Objetivo
Sistema de gestão de exames com sincronização de dados em tempo real entre múltiplos dispositivos.

---

## 🚀 Iniciar em 10 Segundos

### Windows
```
1. Clique 2x em: iniciar_sistema.bat
2. Escolha uma opção (1-5)
3. Pronto! A app abre em http://localhost:8000
```

### Linux/Mac
```bash
bash iniciar_sistema.sh
```

---

## 📋 Opções do Menu

1. **Localhost Simples** - Apenas Python, sem sincronização
2. **Localhost + Servidor** - Node.js + Python com sincronização (RECOMENDADO)
3. **Rede Local** - Compartilhe com colega via IP
4. **Apenas Node.js** - API REST para desenvolvedores
5. **Apenas Web** - Apenas navegador, sem sincronização

---

## 🔐 Login

- **Usuário:** `admin`
- **Senha:** `admin`

---

## 📋 O que fazer agora?

### Seu PC (Admin)
1. ✅ Adicione candidatos com fotos
2. ✅ Defina notas (aprox ≥10 = Aprovado)
3. ✅ Publique resultados (Publicações)

### Celular do Colega
1. ✅ Acesse: `http://192.168.100.209:8000`
2. ✅ Mesmo login (admin/admin)
3. ✅ **Dados aparecem em tempo real!** 📊

---

## 🌐 Links Úteis

| O quê | Link |
|------|------|
| **Local (PC)** | http://localhost:8000 |
| **Rede (Celular)** | http://192.168.100.209:8000 |
| **Servidor de Dados** | http://localhost:3000 |

---

## 💾 Dados Armazenados

- **LocalStorage** (navegador) - fallback local
- **Arquivo JSON** (`data/ipial_data.json`) - backup permanente
- **Servidor Node.js** - sincronização em tempo real

---

## 🛑 Parar Servidores

- Feche ambas as janelas de terminal

---

## ❓ Problemas?

1. **"Não consigo acessar pelo IP"**
   - Verifique se celular está na mesma rede
   - IP do seu PC: `ipconfig` → procure IPv4

2. **"Dados não sincronizam"**
   - Confirme que servidor Node.js está rodando
   - Console do navegador (F12) mostra erros

3. **"Porta 8000 em uso"**
   - Feche outro servidor rodando
   - Ou mude porta em iniciar_servidores.bat

---

## 📚 Documentação Completa

- **Setup detalhado:** [SERVIDOR_SINCRONIZACAO.md](SERVIDOR_SINCRONIZACAO.md)
- **Manual completo:** [GUIA_COMPLETO.md](GUIA_COMPLETO.md)
- **README principal:** [README.md](README.md)

---

## ✨ Recursos Principais

- ✅ Login seguro com timeout 10min
- ✅ CRUD completo de candidatos
- ✅ Upload de fotos (max 2MB)
- ✅ **Aprovação automática** (score ≥ 10)
- ✅ **Sincronização em tempo real**
- ✅ Ranking top 10 com fotos
- ✅ Pesquisa por BI/Passaporte
- ✅ Relatórios (PDF/HTML/CSV)
- ✅ Exportar/Importar JSON

---

## 🎓 Cursos Disponíveis

1. Engenharia Informática
2. Administração
3. Contabilidade
4. Gestão de Projetos
5. Educação Pré-Escolar
6. Educação Especial

---

## 🔧 Requisitos Mínimos

- Node.js (para sincronização)
- Python 3.7+
- Navegador moderno (Chrome, Firefox, Safari, Edge)
- Conexão WiFi (para compartilhar)

---

**Pronto para começar? Clique 2x em `iniciar_servidores.bat`!** 🚀
