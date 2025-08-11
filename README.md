# 🧰 LootPrice

**Seu loot com os melhores preços.**  
LootPrice é uma plataforma que compara preços de jogos para PC entre diversas lojas digitais confiáveis. Utiliza agentes inteligentes para buscar e atualizar os preços em tempo real, fornecendo ao usuário a melhor oferta possível.

![LootPrice Banner](./docs/docs/assets/smallbrand.png) <!-- opcional: banner do projeto -->

---

## 🚀 Visão Geral

LootPrice foi criado com foco em economia, escalabilidade e modularidade. Utilizamos uma arquitetura de microserviços com agentes de coleta distribuídos e orquestrados, que alimentam uma API moderna e responsiva, consumida por uma interface web intuitiva.

---

## 📦 Funcionalidades

✅ Comparação de preços em tempo real  
✅ Histórico de preços dos jogos  
✅ Interface web rápida e responsiva  
✅ Agentes independentes para cada loja  
✅ Orquestração de scraping agendado para lojas sem API pública  
✅ Preparado para alertas personalizados (futuro)  
✅ Arquitetura escalável com microserviços

---

## 🏗️ Arquitetura

- **Frontend:** Nextjs + TailwindCSS  
- **API Gateway:** Node.js (Express) + Prisma
- **Agentes de Coleta:** Python com Scraping (requests + BeautifulSoup / Playwright + Langchain)  
- **Banco de Dados:** PostgreSQL  
- **Orquestrador:** Celery com Redis ou Cronjobs  
- **Infraestrutura:** Docker + Docker Compose

> **Diagrama de arquitetura** ![aqui](./docs/docs/assets/ArchitectureMermaid.svg)

---

## 📁 Estrutura do Projeto

```bash
lootprice/
├── docs/                         # Documentação MkDocs
│   ├── mkdocs.yml
│   └── docs/
│       ├── index.md
│       └── architecture.md (...)
│
├── frontend/                     # Frontend com Next.js + TailwindCSS + TypeScript
│   ├── public/
│   ├── src/
│   │   ├── pages/
│   │   ├── components/
│   │   ├── services/
│   │   └── styles/
│   ├── next.config.js
│   ├── package.json
│   └── tsconfig.json
│
├── backend/
│   ├── api-gateway/              # Orquestrador de requisições
│   │   ├── src/
│   │   │   ├── controllers/
│   │   │   ├── routes/
│   │   │   ├── prisma/
│   │   │   └── index.ts
│   │   ├── prisma/
│   │   │   └── migrations/
│   │   ├── package.json
│   │   └── tsconfig.json
│   │
│   ├── auth-service/             # Serviço de autenticação
│   │   ├── src/
│   │   │   ├── controllers/
│   │   │   ├── routes/
│   │   │   ├── models/
│   │   │   └── index.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   │
│   ├── user-service/             # Gerencia usuários e preferências
│   │   ├── src/
│   │   │   ├── controllers/
│   │   │   ├── routes/
│   │   │   └── index.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   │
│   ├── price-tracker/            # Lógica de rastreamento e comparação de preços
│   │   ├── src/
│   │   │   ├── controllers/
│   │   │   ├── services/
│   │   │   ├── models/
│   │   │   └── index.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   │
│   ├── notification-service/     # Envio de notificações
│   │   ├── src/
│   │   │   ├── mailer/
│   │   │   ├── scheduler/
│   │   │   └── index.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   │
│   ├── scraper/                  # Scraper com agentes em Python
│   │   ├── agents/
│   │   │   ├── steam_agent.py
│   │   │   ├── epic_agent.py
│   │   │   └── nuuvem_agent.py (...)
│   │   ├── utils/
│   │   │   └── parser.py
│   │   ├── main.py
│   │   └── requirements.txt
│   │
│   └── database/                 # Banco de dados (PostgreSQL)
│       └── init.sql              # Script de inicialização
│
├── Dockerfile                    # Dockerfile principal (build multi-stage)
└── docker-compose.yml            # Configuração dos containers

```

## 📦 Tecnologias Principais

| Camada           | Tecnologias |
|------------------|-------------|
| Frontend         | React, Next.js, TailwindCSS, Axios |
| API REST         | Node.js + Express |
| Scraping Agents  | Python, requests, BeautifulSoup, Playwright |
| Orquestração     | Celery + Redis **ou** APScheduler |
| Banco de Dados   | PostgreSQL |
| Deploy           | Docker, Docker Compose, Railway, Render |

---

## 🛠️ Requisitos para Desenvolvimento

- [Node.js](https://nodejs.org/)
- [Python 3.10+](https://www.python.org/)
- [Docker](https://www.docker.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [Poetry](https://python-poetry.org/) (para dependências Python)
- [pnpm](https://pnpm.io/) (opcional para frontend)

---

## 🧪 Como Rodar Localmente

```bash
# 1. Clone o repositório
git clone https://github.com/CODEbugging3000/lootprice.git
cd lootprice

# 2. Suba os containers
docker-compose up --build

# 3. Frontend: http://localhost:3000
#    API: http://localhost:8000/api
```

## 💡 Próximos Passos
- [ ] Implementar alertas personalizados
- [ ] Adicionar novos agentes (GreenManGaming, GOG, etc.)
- [ ] Dashboard para usuários logados
- [ ] Sistema de favoritos
- [ ] Exportação dos dados em CSV/JSON

## 📚 Documentação
A documentação completa do projeto está sendo construída com MkDocs.
👉 Acesse [aqui](https://codebugging3000.github.io/lootprice/)

## 🤝 Contribuindo
Contribuições são bem-vindas! Veja a página [contributing](https://codebugging3000.github.io/lootprice/contributing/) na documentação para saber como ajudar.

## 🧑‍💻 Autores
- [Gabriel Alves](https://github.com/CODEbugging3000) — Idealizador, desenvolvedor principal


## 📄 Licença
Este projeto está sob a licença MIT.

