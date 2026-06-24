<h1 align="center">Change UPN Entra</h1>

<p align="center">
  <a href="#-portugu%C3%AAs"><img src="https://img.shields.io/badge/lang-Portugu%C3%AAs-009c3b?style=for-the-badge" alt="Português"></a>
  <a href="#-english"><img src="https://img.shields.io/badge/lang-English-002868?style=for-the-badge" alt="English"></a>
</p>

---

## 🇧🇷 Português

### 📌 Visão Geral

Este repositório contém um script PowerShell que **altera em massa o UPN (User Principal Name)** dos usuários no **Microsoft Entra ID** (Azure AD) usando o **Microsoft Graph**. Ele troca o domínio do UPN de todos os usuários de um domínio antigo para um novo — útil em migrações de domínio, rebranding ou consolidação de tenants.

### 📂 Script

| Arquivo | Descrição |
|---------|----------|
| `changeupnentra.ps1` | Conecta ao Microsoft Graph e atualiza o UPN de todos os usuários do domínio antigo para o novo. Comentários bilíngues (PT/EN). |

### ⚙️ O que o script faz

1. **Conecta ao Microsoft Graph** com o escopo `User.ReadWrite.All`.
2. **Define o domínio antigo e o novo** (variáveis `$OldDomain` e `$NewDomain`).
3. **Busca todos os usuários** e filtra os que pertencem ao domínio antigo.
4. **Constrói o novo UPN** mantendo a parte local (antes do `@`) e trocando o domínio.
5. **Atualiza cada usuário** com `Update-MgUser`, exibindo sucesso ou erro.
6. **Desconecta** da sessão do Graph.

### ▶️ Como usar

```powershell
# Instalar o módulo (se necessário)
Install-Module Microsoft.Graph -Scope CurrentUser

# Editar as variáveis $OldDomain e $NewDomain dentro do script e executar
.\changeupnentra.ps1
```

### ✅ Pré-requisitos

- Módulo **Microsoft.Graph** instalado.
- Conta com permissões para alterar usuários (consentir o escopo `User.ReadWrite.All`).
- PowerShell 5.1 ou superior.

> ⚠️ Alterar o UPN pode impactar o login dos usuários e serviços associados. **Teste em um ambiente controlado** e edite `$OldDomain`/`$NewDomain` antes de executar em produção.

---

## 🇺🇸 English

### 📌 Overview

This repository contains a PowerShell script that **bulk-changes the UPN (User Principal Name)** of users in **Microsoft Entra ID** (Azure AD) using **Microsoft Graph**. It switches the UPN domain of all users from an old domain to a new one — useful for domain migrations, rebranding or tenant consolidation.

### 📂 Script

| File | Description |
|------|-------------|
| `changeupnentra.ps1` | Connects to Microsoft Graph and updates the UPN of all users from the old domain to the new one. Bilingual comments (PT/EN). |

### ⚙️ What the script does

1. **Connects to Microsoft Graph** with the `User.ReadWrite.All` scope.
2. **Defines the old and new domains** (`$OldDomain` and `$NewDomain` variables).
3. **Fetches all users** and filters those belonging to the old domain.
4. **Builds the new UPN** keeping the local part (before the `@`) and swapping the domain.
5. **Updates each user** with `Update-MgUser`, printing success or error.
6. **Disconnects** from the Graph session.

### ▶️ How to use

```powershell
# Install the module (if needed)
Install-Module Microsoft.Graph -Scope CurrentUser

# Edit the $OldDomain and $NewDomain variables inside the script and run it
.\changeupnentra.ps1
```

### ✅ Requirements

- **Microsoft.Graph** module installed.
- Account with permission to modify users (consent to the `User.ReadWrite.All` scope).
- PowerShell 5.1 or later.

> ⚠️ Changing the UPN can impact user sign-in and associated services. **Test in a controlled environment** and edit `$OldDomain`/`$NewDomain` before running in production.

---

<p align="center">Made with ❤️ by <a href="https://github.com/Ch1c4n0">Marcelo dos Santos Gonçalves</a></p>
