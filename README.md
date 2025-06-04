# Aplicativo de Notas Flutter com Autenticação Firebase

Um aplicativo Flutter seguro e amigável que implementa um sistema completo de autenticação usando Firebase Authentication. O aplicativo permite que os usuários se registrem, façam login e gerenciem suas notas com verificação de e-mail.

## Funcionalidades

- 🔐 Autenticação Segura com Firebase
- ✉️ Sistema de verificação de e-mail
- 👤 Registro e login de usuários
- 📝 Gerenciamento de notas
- 🎨 Interface moderna com Material Design
- 🔄 Gerenciamento de estado com FutureBuilder

## Estrutura do Projeto

```
lib/
├── constraints/     # Constantes e rotas do aplicativo
├── models/         # Modelos de dados e provedores
├── services/       # Lógica de negócios e serviços
│   └── auth/      # Serviço de autenticação
├── utils/         # Funções e auxiliares
├── views/         # Telas e widgets
└── main.dart      # Ponto de entrada do aplicativo
```

## Começando

### Pré-requisitos

- Flutter SDK
- Conta Firebase
- Android Studio / VS Code
- Firebase CLI

### Configuração

1. Clone o repositório
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Configure o Firebase:
   - Crie um novo projeto no Firebase
   - Adicione seu aplicativo Android/iOS ao projeto Firebase
   - Baixe e adicione o `google-services.json` (Android) ou `GoogleService-Info.plist` (iOS)
   - Ative a autenticação por Email/Senha no Console do Firebase

4. Execute o aplicativo:
   ```bash
   flutter run
   ```

## Fluxo de Autenticação

1. Usuário abre o aplicativo
2. Se não estiver logado, o usuário é direcionado para a tela de login
3. O usuário pode escolher registrar uma nova conta
4. Após o registro, a verificação de e-mail é necessária
5. Uma vez verificado, o usuário pode acessar a funcionalidade de notas

## Dependências

- Firebase Authentication
- Flutter Material Design
- Firebase Core
