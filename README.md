# 🚀 Welcome to Justt!

Welcome aboard! This guide will help you get set up with everything you need for a smooth onboarding experience.

## 📋 Table of Contents

- [Quick Start](#-quick-start)
- [Prerequisites & Installation](#-prerequisites--installation)
  - [Automated Installation](#automated-installation)
  - [Required Tools](#required-tools)
  - [Development Tools](#development-tools)
  - [MCP Configuration](#mcp-model-context-protocol-configuration)
- [Technology Stack](#-technology-stack)
  - [Frontend](#frontend)
  - [Backend](#backend)
  - [Infrastructure & DevOps](#infrastructure--devops)
- [Learning Resources](#-learning-resources)
  - [General Best Practices](#general-best-practices)
  - [JavaScript & TypeScript](#javascript--typescript)
  - [Node.js](#nodejs)
- [Development Conventions](#-development-conventions)
  - [Git Branch Naming](#git-branch-naming)
  - [Code Style](#code-style)
- [Infrastructure & Architecture](#-infrastructure--architecture)
  - [AWS CLI Setup](#aws-cli-setup)
  - [Monorepo Management](#monorepo-management)
  - [Services & Tools](#services--tools)
- [Access & Authentication](#-access--authentication)

---

## ⚡ Quick Start

1. Install all required tools using the automated script:
   ```bash
   ./scripts/install.sh
   ```

2. Configure AWS CLI and SSO:
   ```bash
   ./scripts/aws-setup.sh
   ```

3. Access company applications through [SSO Portal](https://myapps.microsoft.com/)

---

## 🛠️ Prerequisites & Installation

### Automated Installation

Run the following script to install most tools automatically:

```bash
./scripts/install.sh
```

### Required Tools

| Tool | Installation | Purpose |
|------|--------------|---------|
| 🍺 **Homebrew** | `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` | Package manager for macOS |
| 🐳 **Docker** | `brew install --cask docker` | Container platform |
| 📦 **Node.js** | Version 20.19 | JavaScript runtime |
| 🧶 **Yarn** | `brew install yarn` | Package manager |
| ☸️ **kubectl** | `brew install kubectl` | Kubernetes CLI |
| 🔧 **OpenAPI Generator** | `brew install openapi-generator` | API client generation |

### Development Tools

#### Code Editors
- 💻 [Visual Studio Code](https://code.visualstudio.com/Download) or [WebStorm](https://www.jetbrains.com/idea/download/#section=mac)
- 🤖 [Cursor](https://cursor.sh/) - AI-powered code editor with intelligent completion
- 🧠 [Claude](https://claude.ai/) - AI assistant for development tasks and code review

#### Database & Infrastructure Tools
- 🍃 [MongoDB Compass](https://www.mongodb.com/try/download/compass) - MongoDB GUI
- 👁️ [Lens](https://k8slens.dev/) - Kubernetes IDE
- 🔒 [Harmony VPN](https://support.perimeter81.com/docs/downloading-the-agent) - VPN client (request config from IT)
- 🛡️ [Vanta](https://docs.google.com/document/u/1/d/1MgeUVfOOIiSQeMsrYM97zCAuxwKGIxFkWJWYFufhdng/edit#) - Security compliance

#### MCP (Model Context Protocol) Configuration

If you're using Cursor or other AI-powered IDEs, you can configure MCP servers to extend AI capabilities:

- 📋 **[MCP Template](./mcp.template.json)** - Template configuration file with examples

Available integrations:
- 🐙 GitHub
- 📈 Groundcover (observability)
- 🔗 Custom services via n8n

---

## 🏗️ Technology Stack

### Frontend

| Technology | Purpose | Documentation |
|------------|---------|---------------|
| ⚛️ **Next.js** | React framework for client service | [Docs](https://nextjs.org/docs) |
| 🎨 **Tailwind UI** | CSS framework | [Docs](https://tailwindui.com/) |
| 💅 **Styled Components** | CSS-in-JS styling | [Docs](https://styled-components.com/) |
| 🔄 **React Query** | Data fetching, caching & state management | [Docs](https://react-query.tanstack.com/) |

### Backend

| Technology | Purpose | Documentation |
|------------|---------|---------------|
| 🟢 **Node.js** | JavaScript runtime | Version 20.19 |
| 📘 **TypeScript** | Type-safe JavaScript | [Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) |
| 🪺 **Nest.js** | Backend framework for microservices | [Docs](https://docs.nestjs.com/) |
| 🍃 **MongoDB** | Primary database | [Docs](https://www.mongodb.com/) |
| 📊 **Mongoose** | MongoDB ORM | [Docs](https://mongoosejs.com/docs/guide.html) |

### Infrastructure & DevOps

| Technology | Purpose | Documentation |
|------------|---------|---------------|
| 🐳 **Docker** | Container platform | [Docs](https://docs.docker.com/get-started/) |
| ☸️ **Kubernetes** | Container orchestration | [Docs](https://kubernetes.io/docs/tutorials/) |
| 🔄 **NX** | Monorepo management *(critical)* | [Docs](https://nx.dev/latest/angular/getting-started/intro) |
| ☁️ **AWS** | Cloud infrastructure | Multiple services |
| 📬 **SQS** | Message queue | [Docs](https://aws.amazon.com/sqs/) |
| 📡 **EventBridge** | Event bus & pub/sub | [Docs](https://aws.amazon.com/eventbridge/) |
| ⚡ **Redis** | In-memory cache | [Docs](https://redis.io/) |

> **⚠️ Important:** NX is essential for managing our monorepo, services, dependencies, and common libraries. You'll work with this tool frequently, so invest time in learning it well.

---

## 📚 Learning Resources

### General Best Practices

- 📖 [Clean Code Book](https://enos.itcollege.ee/~jpoial/oop/naited/Clean%20Code.pdf) - Essential reading for code quality

### JavaScript & TypeScript

#### JavaScript
- 🎥 [JavaScript: Understanding the Weird Parts](https://www.youtube.com/watch?v=Bv_5Zv5c-Ts&ab_channel=TonyAlicea) - Deep dive into JS fundamentals
- 🔄 [Async/Await Guide](https://nodejs.dev/learn/modern-asynchronous-javascript-with-async-and-await) - Modern async patterns
- ✨ [Clean Code in JavaScript](https://github.com/ryanmcdermott/clean-code-javascript) - Best practices

#### TypeScript
- 📘 [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) - Official documentation
- 🎥 [TypeScript with Node.js Best Practices](https://www.youtube.com/watch?v=ATUvAQZaTbM&ab_channel=node.js) - Practical guide

### Node.js

- ⭐ [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices) - Comprehensive guide

---

## 📐 Development Conventions

### Git Branch Naming

Follow these rules for branch naming:

- ✅ Start with JIRA ticket number (e.g., `NANO-1111`)
- ✅ Add short description (1-2 words)
- ✅ Use lowercase for description
- ✅ Maximum 30 characters total

**Example:** `NANO-1111-add-auth`

**Format:** `[JIRA-KEY]-[brief-description]`

### Code Style

We follow the [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html)

---

## 🏢 Infrastructure & Architecture

Justt uses a **microservices architecture** with a **monorepo** to manage our codebase.

### AWS CLI Setup

Automated AWS Azure SSO configuration:

```bash
./scripts/aws-setup.sh
```

This script will:
- ✅ Install aws-azure-login tool
- ✅ Configure AWS profiles (Development, Staging, Production)
- ✅ Set up automated session renewal
- ✅ Connect to Kubernetes clusters via Lens

📚 [Full AWS Azure SSO Documentation](https://acrocharge.atlassian.net/wiki/spaces/NANO/pages/164266065/AWS+Azure+SSO+for+CLI+access)

### Monorepo Management

We use **NX Framework** to manage:
- 📦 Services
- 🔗 Dependencies
- 📚 Common libraries
- 🔄 Build orchestration

**This is your primary development tool** - make sure to learn it thoroughly!

### Services & Tools

| Service | Purpose |
|---------|---------|
| 🍃 **MongoDB** | Primary database |
| 📬 **SQS** | Message queue for async processing |
| 📡 **EventBridge** | Event-driven architecture & pub/sub |
| ⚡ **Redis** | Caching layer |
| 🐳 **Docker** | Service containerization |
| ☸️ **Kubernetes** | Deployment & orchestration |

---

## 🔐 Access & Authentication

### SSO Portal

After completing the initial setup, access all company applications through:

**🌐 Hub URL:** https://myapps.microsoft.com/

This centralized portal provides access to all integrated applications and services once your SSO is configured.

---

## 🎯 Next Steps

1. ✅ Complete all installations
2. ✅ Configure AWS CLI and SSO
3. ✅ Review learning resources
4. ✅ Familiarize yourself with NX framework
5. ✅ Read the Clean Code book
6. ✅ Review our code style guide

**Questions?** Reach out to your team lead or check our internal wiki!

---

*Last updated: December 2025*


