# Teste Gemini - Design System Sample

Este é um projeto Flutter desenvolvido para criar e demonstrar um Design System modular. O aplicativo de exemplo serve como uma vitrine para os componentes reutilizáveis e 
funcionalidades de configuração que foram construídos.

## 🎯 Objetivo do Projeto

O objetivo principal é construir uma biblioteca de componentes de UI (Design System) que possam ser facilmente reutilizados em diferentes partes do aplicativo ou em outros projetos.
Isso promove consistência visual, acelera o desenvolvimento e facilita a manutenção.

A arquitetura foi pensada para ser escalável, separando a lógica de cada componente em seu próprio `ViewModel`.

## 📂 Estrutura de Pastas

O projeto está organizado com uma clara separação entre os componentes do Design System e as telas de exemplo que os utilizam:

- `lib/DesignSystem/Components`: Contém os widgets reutilizáveis e a lógica de negócios associada a eles (Ex: `Badge`, `ThemeChange`, `LanguageChange`).

- Cada componente é autônomo e gerenciado por seu próprio `ViewModel`.

- `lib/DesignSystem/Samples`: Contém as telas que demonstram o uso prático dos componentes. (Ex: `ConfigSampleScreen`, `BadgeSampleScreen`).

- `lib/l10n`: Armazena os arquivos de tradução para a internacionalização do aplicativo, utilizando uma abordagem manual para maior controle.

- `lib/main.dart`: Ponto de entrada do aplicativo. É responsável por inicializar os `Providers` para gerenciamento de estado global e configurar a navegação principal.

## ✨ Funcionalidades Implementadas

*   **Gerenciamento de Estado com Provider:** O estado global do aplicativo (tema, idioma, notificações, etc.) é gerenciado de forma centralizada utilizando o pacote `Provider`.

*   **Tela de Configurações:** Uma tela central que permite ao usuário customizar a experiência do app, incluindo:
    *   **Troca de Tema:** Alternar entre os modos claro (Light) e escuro (Dark).
    *   **Troca de Idioma:** Suporte para Inglês, Português e Espanhol com atualização em tempo real da UI.
    *   **Customização de Fonte:** Alterar o tamanho, a cor e a família da fonte (`Roboto`, `Lato`, `Montserrat`) em todo o aplicativo.

*   **Sistema de Notificações (Badge):** Um ícone na `AppBar` que exibe um contador de notificações, com uma tela dedicada para visualizar e limpar essas notificações.

## 🚀 Como Executar o Projeto

1.  **Clone o repositório:**
    ```sh
    git clone <URL_DO_SEU_REPOSITORIO>
    cd teste_gemini
    ```

2.  **Instale as dependências:**
    ```sh
    flutter pub get
    ```

3.  **Adicione as fontes (Ação Manual):**
    - Crie a pasta `assets/fonts/` na raiz do projeto.
    - Baixe e adicione os arquivos `Lato-Regular.ttf` e `Montserrat-Regular.ttf` dentro desta pasta.

4.  **Execute o aplicativo:**
    ```sh
    flutter run
    ```

---

*Este projeto foi desenvolvido com o auxílio do Gemini Code Assist.*

