# 📖 Meu Grimório - Gestão de Leitura com Flutter

<p align="center">
  <img src="projeto.gif" alt= "GIF da aplicação desenvolvida." />
</p> 

O **Meu Grimório** é uma aplicação Flutter completa e sofisticada, desenvolvida como resultado de um exercício prático avançado na trilha mobile da **Alura**. O projeto vai além do CRUD básico, focando intensamente na experiência do usuário (UX) através de **animações refinadas**, design moderno e integração com APIs externas e persistência local.

---

## ✨ Diferenciais e Qualidades do Projeto

Este projeto destaca-se pela aplicação de conceitos avançados de **Motion Design** e uma arquitetura limpa, proporcionando uma navegação fluida e elegante.

### 🚀 Experiência de Inicialização (Splash Sync)
Um dos grandes diferenciais é o fluxo de inicialização. O app utiliza o pacote `flutter_native_splash` para configurar uma splash screen nativa, eliminando a tela branca/logo padrão do Flutter. 
* **Continuidade Visual:** Ao carregar o framework, o app transita para uma `SplashScreen` customizada em Flutter, onde um `AnimatedOpacity` faz a logo surgir suavemente, criando uma sensação de polimento profissional desde o primeiro segundo de uso.

### 🎢 Motion Design e Animações
O projeto é um estudo de caso sobre como dar vida a uma interface:
* **Carrossel Interativo:** No Dashboard, utilizamos o `carousel_slider` com rolagem automática e indicadores animados para apresentar as funcionalidades de forma dinâmica. Apesar de não aparecer no gif de apresentação, como modificação do projeto original adicionei indicadores circulares em baixo do carrossel para informar quantos itens ele possui e qual está selecionado no momento.
* **Lottie Animations:** Integração de arquivos vetoriais `Lottie` (como o livro animado na tela inicial vazia), que garantem animações complexas e leves sem perda de qualidade.
* **Material Motion:** Implementação da biblioteca `animations`. Um exemplo notável é a `SharedAxisTransition` ao alternar entre a visualização de detalhes (`book_details`) e o modo de edição (`edit_details`), proporcionando uma transição de eixo z/escala extremamente elegante.
* **Custom Route Transitions:** Criação de um componente de transição personalizado (`sliderRouteTransition`) que utiliza `Tween` e `CurveTween` para controlar a velocidade e o comportamento físico das telas ao entrar em cena.

### 🛠️ Arquitetura e Tecnologia
* **Persistência Local:** Uso do `sqflite` para armazenamento robusto dos dados do usuário, garantindo que o seu grimório esteja sempre disponível, mesmo offline.
* **Integração com API:** Busca dinâmica de livros através da API do Google Books via `http`.
* **Organização de Código:** Divisão clara de responsabilidades entre `Controllers`, `DAO` (Data Access Object), `Models`, `Services` e `Screens`.
* **Pronto para o Futuro:** O app já conta com interfaces de Login e Cadastro, preparadas para receber uma implementação de autenticação externa.

---

## 🛠️ Tecnologias Utilizadas

* **Flutter & Dart** (SDK >= 3.0.5)
* **sqflite:** Banco de dados local.
* **carousel_slider:** Sliders interativos e responsivos.
* **lottie:** Animações baseadas em vetores.
* **animations:** Transições de rotas e componentes padrão Material Design.
* **flutter_native_splash:** Customização da inicialização do app.
* **flutter_svg:** Renderização de ícones e backgrounds vetoriais.

---

## 📂 Estrutura de Arquivos

```
assets/
├── animations/         # book_lottie.json
├── carousel/           # Imagens do carrossel
├── fonts/              # BigelowRules-Regular.ttf
└── images/             # Imagens do app
lib/
├── controller          # book_controller.dart
├── dao                 # book_database.dart
├── models              # google_book.dart e personal_book.dart
├── screens/             # User Interface da aplicação
│   ├── components/         # Widgets modulares e reutilizáveis
│         ├── carousel_item.dart
│         ├── date_input.dart        
│         ├── display_text.dart          
│         ├── entry.dart     
│         ├── floating_button.dart        
│         ├── primary_button.dart         
│         └── secondary_button.dart   
│   ├── home.dart          # tela inical 
│   ├── book_details.dart  # detalhes dos livros    
│   ├── dashboard.dart     # onboarding do app com o carrossel 
│   ├── edit_details.dart  # tela de edição de detalhes
│   ├── login.dart         # tela de login
│   ├── new_entry.dart     # cadastro de livros
│   ├── search_books.dart  # procura por livros
│   ├── sign_up.dart       # cadastro de usuario, senha e email    
│   └── splash.dart        # splash de continuação da animação de entrada 
├── services/              
│   └── google_book_service.dart # API do google
├── theme.dart                   # Estilização global
├── route_transitions.dart       # Componente de transição personalizado
└── main.dart                    # Entrada do app e configuração de tema
```

## 🚀 Como Executar o Projeto

1.  Certifique-se de ter o ambiente Flutter configurado.
2.  Clone este repositório.
3.  No terminal, execute:
    ```bash
    flutter pub get
    ```
4.  Gere os arquivos da Splash Nativa (opcional, caso queira reconfigurar):
    ```bash
    dart run flutter_native_splash:create
    ```
5.  Inicie o aplicativo:
    ```bash
    flutter run
    ```

---

> "Um livro é um feitiço que você carrega consigo. O Meu Grimório ajuda você a organizar sua magia." 🪄

Deselvolvido com foco em qualidade de código e fluidez visual.
