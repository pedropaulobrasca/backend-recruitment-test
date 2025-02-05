# Sistema de Gerenciamento de Empresas com GraphQL

<div align="center">
  <img src="assets/images/altair.png" alt="GraphQL Client" width="600">
</div>

## 📋 Sobre o Projeto

Este é um sistema de gerenciamento de empresas desenvolvido com Elixir e Phoenix Framework, utilizando GraphQL através do plugin Absinthe. O sistema oferece uma API robusta para gerenciar empresas e seus proprietários, com recursos de auditoria e integração completa.

## 🚀 Funcionalidades

- CRUD completo de empresas e proprietários
- Sistema de auditoria para rastreamento de mudanças
- API GraphQL com Absinthe
- Sistema de e-mails com Swoosh
- Suporte a CORS para integração frontend
- Telemetria para monitoramento
- Testes automatizados

## 🛠️ Tecnologias Utilizadas

- **Elixir 1.14+**: Linguagem de programação
- **Phoenix 1.7.18**: Framework web
- **Absinthe 1.7**: Implementação GraphQL
- **Ecto 3.10**: ORM para banco de dados
- **PostgreSQL**: Banco de dados
- **Docker**: Containerização
- **Swoosh**: Sistema de e-mails
- **Corsica**: Gerenciamento de CORS
- **Jason/Poison**: Parsers JSON

## ⚙️ Pré-requisitos

- Docker e Docker Compose
- Elixir 1.14 ou superior
- PostgreSQL
- Mix (gerenciador de pacotes Elixir)

## 🔧 Configuração do Ambiente

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/backend-recruitment-test.git
cd backend-recruitment-test
```

2. Configure as variáveis de ambiente:
```bash
cp .env.example .env
# Edite o arquivo .env com suas configurações
```

3. Inicie o container do banco de dados:
```bash
docker-compose up database
```

4. Configure o projeto:
```bash
mix setup
```

5. Inicie o servidor:
```bash
mix phx.server
```

O servidor estará disponível em [`localhost:4000`](http://localhost:4000)

## 📊 Estrutura do Projeto

```
backend-recruitment-test/
├── lib/
│   ├── recruitment_test/
│   │   ├── enterprises/     # Contexto de empresas
│   │   ├── owners/          # Contexto de proprietários
│   │   ├── audit_log/       # Sistema de auditoria
│   │   └── mailer/          # Sistema de e-mails
│   └── recruitment_test_web/
│       ├── resolvers/       # Resolvers GraphQL
│       ├── schema/          # Schema GraphQL
│       │   ├── mutations/   # Mutations GraphQL
│       │   ├── queries/     # Queries GraphQL
│       │   └── types/       # Tipos GraphQL
│       └── telemetry.ex     # Configuração de telemetria
├── config/                  # Configurações do projeto
├── priv/
│   └── repo/migrations/     # Migrações do banco
└── test/                    # Testes automatizados
```

## 📝 Documentação da API GraphQL

### Queries
- `enterprises`: Lista todas as empresas
- `enterprise(id: ID!)`: Busca uma empresa específica
- `owners`: Lista todos os proprietários
- `owner(id: ID!)`: Busca um proprietário específico

### Mutations
- `createEnterprise`: Cria uma nova empresa
- `updateEnterprise`: Atualiza uma empresa existente
- `deleteEnterprise`: Remove uma empresa
- `createOwner`: Cria um novo proprietário
- `updateOwner`: Atualiza um proprietário
- `deleteOwner`: Remove um proprietário

## 🧪 Testes

Execute os testes com:
```bash
mix test
```

Para cobertura de testes:
```bash
mix test --cover
```

## 📈 Monitoramento

O sistema inclui:
- Logs de auditoria para todas as operações
- Telemetria Phoenix para monitoramento de performance
- Logs de e-mails enviados

## 🚀 Deploy

### Usando Docker

1. Construa a imagem:
```bash
docker build -t recruitment-test .
```

2. Execute o container:
```bash
docker-compose up
```

## 📄 Licença

Este projeto está sob a licença MIT.

## 📞 Contato

Para dúvidas ou sugestões, entre em contato: tecnologia@hubscontabilidade.com.br
