# 🧠 IntegraPsi

**IntegraPsi** é uma plataforma de gestão integrada para profissionais de psicologia e saúde mental, desenvolvida como uma solução completa para organizar agendas, gerenciar pacientes e acompanhar dados financeiros.

## 📋 Descrição do Projeto

IntegraPsi é uma aplicação mobile (Flutter) com backend (PHP) que facilita a prática clínica de psicólogos e terapeutas, oferecendo ferramentas intuitivas para:

- **Gestão de Agenda**: Visualizar e organizar agendamentos de sessões de forma eficiente
- **Gestão de Pacientes**: Manter registro detalhado de todos os pacientes e histórico de atendimentos
- **Controle Financeiro**: Acompanhar pagamentos, faturamento e pendências
- **Autenticação Segura**: Suporte para psicólogos e pacientes com perfis diferenciados
- **Sincronização em Tempo Real**: Dados sincronizados entre mobile e backend

## ✨ Funcionalidades Previstas

### Dashboard
- Visão geral das próximas sessões do dia
- Resumo financeiro (faturamento, pendências, crescimento)
- Atalhos rápidos para ações frequentes

### Agenda
- Visualização em timeline de horários
- Seletor de datas com navegação simples
- Status de confirmação de consultas
- Detalhes de cada agendamento

### Pacientes
- Lista completa de pacientes
- Status ativo/inativo
- Última data de sessão
- Histórico de atendimentos

### Financeiro
- Resumo de pagamentos mensais
- Status de pagamentos (pago/pendente)
- Relatórios financeiros
- Controle de receitas

### Autenticação
- Login diferenciado para psicólogos e pacientes
- Recuperação de senha
- Ativação de conta para novos pacientes

## 🛠️ Tecnologias Utilizadas

### Frontend
- **Flutter** - Framework cross-platform para Android e iOS
- **Dart** - Linguagem de programação do Flutter
- **GetX** - Gerenciamento de estado e navegação
- **Material Design 3** - Design system moderno

### Backend
- **MySQL/PostgreSQL** - Banco de dados relacional
- **RESTful API** - Comunicação entre frontend e backend

### Arquitetura
- **MVC Centralizado** - Padrão arquitetural clean e escalável
  - Controllers: Lógica de negócio
  - Views: Camada de apresentação
  - Models: Estrutura de dados
- **Injeção de Dependências** - Via GetX (Bindings)

## 📁 Estrutura do Projeto

```
lib/
├── bindings/              # Injeção de dependências
├── controllers/           # Lógica de negócio
├── views/                 # Telas da aplicação
├── core/                  # Configuração e constantes
│   ├── app_colors.dart
│   └── main_navigator.dart
├── data/                  # Camada de dados
│   ├── models/            # Estruturas de dados
│   └── services/          # Serviços de API
├── widgets/               # Componentes reutilizáveis
└── main.dart
```

## 🚀 Como Começar

### Pré-requisitos
- Flutter SDK (versão 3.0+)
- Dart SDK (incluído no Flutter)
- Android Studio ou Xcode (para emuladores)
- Git

### Instalação

1. **Clone o repositório**
   ```bash
   git clone <seu-repositorio>
   cd IntegraPsi
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**
   ```bash
   flutter run
   ```

## 📱 Plataformas Suportadas

- ✅ Android
- ✅ iOS
- 🔄 Web (futuro)

## 👥 Contribuidores

- Willian Stein Sanini

