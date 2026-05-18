# IntegraPsi

Uma plataforma de gestão clínica integrada desenvolvida para otimizar e centralizar a rotina de psicólogos autônomos e seus pacientes.

## 📝 Descrição do Projeto
O **IntegraPsi** unifica o fluxo administrativo e clínico da psicologia em um ambiente seguro e fluido. O aplicativo resolve o problema da fragmentação de ferramentas (como o uso de planilhas, papel e múltiplos apps de mensagens) ao centralizar o agendamento de consultas, prontuários eletrônicos e sessões remotas em um único ecossistema, automatizando a jornada desde o primeiro convite ao paciente até o registro histórico das sessões.

## ✨ Funcionalidades Previstas
### Módulo do Psicólogo
* **Gestão de Agenda:** Abertura de horários e controle de consultas agendadas.
* **Geração de Convites:** Criação de códigos de ativação únicos e temporários para novos pacientes.
* **Prontuário Eletrônico (PEP):** Registro histórico e sigiloso das evoluções clínicas das sessões.
* **Integração com Videoconferência:** Geração automatizada de links do Google Meet via API.

### Módulo do Paciente
* **Ativação por Convite:** Primeiro acesso simplificado através do código recebido pelo profissional.
* **Cadastro de Perfil:** Registro seguro contendo dados de identificação obrigatórios (CPF e CRP).
* **Painel de Consultas:** Acesso rápido aos horários das sessões e botão direto para teleconsultas.

## 🚀 Tecnologias Utilizadas
* **Frontend:** Flutter (Dart) com gerenciamento de estado via GetX.
* **Backend:** PHP / Laravel (API RESTful integrada com Google Calendar API).
* **Banco de Dados:** PostgreSQL (Persistência relacional utilizando Class Table Inheritance).