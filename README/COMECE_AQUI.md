# 👉 COMECE AQUI - Seu Primeiro Passo

## 🎯 Objetivo

Iniciar o sistema IPIAL em menos de 1 minuto.

---

## ⚡ 3 Passos Rápidos

### Passo 1: Encontre o Arquivo

Abra a pasta do projeto e procure por:

**Windows:**
```
📁 fff-main
  └─ 📄 iniciar_sistema.bat  ← CLIQUE 2x AQUI
```

**Linux/Mac:**
```
📁 fff-main
  └─ 📄 iniciar_sistema.sh  ← EXECUTE ISTO
```

### Passo 2: Escolha uma Opção

Quando o menu aparecer, escolha uma:

```
[1] Localhost Simples
    → Testes rápidos, sem sincronização

[2] Localhost + Servidor ⭐ RECOMENDADO
    → Desenvolvimento com sincronização
    
[3] Rede Local (Compartilhado) 🌐
    → Colega consegue acessar pelo celular
    
[4] Apenas Servidor Node.js
    → Para desenvolvedores (API)
    
[5] Apenas Servidor Web
    → Modo simplificado
```

**Digite o número desejado + ENTER**

### Passo 3: Acesse a Aplicação

Abra no navegador:

```
http://localhost:8000
```

**Pronto! Sistema iniciado.** ✅

---

## 🔐 Fazer Login

Quando a página carregar:

```
Usuário: admin
Senha: admin
```

Clique em "Entrar"

---

## 📝 Adicionar Candidatos

1. No menu lateral, clique em **"Candidatos"**
2. Clique em **"Adicionar novo"**
3. Preencha os dados:
   - Nome (min 5 caracteres)
   - BI/Passaporte (único)
   - Curso (dropdown)
   - Nota (0-20)
   - Foto (opcional, max 2MB)
4. Clique em **"Guardar"**
5. ✅ Status é atribuído automaticamente!

---

## 📊 Ver Estatísticas

Depois de adicionar candidatos:

1. Vai para **"Dashboard"** (home)
2. Vê estatísticas:
   - Total de candidatos
   - Aprovados vs Rejeitados
   - Gráficos (se implementado)

---

## 🏆 Ranking Top 10

1. Vá para **"Publicações"**
2. Clique em **"Publicar Resultados"**
3. Marque **"Publicar"**
4. Clique em **"Salvar"**
5. Agora o público pode ver:
   - Top 10 ranking
   - Fotos dos candidatos
   - Resultado (Aprovado/Rejeitado)

---

## 🌐 Compartilhar com Colega

### Se escolheu opção [3]:

1. O sistema mostra seu IP:
   ```
   Rede Local: http://192.168.100.209:8000
   ```

2. Copie este link (seu IP real será diferente)

3. Envie para o colega via:
   - WhatsApp
   - Email
   - Telegram
   - Qualquer app de mensagem

4. Colega abre no celular/laptop

5. Faz login com **admin/admin**

6. **Vê exatamente os mesmos dados que você!** 🎉

---

## 💾 Sincronização

### Automática:
- A cada 30 segundos
- Sem fazer nada especial
- Dados salvos em arquivo

### Se Offline:
- Continua funcionando (localStorage)
- Sincroniza quando voltar online

---

## 📱 Usar no Celular

### Opção [3] - Rede Local:

1. Colega abre navegador no celular
2. Digita: `http://192.168.100.209:8000` (seu IP)
3. Faz login
4. Vê dados em tempo real!

### Responsivo:
- ✅ Layout adapta a celular
- ✅ Botões grandes o suficiente
- ✅ Touch-friendly

---

## 🔄 Próximas Ações

### Após adicionar candidatos:

- ✅ Dashboard mostra estatísticas
- ✅ Publicar resultados
- ✅ Compartilhar com colega (opção [3])
- ✅ Gerar relatório PDF
- ✅ Exportar CSV para Excel

---

## 🐛 Dúvidas Comuns

### "Qual opção escolher?"
→ Escolha **[2]** ou **[3]** (ambas têm sincronização)

### "Colega não consegue acessar"
→ Verifique se estão na mesma WiFi
→ Confirme IP correto (192.168.x.x)

### "Dados não aparecem no celular"
→ Aguarde 30 segundos (sincronização)
→ Recarregue a página (F5)

### "Esquecer senha admin"
→ É apenas admin/admin (não muda)

### "Onde os dados são salvos?"
→ localStorage do navegador + arquivo JSON
→ Automático, sem precisar fazer nada

---

## ✨ Exemplos de Uso

### Cenário 1: Você é o Admin

```
1. Inicia sistema com opção [2]
2. Adiciona 50 candidatos
3. Publica resultados
4. Compartilha link com colega
5. Colega vê tudo no celular
6. Dados sincronizam em tempo real
```

### Cenário 2: Trabalho em Equipe

```
1. Admin A inicia com opção [3]
2. Admin B acessa via IP
3. Admin A adiciona candidatos
4. Admin B vê aparecer em tempo real
5. Admin B gera relatório
6. Ambos trabalham nos mesmos dados
```

### Cenário 3: Público Consulta

```
1. Admin publica resultados
2. Público acessa link da rede local
3. Vê ranking top 10 com fotos
4. Pode pesquisar por BI
5. Vê resultado (Aprovado/Rejeitado)
```

---

## 🎓 Dicas Profissionais

1. **Backup regularmente:**
   - Vá para Publicações → Exportar JSON
   - Salve em local seguro

2. **Use nomes descritivos:**
   - Nomes completos dos candidatos
   - BI/Passaporte válido

3. **Fotos de qualidade:**
   - Foto 2x3 (padrão)
   - Max 2MB
   - Formatos: JPG, PNG, GIF

4. **Notas precisas:**
   - Nota 0-20
   - ≥ 10 = Aprovado (automático)
   - < 10 = Rejeitado (automático)

---

## 📚 Precisa de Mais Ajuda?

| Arquivo | Para |
|---------|------|
| QUICKSTART.md | 10 segundos |
| GUIA_INICIALIZACAO.md | Explicação dos menus |
| README.md | Overview completo |
| SERVIDOR_SINCRONIZACAO.md | Detalhes técnicos |

---

## 🚀 Comece Agora!

```
1. Duplo clique em: iniciar_sistema.bat
2. Escolha opção: [2] ou [3]
3. Acesse: http://localhost:8000
4. Login: admin / admin
5. Comece a adicionar candidatos!
```

---

**Sistema pronto para usar! Boa sorte! 🎉**

Para dúvidas, consulte a documentação ou tente novamente.
