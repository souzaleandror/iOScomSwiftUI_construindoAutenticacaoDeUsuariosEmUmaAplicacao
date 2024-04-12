#### 10/04/2024

Curso de iOS com SwiftUI: construindo autenticação de usuários em uma aplicação

```
npm i
npm start
"start": "node -r ts-node/register ./src/server.ts",
```

@01-TextField e Picker

@@01
Apresentação

Olá! Me chamo Giovanna Moeller e sou instrutora aqui na Alura.
Audiodescrição: Giovanna Moeller é uma mulher branca, de cabelos loiros, lisos e longos. Veste uma camiseta azul com o logotipo "Alura".
Boas-vindas a mais um curso de SwiftUI, este focado em autenticação de pessoas usuárias.

Se você realizou os outros cursos desta formação, é provável que você já esteja familiarizado com o Voll Med.

O Voll Med é um aplicativo que oferece a capacidade aos pacientes de agendar, reagendar e cancelar consultas médicas de forma conveniente.
Dentro deste aplicativo, encontramos quatro operações fundamentais, a saber: a criação, a atualização, a leitura e a exclusão de dados. Todas essas ações estão interligadas com um serviço externo.

Ao longo deste curso, abordaremos a autenticação de pessoas usuárias, possibilitando que elas se registrem e façam login na nossa aplicação. Assim, vamos analisar esse projeto em ação.

Relembrando o projeto
Emulador iPhone 14 exibindo a tela de login do aplicativo "Voll Med" com um fundo branco. No topo central, encontramos o logotipo "Voll Med". Abaixo, uma mensagem que contém o seguinte texto: "Olá! Preencha para acessar sua conta". Logo abaixo desse texto, temos dois campos para preencher "E-mail" e "Senha". Abaixo, há um botão azul escrito "Entrar". Na sequência, há um texto clicável escrito "Ainda não possui uma conta? Cadastre-se".

A aplicação apresenta uma tela de login com campos para inserção do e-mail e senha. No entanto, caso a pessoa usuária ainda não tenha uma conta, há também a possibilidade de realizar o cadastro na aplicação.

Nessa tela de cadastro, são fornecidos campos de entrada para o nome, e-mail, CPF, número de telefone e senha. Além disso, há a opção de selecionar o plano de saúde desejado.

Caso a pessoa usuária já tenha uma conta, podemos proceder ao início de sessão para demonstrar o funcionamento. Nesse sentido, irei utilizar uma conta à qual tenho acesso, com o endereço de e-mail "lucas@gmail.com" e a respetiva senha correspondente.

Assim, a pessoa usuária ficará autenticada na aplicação e estará apto a realizar diversas operações, tais como agendar uma consulta, remarcar compromissos e até mesmo cancelá-los. Adicionalmente, essa pessoa pode efetuar o logout da aplicação, o que a levará de volta à tela de início de sessão.

Pré-requisitos
Para aproveitar este curso, é necessário ter conhecimento prévio na criação de layouts com o uso do SwiftUI, bem como dominar seus principais elementos. Além disso, é importante possuir experiência em fazer solicitações a serviços externos, ou seja, estar familiarizado com requisições HTTP.

Aguardamos sua participação na primeira aula!

@@02
Preparando o ambiente: download do projeto inicial

Nosso projeto continuará sendo o Vollmed e iremos partir do ponto em que o curso iOS com SwiftUI: construindo aplicações interativas com CRUD e APIs REST parou. Por isso, é importante que você já tenha o projeto em sua máquina.
Baixe o projeto inicial ou acesse o repositório no GitHub e pegue o projeto da branch main.

Xcode 15
Certifique-se de que tem a IDE XCode instalado na sua máquina. Caso ainda não tenha, pode baixá-lo diretamente da AppStore ou no site oficial da Apple para desenvolvedores.

Lembrando que o Xcode só está disponível para sistema operacional MacOS!
Neste curso, estaremos utilizando o Xcode na versão 15. No momento de gravação deste curso, a versão 15 ainda estava em beta, ou seja, não estava disponível para todo mundo ainda.

Entretanto, quando você estiver assistindo este curso, muito provavelmente a versão 15 já estará disponível para todos os usuários e você poderá fazer o download tranquilamente.

https://github.com/alura-cursos/swiftui-vollmed-crud

https://cursos.alura.com.br/course/ios-swiftui-aplicacoes-interativas-crud-apis-rest

https://github.com/alura-cursos/swiftui-vollmed-crud/archive/refs/heads/main.zip

https://github.com/alura-cursos/swiftui-vollmed-crud

https://apps.apple.com/br/app/xcode/id497799835

https://developer.apple.com/xcode/

@@03
Preparando o ambiente: download e execução da API

Para este curso, você irá precisar executar uma API diferente da que estava executando no curso anterior, pois houveram algumas modificações para atender este curso em específico.
1. Baixe o repositório da API
Antes de tudo, precisamos ter o código da API em sua máquina. Faça o download do projeto da API ou acesse o link do repositório no Github. Para este curso, utilizaremos a branch chamada authentication.

2. Instale do NodeJS:
Se você ainda não possui o NodeJS instalado, é a hora de baixá-lo. Acesse o site oficial do NodeJS, faça o download da versão recomendada e siga os passos da instalação.

Você precisa ter o NodeJS instalado na sua máquina, pois a API é feita com NodeJS, um ambiente de execução JavaScript do lado do servidor, permitindo o desenvolvimento de aplicações web escaláveis e assíncronas.
Não se preocupe se você não souber Javascript ou NodeJS! O objetivo aqui é apenas executar a nossa API, de onde vamos consumir os dados, salvar agendamentos de consulta, etc.

3. Execute a API:
Abra o terminal;
Navegue até o diretório onde baixou o projeto da API utilizando o comando cd <caminho-para-o-projeto>;
Execute npm install para instalar todas as dependências do projeto;
Se der algum erro na instalação por conta de permissão, execute o sudo npm install para instalar como administrador;
Por fim, digite npm start para iniciar a API.
Pronto! Agora, a API estará rodando localmente em sua máquina e estará pronta para receber as requisições de nosso projeto em SwiftUI.

https://github.com/alura-cursos/vollmed-api-swiftui/archive/refs/heads/authentication.zip

https://github.com/alura-cursos/vollmed-api-swiftui/tree/authentication

https://nodejs.org/

@@04
Criando a tela de login com TextField

Começaremos construindo a tela de login, que permitirá à pessoa usuária inserir seu e-mail e senha para acessar a aplicação.
Construindo a tela de login
Emulador iPhone 14 exibindo a tela de login do aplicativo "Voll Med" com um fundo branco. No topo central, encontramos o logotipo "Voll Med". Abaixo, uma mensagem que contém o seguinte texto: "Olá! Preencha para acessar sua conta". Logo abaixo desse texto, temos dois campos para preencher "E-mail" e "Senha". Abaixo, há um botão azul escrito "Entrar". Na sequência, há um texto clicável escrito "Ainda não possui uma conta? Cadastre-se".

A tela de login é composta por uma imagem, um texto de saudação "Olá", uma orientação "Preencha para acessar sua conta", campos para inserção de e-mail e senha, além de botões de ação.

Existe também o link "Ainda não possui uma conta? Cadastre-se!" que, ao ser clicado, direciona a pessoa usuária para a tela de cadastro. Na tela de cadastro, temos o inverso: o link "Já possui uma conta? Faça o login." que retorna à tela de login.

Vamos começar!

No Xcode, do lado esquerdo selecionamos com o botão direito na pasta Views e selecionamos "New File" para criar uma nova view.

Será exibida uma janela intitulada "Choose a template for your new file", onde selecionamos a opção "SwiftUI View" e depois clicamos no botão "Next" no canto inferior direito.

Na janela seguinte, temos os campos "Save As", "tags", "where", "group" e "Targets". Abaixo, dois botões "Cancel" e "Create". Em "Save As" digitamos "SigninView".

Seremos redirecionados para o arquivo SigninView com um código padrão:

Arquivo SigninView no repositório do GitHub
import SwiftUI

struct SignInView: View {
var body: some View {
Text("Hello, World!")
}
}
#Preview { 
SignInView()
}
COPIAR CÓDIGO
Estilizando a view
Para estilizar essa view, inicialmente removemos o Text("Hello, World!") e criamos uma VStack.

Na VStack, utilizamos alguns parâmetros, como Alignment no modo Leading para alinhar os elementos à esquerda, e um espaçamento Spacing de 16 entre os elementos.

SigninView
import SwiftUI

struct SignInView: View {
var body: some View {
VStack(alignment: .leading, spacing: 16.0) {

}
}
}
#Preview { 
SignInView()
}
COPIAR CÓDIGO
O elemento inicial na VStack é uma imagem que importamos do nosso arquivo Asset, utilizando a referência .logo para identificar o arquivo.

Agora, iremos adicionar alguns modificadores de propriedade.

Adicionamos o .resizable() e .scaledToFit() para ajustar o tamanho da imagem.

Do lado direito no emulador, no aplicativo, a logo da Voll Med está centralizada na tela, em um fundo branco.
Também aplicamos o modificador Frame para gerenciar a altura e largura, definindo um valor de maxWidth: .infinity para preencher a largura total do dispositivo, um maxHeight de 36 e um alinhamento alignment: .center para centralizar a imagem.

SigninView
import SwiftUI

struct SignInView: View {
var body: some View {
VStack(alignment: .leading, spacing: 16.0) {
Image(.logo)
.resizable()
.scaledToFit()
.frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
}
}
}

#Preview { 
SignInView()
}
COPIAR CÓDIGO
Observem que a logomarca da Voll Med está agora em um tamanho apropriado e centralizada na tela do aplicativo no emulador à direita.

Posteriormente, incluímos os textos com o Text() passando a string "Olá". Logo após, adicionamos alguns modificadores como .font(title2). Além disso, aplicamos a formatação em negrito com o uso do parâmetro bold, e definimos as cores, usando a cor accent.

Para a mensagem de orientação, aplicamos a mesma lógica. No entanto, a fonte será .title3 (para torná-la menor), a cor será .gray, e adicionamos um .padding(.bottom) para criar um espaço abaixo do texto, proporcionando um espaçamento com o próximo elemento.

SigninView
import SwiftUI

struct SignInView: View {
var body: some View {
VStack(alignment: .leading, spacing: 16.0) {
Image(.logo)
.resizable()
.scaledToFit()
.frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)

Text("Olá!")
.font(.title2)
.bold()
.foregroundStyle(.accent)

Text("Preencha para acessar sua conta.")
.font(.title3)
.foregroundStyle(.gray)
.padding(.bottom)
}
}
}

#Preview { 
SignInView()
}
COPIAR CÓDIGO
Agora, a fim de que a pessoa usuária possa inserir seu e-mail e senha, iremos incluir mais campos de texto, Text(). Logo após, adicionamos os modificadores, como .font() passando title3, depois inserimos um .bold() para colocar em negrito. Por fim, adicionamos o foregroundStyle() passando .accent.

SigninView
// código omitido

Text("Email")
.font(.title3)
.bold()
.foregroundStyle(.accent)

}
}
}

#Preview { 
SignInView()
}
COPIAR CÓDIGO
Na tela de cancelamento, fazemos uso do componente TextEditor, que permite que as pessoas usuárias redijam maiores quantidades de texto em várias linhas. No entanto, nesta situação, empregaremos o componente TextField.

Entendendo e aplicando o TextField
O TextField, por padrão, aceita apenas uma linha, o que o torna apropriado para campos com quantidades menores de texto, como nome, e-mail, senha e telefone.

Digitamos TextField() e, em seguida, são exibidas várias opções em um menu suspenso, nas quais selecionamos a opção "TextField(titleKey:text)".

O titleKey será o placeholder, sendo o texto que será exibido enquanto a pessoa usuária ainda não digitou nada: "Insira seu email". No text precisamos passar um binding do tipo string, sendo uma variável de estado para controlar o que a pessoa usuária está digitando.

Para criar a variável de estado, após carregar o arquivo e dentro da estrutura SignInView, inserimos: @State private var password: String = "", sendo as aspas duplas vazias representativas de uma string vazia, pois inicialmente a variável é uma string vazia.

Embora não seja necessário especificar o tipo de dado (pois o Swift permite isso), optamos por manter a padronização nessa View.

Aproveitando, vamos criar outra variável de estado para a nossa senha. Será @State private var password, a qual é do tipo string (sequência de caracteres) e também iniciará vazia.

SigninView
// código omitido

 @State private var email: String = ""
 @State private var password: String = ""

// código omitido
COPIAR CÓDIGO
Descendo o arquivo, na hora de passar o binding na linha 37, onde estamos definindo o TextField, vamos usar o $email.

SigninView
// código omitido

Text("Email")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu email", text: $email)

// código omitido
COPIAR CÓDIGO
Ao executar o simulador, à nossa direita, notamos que foi adicionada a instrução "Insira seu email". Vamos agora adicionar alguns modificadores de propriedade para este TextField.

Primeiramente, adicionamos um padding() (espaçamento) e atribuímos o valor de 14. Também definimos uma cor de fundo através de background(), com color.gray.opacity(0.25). Além disso, configuramos um cornerRadius() (raio de canto) de 14 para dar um aspecto de cantos arredondados.

O TextFields tem alguns modificadores relacionados ao teclado e ao texto. Por exemplo, podemos desabilitar a função de correção automática do texto quando estiver errado, o que, no caso do email, não é muito apropriado. Portanto, utilizamos .autocorrectionDisabled para desativar a autocorreção.

Outro modificador que podemos usar é o keyboardType (tipo de teclado), que definirá o tipo de teclado. Se quisermos um teclado que só contenha números, utilizaremos a opção numberpad no menu de opções exibido.

Mas, neste caso, optamos pela opção email address, pois o símbolo "@" fica mais acessível neste teclado. Abordaremos isso com mais detalhes posteriormente.

Nós também podemos adicionar um modificador chamado textInputAutocapitalization() (autocapitalização da entrada de texto). Definimos este modificador como .never (nunca), o que significa que o teclado nunca colocará automaticamente a primeira letra em maiúscula.

Afinal, em alguns casos, quando estamos digitando algo, a primeira letra é mantida em maiúscula automaticamente. No caso do e-mail, isso não ocorre.

SigninView
// código omitido

Text("Email")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu email", text: $email)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)
.autocorrectionDisabled()
.keyboardType(.emailAddress)
.textInputAutocapitalization(.never)

// código omitido
COPIAR CÓDIGO
Vamos, então, para a senha. Adicionamos outro text() com a string "senha". Aplicamos os mesmos modificadores do texto de email, copiamos da linha 33 até a 35 e colamos no nosso texto de senha.

Para a senha, não podemos utilizar o TextField, pois as nossas senhas ficariam visíveis. Queremos que os caracteres fiquem ocultos, como é comum quando estamos digitando nossa senha. Por isso, utilizamos o SecureField, que funciona da mesma maneira, porém oculta os caracteres.

Então, escolhemos o SecureField, definindo o texto predefinido como "Insira a nossa senha". No texto, passamos a nossa variável de estado $password.

Adicionamos também os mesmos modificadores presentes no TextField: padding de 14, background com Color.gray.opacity(0.25) e um cornerRadius de 14.

SigninView
// código omitido

Text("Email")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu email", text: $email)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)
.autocorrectionDisabled()
.keyboardType(.emailAddress)
.textInputAutocapitalization(.never)

Text("Senha")
.font(.title3)
.bold()
.foregroundStyle(.accent)

SecureField("Insira sua senha", text: $password)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)

// código omitido
COPIAR CÓDIGO
Com os modificadores necessários concluídos, vamos ao simulador, à direita, e testamos a digitação da senha.

Se executarmos a aplicação e ela não abrir na tela de login, será necessário adicionar um padding na nossa viewStack para que fique adequada.

SigninView
// código omitido

SecureField("Insira sua senha", text: $password)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)

}
.padding()

// código omitido
COPIAR CÓDIGO
Para executarmos essa aplicação, iremos ao arquivo VollmedApp do lado esquerdo e, em vez de ContentView, receberemos SigningView.

Arquivo VollmedApp no repositório do GitHub
import SwiftUI

@main
struct VollmedApp: App {
var body: some Scene {
WindowGroup {
SignInView()

}
}
}
COPIAR CÓDIGO
Agora, executamos a aplicação pressionando "R" para abrir o simulador.

Agora, para ativarmos o teclado, vamos ao canto superior, na opção "I/O", em seguida, selecionamos "keyboard" e finalmente marcamos a opção "Toggle Software Keyboard". Agora, temos o teclado visível e, lembram-se do arroba mencionado anteriormente? Nosso acesso a ele fica muito mais fácil neste tipo de teclado.

Ao começarmos a inserir uma senha, as bolas pretas serão representadas pelo SecureField.

Conclusão
Agora que nós já conhecemos o componente TextField e o SecureField, continuaremos a construção dessa tela e também da tela de cadastro.

Espero você no próximo vídeo!

@@05
Finalizando a tela de login

Agora vamos finalizar a nossa tela de login. Quero tranquilizar vocês quanto aos alertas que o Xcode está apresentando. Não sei exatamente porque isso está acontecendo e, às vezes, pode ser um bug do próprio Xcode. Portanto, não se preocupem com isso.
Finalizando a tela de login
Retornando para o SigningView, vamos completar o que falta, que é o botão "Entrar" e o texto "Ainda não possui uma conta? Cadastre-se.".

Logo após o SecureField, começaremos a definir um botão. Selecionaremos a opção "Action" e "Label". Na Action, incluiremos um comentário vazio, pois ainda não chamaremos nenhuma função. Faremos isso mais tarde.

No Label, chamaremos a nossa ButtonView(), que é o componente do botão. Escolheremos a opção com um texto e passaremos uma string como "Entrar".

SigningView
// código omitido

Button(action: {}, label: {
        ButtonView(text: "Entrar")
})

// código omitido
COPIAR CÓDIGO
Agora, criaremos um NavigationLink, pois, no texto "Ainda não possui uma conta? Cadastre-se.", às pessoas usuárias serão redirecionadas para a tela de cadastro. Indo para o Navigation Link, selecionaremos a opção NavigationLink(destination, label).

Como é uma View de destino, precisamos criar a tela de cadastro a seguir. Na pasta Views, no canto esquerdo, clicaremos com o botão direito e escolheremos "New File > Swift UI View" e selecionamos "Next. Nomearemos essa View como SignUpView.

Seremos redirecionados para o arquivo com um código padrão.

Na nossa SignUpView, começaremos a estilizá-la. Vamos remover o Text() e iniciaremos a inserção de ScrollView. Optamos por utilizar o ScrollView devido à quantidade considerável de campos de texto, permitindo que as pessoas usuárias possam rolar a tela.

Para o ScrollView, configuramos o parâmetro ShowsIndicators com o valor false, de modo a não exibir a barra de rolagem.

SignUpView.swift
import SwiftUI

struct SignUpView: View {
var body: some View {
ScrollView(showsIndicators: false) {
}
}
}
#Preview {
SignUpView()
}
COPIAR CÓDIGO
Isso acarretará erro, pois na SignInView, não estamos fazendo nada nas linhas 62 ou 64 ainda. Assim, na linha 62, a View de destino é a SignUpView().

Vamos retornar à tela de cadastro em um momento. Vamos substituir o Label por um Text e, em seguida, inseriremos a string "Ainda não possui uma conta, cadastre-se." Aplicaremos alguns modificadores, como o estilo bold.

Adicionamos um .frame(maxWidth: .infinity,) para ocupar toda a largura do dispositivo e um alignment: .center para garantir que fique centralizado.

SigningView
// código omitido

NavigationLink {
SignUpView()
} label: {
Text("Ainda não possui uma conta? Cadastre-se.")
.bold()
.frame(maxWidth: .infinity, alignment: .center)
}
}

// código omitido
COPIAR CÓDIGO
Testaremos isso pressionando "Command + R" para abrir o simulador e tentaremos clicar em "Ainda não possui uma conta? Cadastre-se.". Não está navegando para a nossa tela de cadastro. Isso acontece porque ainda não adicionamos nenhum NavigationStack para fazer isso.

Aplicando o NavigationStack
Portanto, vamos no nosso VollmedApp encapsular a nossa View, SigningView, em um NavigationStack. Isso é provisório, porque posteriormente faremos modificações na nossa ContentView, a TabView que criamos antes.

VollMedApp
import SwiftUI

@main
struct VollmedApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SignInView()
            }
        }
    }
}
COPIAR CÓDIGO
Após a inclusão do NavigationStack, pressionamos "Command + R" mais uma vez para executar. Nesse ponto, a cor da interface foi alterada para azul. Ao clicar em "Ainda não possui uma conta", a tela de cadastro será exibida.

Queremos eliminar o botão "Voltar" ("back") no canto superior esquerdo da tela de cadastro, já que não desejamos tê-lo presente. Queremos que, quando a pessoa usuária clique novamente em "Já possui uma conta", ela faça login.

Para alcançar esse objetivo, basta acessar a SignUpView, após o ScrollView, e ativar o modificador .navigationBarBackButtonHidder().

SignUpView.swift
import SwiftUI

struct SignUpView: View {
var body: some View {
ScrollView(showsIndicators: false) {
}
.navigationBarBackButtonHidder()
}
}
#Preview {
SignUpView()
}
COPIAR CÓDIGO
Vamos realizar o teste, pressionamos "Command + R". Ao clicarmos em "Ainda não possui uma conta? Cadastre-se", observamos que o botão "Voltar" não está mais presente no canto superior esquerdo na tela de cadastro.

Estilizando a SignUpView
Vamos começar a estilizar a SignUpView. Começaremos adicionando a imagem. Para isso, digitamos image(.logo).

A implementação será semelhante à que fizemos na tela de login. Portanto, começamos com image(.logo) e adicionamos .resizable(). Em seguida, incluímos .scaledToFit(), seguido por .frame() , definindo MaxWidth como infinito e MaxHeight como 36 e alignment: .center. Adicionaremos também um .padding() na direção vertical, utilizando vertical.

SignUpView.swift
import SwiftUI

struct SignUpView: View {
var body: some View {
ScrollView(showsIndicators: false) {
Image(.logo)
.resizable()
.scaledToFit()
.frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
.padding(.vertical)
}
.navigationBarBackButtonHidder()
}
}
#Preview {
SignUpView()
}
COPIAR CÓDIGO
Em seguida, incluiremos um texto com o seguinte comando: Text("Olá, boas-vindas!"). Agora, vamos adicionar alguns modificadores, como .font(.title2), .bold() e .foregroundStyle(.accent).

SignUpView.swift
import SwiftUI

struct SignUpView: View {
var body: some View {
ScrollView(showsIndicators: false) {
Image(.logo)
.resizable()
.scaledToFit()
.frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
.padding(.vertical)

Text("Olá, boas-vindas!")
.font(.title2)
.bold()
.foregroundStyle(.accent)
}
.navigationBarBackButtonHidder()
}
}
#Preview {
SignUpView()
}
COPIAR CÓDIGO
Agora, vamos adicionar o VStack. Após a ScrollView, adicionaremos o VStack(), começando com parênteses, seguido por alignment: .leading e spacing: 16.0. Abriremos chaves, copiamos o Image(.logo) e esse Text(), aplicamos o comando "Command + X" e em seguida "Command + V" dentro do nosso VStack.

Agora sim. Dentro da ScrollView, logo após o modificador navigationBarBackButtonHidder, adicionaremos também um Padding.

SignUpView.swift
import SwiftUI

struct SignUpView: View {
var body: some View {
ScrollView(showsIndicators: false) {
VStack(alignment: .leading, spacing: 16.0) {
Image(.logo)
.resizable()
.scaledToFit()
.frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
.padding(.vertical)

Text("Olá, boas-vindas!")
.font(.title2)
.bold()
.foregroundStyle(.accent)
}
}
.navigationBarBackButtonHidder()
.padding()
}
}
#Preview {
SignUpView()
}
COPIAR CÓDIGO
Seguindo com a construção do código, inserimos mais um texto aqui, "Preencha para acessar sua conta.", juntamente com alguns modificadores: .font(.title3), .foregroundStyle(.gray) para uma cor cinza e também um .padding(.bottom).

Em seguida, adicionaremos um .padding(.bottom) também na parte inferior desse texto para que eles fiquem distantes do próximo elemento.

SignUpView.swift
// código omitido

Text("Olá, boas-vindas!")
.font(.title2)
.bold()
.foregroundStyle(.accent)

Text("Preencha para acessar sua conta.")
.font(.title3)
.foregroundStyle(.gray)
.padding(.bottom)
}
}
.navigationBarBackButtonHidder()
.padding()
}
}

// código omitido
COPIAR CÓDIGO
Assim, temos nossa base criada. Vamos testar novamente no simulador, com o comando "Command + R".

No emulador, atualmente encontramos o logotipo da VollMed no centro superior. Abaixo, há o texto "Olá" seguido de "Preencha para acessar sua conta." Logo após, são visíveis os campos "Email" e "Senha", seguidos de um botão denominado "Entrar". Abaixo deste botão, encontramos um texto clicável com a mensagem "Ainda não possui uma conta? Cadastre-se".

Se clicarmos no texto "ainda não possuímos uma conta", ele nos levará para a tela de cadastro.

Conclusão e próximos passos
Agora, precisamos adicionar todos os campos de texto nessa tela de cadastro. Esperamos por você no próximo vídeo para concluir isso!

@@06
Utilizando o TextField

Dada a tela de login do app Vollmed, observe o trecho de código relacionado ao campo de e-mail:
TextField("Insira seu email", text: $email)
    .padding(14)
    .background(Color.gray.opacity(0.25))
    .cornerRadius(14.0)
    .autocorrectionDisabled()
    .keyboardType(.emailAddress)
    .textInputAutocapitalization(.never)
COPIAR CÓDIGO
Com base nas propriedades e modificadores atribuídos ao TextField, qual das seguintes afirmações são verdadeiras?

A autocorreção estará ativa quando o usuário digitar, dadas as configurações deste TextField.
 
Alternativa correta
O TextField tem um fundo cinza com 25% de opacidade.
 
Sim! Isto é definido pelo modificador .background(Color.gray.opacity(0.25)).
Alternativa correta
As primeiras letras de cada palavra digitada neste TextField serão automaticamente capitalizadas.
 
Alternativa correta
Por causa da configuração deste TextField, o teclado apresentado é otimizado para endereços de e-mail.
 
Exatamente! Isto é definido pelo modificador .keyboardType(.emailAddress).

@@07
Para saber mais: aprofundando o TextField

Em nosso aplicativo VollMed, incluímos um campo onde o usuário pode digitar suas informações de cadastro (como nome e e-mail). Se pensarmos bem, essa funcionalidade está presente em muitos aplicativos do nosso dia a dia: WhatsApp (para digitar mensagens), listas de tarefas (para escrever as tarefas), telas de login, cadastro, etc.
Assim, o TextField é um componente crucial no framework SwiftUI, pois permite aos usuários inserir e editar texto de forma interativa. Ele é representado visualmente como uma caixa de entrada de texto, na qual os usuários podem tocar, clicar ou usar o teclado para digitar informações.

Para que serve o TextField?
O TextField tem uma variedade de aplicações em aplicativos SwiftUI, e sua utilidade pode ser encontrada em diversos cenários:

Coleta de dados do usuário: O TextField é amplamente utilizado para coletar informações do usuário, como nomes, endereços de e-mail, senhas e comentários. Ele permite que os usuários insiram texto livremente e interajam com o aplicativo.
Formulários e configurações: É comum usar TextFields para criar formulários interativos em aplicativos iOS. Os usuários podem preencher campos obrigatórios, como informações de contato, dados pessoais e preferências de configuração.
Principais propriedades do TextField
As principais propriedades do TextField são:

Placeholder: É o texto mostrado no TextField quando ele está vazio. É geralmente usado para indicar ao usuário o tipo de entrada esperada.
Text: Uma binding para o texto que o usuário insere.
OnEditingChanged: Um closure chamado quando o usuário começa ou termina a edição.
OnCommit: Um closure chamado quando o usuário pressiona a tecla "Return" ou "Done" no teclado.
KeyboardType: Define o estilo do teclado que aparece para o usuário. Pode ser .default, .numberPad, .decimalPad, .emailAddress e muitos outros.
SecureField: É uma variação do TextField que oculta a entrada do usuário, geralmente usado para campos de senha.
Font, ForegroundColor, BackgroundColor e outros: Estes modificadores controlam a aparência visual do TextField.
Autocapitalization e Autocorrection: Estes controlam se o texto inserido é automaticamente corrigido ou capitalizado.
DisableAutocorrection: Desativa a autocorreção.
Lembrando que, além destas propriedades e modificações específicas do TextField, você pode aplicar qualquer modificador SwiftUI para alterar sua aparência ou comportamento.

Concluindo
O TextField é um componente versátil e uma ferramenta crucial para criar aplicativos interativos em SwiftUI. Por isso, é essencial aprender a personalizá-lo e adaptá-lo para diferentes cenários e necessidades de design.

@@08
Construindo a tela de cadastro

Vamos iniciar a criação dos campos de texto para a tela de cadastro. Esses campos serão baseados na rota "Cadastro paciente" do Insomnia, localizada na pasta "Pacientes".
Rota:

POST: localhost:3000/paciente
COPIAR CÓDIGO
Abaixo da rota, temos:

{
"cpf": "65147182055",
"nome": "Lucas",
"email": "lucas@email.com",
"senha": "12345",
"telefone": 99999999,
"planoSaude": "Unimed"
}
COPIAR CÓDIGO
Esta rota requer a inclusão de um CPF, nome, e-mail, senha, telefone e plano de saúde.

Finalizando a tela de cadastro
Agora, ao voltarmos para o Xcode no arquivo SignUpView, para começarmos a desenvolver esses campos.

Depois do texto "Insira seus dados para criar uma conta", vamos inserir um novo texto. O primeiro campo a ser criado será o nome. Este campo será definido com os mesmos atributos presentes na tela de login, isto é, os mesmos modificadores: .font(.title3), .bold(), .foregroundStyle(.accent).

SignUpView
// código omitido

Text("Nome")
.font(.title3)
.bold()
.foregroundStyle(.accent)

// código omitido
COPIAR CÓDIGO
Em seguida, vamos definir nosso TextField. Mas, antes, precisamos criar a nossa variável de estado para associá-la a este TextField. Assim sendo, após o SignupView, vamos criar algumas linhas e começar definindo @State private var name do tipo String, inicializada com uma String vazia.

Vamos também criar todas as variáveis de estado necessárias.

A variável cpf será uma String, pois armazenamos CPF como uma String. A variável healthyPlan, que representa o plano de saúde, será selecionada de uma forma um pouco diferente posteriormente, apresentando então um novo componente.

Assim teremos:

SignUpView
// código omitido

@State private var name: String = ""
@State private var email: String = ""
@State private var cpf: String = ""
@State private var phoneNumber: String = ""
@State private var healthPlan: String
@State private var password: String = ""

// código omitido
COPIAR CÓDIGO
Agora, voltando ao nosso TextField, vamos selecionar a opção TitleKey:Text. O Placeholder será "Insira seu nome completo" e o Text será a variável name. Vamos adicionar agora alguns modificadores.

Esses modificadores serão praticamente os mesmos para os outros TextFields, inclusive para a tela de login. Ninguém deseja que o teclado corrija seu próprio nome, então a autoCorrection será desabilitada, autocorrectionDisabled().

Assim, teremos:

SignUpView
// código omitido

Text("Nome")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu nome completo", text: $name)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)
.autocorrectionDisabled()

// código omitido
COPIAR CÓDIGO
Agora, copiamos o código a partir da linha 38 até a linha 47, que contém o Text e o TextField, e iremos colar na sequência. Para o campo email, vamos substituir "nome" por "email" e alterar o Placeholder para "Insira seu e-mail". Agora, a variável será email em vez de name.

Para este campo, vamos adicionar um novo modificador, o keyboardType, que será .emailAddress, e textInputAutocapitalization(), que será .never. Não adicionamos esses modificadores no campo nome, pois queremos que o nome comece com letra maiúscula.

SignUpView
// código omitido

Text("Email")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu email", text: $email)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)
.autocorrectionDisabled()
.keyboardType(.emailAddress)
.textInputAutocapitalization(.never)

// código omitido
COPIAR CÓDIGO
Em seguida, colamos novamente a estrutura e criamos o campo CPF. Para o CPF, vamos substituir a palavra "nome" por "CPF" e o Placeholder se torna "Insira seu CPF". Na sequência, podemos remover o autocorrectionDisabled() e inserimos o keyboardType que iremos setar numberPad para permitir apenas números. Nesse caso, a variável será cpf.

SignUpView
// código omitido

Text("CPF")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu CPF", text: $cpf)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)
.keyboardType(.numberPad)

// código omitido
COPIAR CÓDIGO
O Preview do lado direito está exibindo as alterações. Temos os campos nome, e-mail e cpf após o texto de boas-vindas.

Agora, vamos tratar o número de telefone. Utilizamos o trecho de código copiado mais uma vez. Na linha 73, alteramos nome para telefone. Em seguida, na linha 78, no TextField, inserimos "Insira seu telefone".

Não precisamos adicionar um aviso para inserir apenas números, pois o teclado já será configurado apenas para números, então não há problema. Como variável Text, vamos alterar para PhoneNumber. Removemos o autocorrectionDisabled e adicionamos .keyboardType(.numberPad).

SignUpView
// código omitido

Text("Telefone")
.font(.title3)
.bold()
.foregroundStyle(.accent)

TextField("Insira seu telefone", text: $phoneNumber)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)
.keyboardType(.numberPad)

// código omitido
COPIAR CÓDIGO
Agora, trataremos de mais um campo, que será a senha. Novamente, usamos o trecho de código copiado.

Na linha 84, em vez de nome, colocamos senha. Em vez de TextField, na linha 89, trocamos para SecureField e definimos a frase "Insira sua senha". Como variável Text, trocaremos Name por password. Por fim, removemos a propriedade autocorrection Disabled.

SignUpView
// código omitido

Text("Senha")
.font(.title3)
.bold()
.foregroundStyle(.accent)

SecureField("Insira sua senha", text: $password)
.padding(14)
.background(Color.gray.opacity(0.25))
.cornerRadius(14.0)

// código omitido
COPIAR CÓDIGO
Finalizamos a inserção de todos os campos. O campo para selecionar o plano de saúde será apresentado no próximo vídeo, pois quero introduzir um novo componente.

Adicionando o botão
Vamos adicionar um botão agora. Para isso, precisamos de um Button(action: {}, label:). Para a ação, vamos incluir um comentário, já que ainda não vamos definir uma função, mas faremos isso posteriormente. Como Label, passamos Button View e o Text será "Cadastrar".

SignUpView
// código omitido

Button(action: {
//
}, label: {
ButtonView(text: "Cadastrar")
})

// código omitido
COPIAR CÓDIGO
Já temos o botão de cadastro.

Precisamos adicionar o NavigationLink com aquele texto. Vamos começar escrevendo NavigationLink e optamos pelo Destination. Agora, a View de destino é a SigningView e a label colocamos um "Text("Já possui uma conta? Faça o login!)". Também vamos adicionar alguns modificadores de propriedade, como bold, .foregroundStyle(.accent) e, por fim, .frame(maxWidth: .infinity, alignment: .center).

SignUpView
// código omitido

Button(action: {
//
}, label: {
ButtonView(text: "Cadastrar")
})

NavigationLink {
SignInView()
} label: {
Text("Já possui uma conta? Faça o login!")
.bold()
.foregroundStyle(.accent)
.frame(maxWidth: .infinity, alignment: .center)
}

// código omitido
COPIAR CÓDIGO
Agora temos a tela de cadastro praticamente pronta e vamos testar, utilizando o "Command + R" para executar o simulador. No emulador, clicamos em "Ainda não possui uma conta? Cadastre-se" na parte inferior da página inicial.

Então, temos todos os campos funcionando. Se clicarmos novamente em "Já possui uma conta? Faça o login!", ele retornará para a tela de login.

No entanto, desejamos remover o botão de retorno localizado na parte superior esquerda. Para alcançar esse objetivo, retornamos à SigningView, que corresponde à tela de login, e, na linha 70, após o padding, adicionamos a funcionalidade de ocultar o botão de retorno da barra de navegação.

SignInView
// código omitido

}
.padding()
.navigationBarBackButtonHidden()
}

// código omitido
COPIAR CÓDIGO
Vamos agora testar novamente. Ao clicar em "Ainda não possui uma conta? Cadastre-se", a tela de cadastro será exibida, e ao clicar em "Já possui uma conta? Faça o login!", retornaremos à tela de login. Observem que não temos mais o botão de voltar.

Portanto, a transição entre a tela de login e a tela de cadastro está funcionando conforme o esperado.

@@09
Conhecendo o componente Picker

O SwiftUI introduziu um novo componente de visualização chamado Picker, que permite a seleção de uma opção de uma lista com alguns valores pré-definidos por parte das pessoas usuárias. No nosso caso, a pessoa paciente precisa selecionar o seu plano de saúde.
Inserindo a lista de planos de saúde
Para iniciar, vamos criar uma lista contendo todos esses planos de saúde diretamente na tela de cadastro (SignUpView). Acima do state, que é a variável de estado da senha, definimos uma nova constante chamada let healthPlans, a qual é um array de strings, [String].

Selecionamos alguns planos de saúde mais populares que encontramos, mas você está livre para fazer a sua própria lista de planos de saúde.

Também teríamos a opção de pegar essa lista do nosso back-end, mas, para não complicar, vamos criar essa lista de forma estática.

Aqui estão algumas das strings que serão adicionadas como planos de saúde: "Amil", "Unimed", "Bradesco Saúde", "Sul América", "Hapvida", "Notredame Intermédica", "São Francisco Saúde", "Golden Cross", "Medial Saúde", "América Saúde" e "Outros". Não temos certeza da existência de todos esses planos, pois eles foram obtidos do back-end.

No entanto, essa é uma lista, fictícia ou não, dos planos de saúde disponíveis.

SignUpView
// código omitido

let healthPlans: [String] = [
"Amil", "Unimed", "Bradesco Saúde", "SulAmérica", "Hapvida", "Notredame Intermédica", "São Francisco Saúde", "Golden Cross", "Medial Saúde", "América Saúde", "Outro"
]

// código omitido
COPIAR CÓDIGO
Agora, com a lista criada, começaremos a implementar o componente Picker.

Implementando o componente Picker
Descendo o código, após o SecureField(), iniciamos escrevendo o texto "selecione o seu plano de saúde" e aplicamos os mesmos modificadores de propriedade usados para a senha e o texto de e-mail.

SignUpView
// código omitido

Text("Selecione o seu plano de saúde")
.font(.title3)
.bold()
.foregroundStyle(.accent)

// código omitido
COPIAR CÓDIGO
Iniciaremos implementando o Picker. Digitamos "Picker" e escolhemos a opção "TitleKey:selection:content". O title key é essencialmente um texto, que definiremos como "plano de saúde". A Selection é a variável de estado, então criamos a variável de estado chamada healthPlan no @State.

Lembrando que, healthPlans é a lista de planos disponíveis, e HealthPlan é o plano de saúde escolhido dentro dessa lista.

healthPlans = lista de planos
HealthPlan = plano de saúde da lista
Por ser um binding, usamos o cifrão ($) para referenciar healthPlan. No "content", pressionamos a tecla "Enter" e dentro do nosso Picker, precisamos começar definindo um ForEach(). Dentro desse ForEach(), a lista que desejamos iterar é a lista de healthPlans.

Precisamos passar também o ID, dois pontos, barra invertida, ponto self para identificar cada elemento da lista. Logo após a primeira chave, escrevemos healthPlan in.

Esse in serve para delimitar o corpo do ForEach, o que vamos escrever dentro desse ForEach da variável definida que faz referência a cada plano de saúde? Dentro desse ForEach, escrevemos um texto healthPlan.

SignUpView
// código omitido

Text("Selecione o seu plano de saúde")
.font(.title3)
.bold()
.foregroundStyle(.accent)

Picker("Plano de saúde", selection: $healthPlan) {
ForEach(healthPlans, id: \.self) { healthPlan in
Text(healthPlan)
}
}

// código omitido
COPIAR CÓDIGO
No Preview do lado direito, logo após "selecione o seu plano de saúde", conseguimos visualizar uma lista e uma seta para cima e uma seta para baixo. Se clicarmos acima, visualizamos todos os planos de saúde.

Entretanto, temos um pequeno problema. Caso não seja selecionado nenhum plano de saúde, a variável healthPlan será uma string vazia e não queremos enviar uma string vazia para o back-end. Vamos testar isso.

No botão de cadastro, especificamente na ação do botão na linha 111, colocaremos um print healthPlan.

SignUpView
Button(action: {
print healthPlan
}, label: {
ButtonView(text: "Cadastrar")
})
COPIAR CÓDIGO
Agora, vamos executar esse código. A maneira mais rápida de fazê-lo é teclando "Command + R". Navegamos para a tela de cadastro e clicamos em "Cadastrar".

Não vamos interagir com o picker (seletor), deixando-o sem seleção. Quando tentamos cadastrar, o resultado é que o console retorna vazio, não apresentando nenhuma informação. Mesmo clicando no botão de cadastro, a ação não retorna nada no console.

Então, qual seria a solução para definir um valor padrão para a variável healthPlan? Por exemplo, desejamos que o valor padrão seja o primeiro elemento da lista healthPlans.

Como fazer isso? No SwiftUI, não conseguimos definir o valor inicial para healthPlan diretamente, acessando a variável de estado. Tentando fazer isso, vamos apagar as aspas duplas e definiremos healthPlans como o elemento de índice zero da lista healthPlans. Por exemplo:

@State private var healthPlan: String = healthPlans(0)
COPIAR CÓDIGO
Obtemos um erro informando que não podemos utilizar a variável healthPlans porque ela não foi definida. Isso significa

Isso nos faz entender que precisamos criar um construtor.

Criando um construtor
Logo após a definição de let healthPlans, criamos um construtor utilizando a palavra-chave init. Esse construtor será responsável por inicializar a variável healthPlans com o valor do primeiro elemento da lista healthPlans.

SignUpView
// código omitido

init() {
self.healthPlan = healthPlans[0]
}

// código omitido
COPIAR CÓDIGO
Agora sim, a variável healthPlans estará inicializada em nosso construtor. Na variável de estado removemos o valor padrão healthPlans mas manteremos a variável como uma string vazia, uma vez que será inicializada no construtor.

Vamos executar o código mais uma vez e navegar para a tela de cadastro no simulador. Novamente, não selecionaremos nada no picker. Ao clicar em "Cadastrar", agora no console, podemos observar que ele retornou "Amil", que é o primeiro elemento da lista de planos de saúde.

Conclusão e próximos passos
Com o componente Picker funcionando corretamente, temos as telas de login e cadastro prontas. Agora, é hora de aplicar nossos conhecimentos em requisições para uma API externa e efetivamente cadastrar um paciente.

Te espero para o próximo vídeo!

@@10
Para saber mais: Picker

É bastante comum em vários aplicativos, que as pessoas consigam selecionar alguns itens em uma lista. Para desenvolver essa funcionalidade no SwiftUI, podemos utilizar o Picker!
O Picker é um controle de entrada que permite ao usuário selecionar um valor de uma lista de opções. Ele é semelhante a um menu suspenso, mas pode ser personalizado para atender às diferentes necessidades de uma aplicação.

Para que serve o Picker no SwiftUI?
O Picker pode ser usado para uma variedade de propósitos, incluindo:

Selecionar um item de um menu
Selecionar uma data ou hora
Selecionar um valor de uma lista de opções
Exemplos práticos
Veja o que mais podemos fazer com o Picker:

Menu de seleção: um Picker pode ser usado para fornecer um menu de seleção para o usuário. Por exemplo, um aplicativo de restaurante pode usar um Picker para permitir que o usuário selecione um tipo de comida.
Seleção de data ou hora: um Picker pode ser usado para permitir que o usuário selecione uma data ou hora. Por exemplo, um aplicativo de calendário pode usar um Picker para permitir que o usuário selecione uma data para um evento. Neste caso, é mais comum utilizar do DatePicker, que é uma variação do Picker, que lida exatamente com calendários.
Seleção de valor: um Picker pode ser usado para permitir que o usuário selecione um valor de uma lista de opções. Por exemplo, um aplicativo de e-commerce pode usar um Picker para permitir que o usuário selecione uma cor para um produto.
Como usar o Picker no SwiftUI
Para usar um Picker no SwiftUI, você precisa fornecer os seguintes elementos:

Uma seleção: a propriedade selection é usada para armazenar o valor selecionado.
Um label: o label é usado para identificar o Picker.
O conteúdo do Picker: o conteúdo do Picker é uma lista de opções que o usuário pode selecionar.
Veja exemplo de como usar um Picker:

struct PickerView: View {
  @State private var selection = 0

  var body: some View {
    Picker("Selecione uma cor", selection: $selection) {
      ForEach(0 ..< 5) { index in
        Text("Cor \(index)")
      }
    }
  }
}
COPIAR CÓDIGO
Este código cria um Picker com cinco opções de cores. A propriedade selection é usada para armazenar o índice da cor selecionada. O label do Picker é "Selecione uma cor".

Estilos de Picker
O Picker tem quatro estilos diferentes:

Menu: o estilo padrão, que mostra um menu suspenso quando o Picker é tocado.
Inline: o Picker é exibido na mesma linha que o label.
Segmented: o Picker é exibido como uma série de segmentos.
Wheel: o Picker é exibido como uma roda.
O estilo do Picker pode ser definido usando a propriedade pickerStyle().

Concluindo
O Picker é um controle de entrada versátil que pode ser usado para uma variedade de propósitos. Com um pouco de prática, você pode usar o Picker para criar interfaces de usuário intuitivas e fáceis de usar.

@@11
Para saber mais: número máximo de views

Em SwiftUI, há uma simplicidade para criar interfaces de usuário flexíveis e atraentes. No entanto, nas versões anteriores ao Xcode 15/iOS 17.0, houve um limite específico que os desenvolvedores de SwiftUI precisavam ter em mente: o número máximo de views que podiam ser combinadas em um único container.
Nas versões anteriores ao Xcode 15, havia um limite em que uma view podia ter no máximo 10 child views (ou seja, views que são “filhas”) dentro de um container específico, como VStack, HStack ou qualquer outro componente similar. Quando se tentava adicionar uma 11ª view, o compilador lançaria um erro:

// Esse código, antes, dava erro!
VStack {
    Button("Button 1") {}
    Button("Button 2") {}
    // ... até Button 11
        Button("Button 11") {}
}
COPIAR CÓDIGO
Ao exceder o limite, você se depararia com uma mensagem de erro semelhante a: "Argument passed to call that takes no arguments” (Argumento passado para uma chamada que não aceita argumentos, em livre tradução).

Esta mensagem pode ter sido um tanto confusa, porque não indicava diretamente a causa raiz do problema.

Para contornar esse limite, os desenvolvedores costumavam agrupar várias views em grupos menores, cada um respeitando o limite de 10 views. Por exemplo, se você tivesse 12 botões, você poderia agrupar os primeiros 10 em um Group e os restantes 2 em outro. Veja o exemplo abaixo em código:

VStack {
    Group {
        Button("Button 1") {}
        Button("Button 2") {}
        // ... até Button 10
    }
    Group {
        Button("Button 11") {}
        Button("Button 12") {}
    }
}
COPIAR CÓDIGO
Outra abordagem comum era refatorar partes da interface do usuário em views menores e mais gerenciáveis, o que é, na verdade, uma boa prática para manter o código limpo e modularizado.

Entretanto, agora, você pode adicionar mais de 10 child views a um container sem se preocupar com a antiga restrição.

O SwiftUI está sempre evoluindo, e com cada nova versão, ele se torna mais poderoso e flexível. Sempre é bom estar ciente das mudanças e melhorias, pois isso pode impactar como você aborda o desenvolvimento de interfaces. E, como sempre, quando em dúvida, a documentação do SwiftUI é um recurso inestimável!

@@12
Desafio: componentizando views

Durante o desenvolvimento de aplicativos, é comum encontrar componentes de UI que são reutilizados em diferentes partes do aplicativo. Para promover a reutilização de código e tornar o código mais legível e manutenível, você será desafiado a extrair componentes comuns da tela de login e da tela de cadastro.
Por que isso é importante? Componentizar views não é apenas uma prática de economizar linhas de código, mas também ajuda a criar um projeto mais escalável e fácil de dar manutenção. Se precisar fazer uma alteração no design de um componente, será muito mais fácil ajustar em um único lugar e refletir essa mudança em todo o aplicativo.
Requisitos:

Componente TextField personalizado: Crie um componente que possa ser utilizado tanto para o TextField quanto para o SecureField, que já tenha o estilo de fundo cinza e os cantos arredondados. Ele também deve permitir o uso de diferentes teclados e configurações de autocorreção.
Componente representando um título do campo: Crie um componente para o título dos campos (como "Email", "Senha", etc.), para que você não tenha que estilizar o texto toda vez que precisar dele.
Utilize esses componentes na SignInView e SignUpView.

Espero que esse desafio ajude você a ver o valor da componentização e como isso pode facilitar o desenvolvimento em SwiftUI. Lembre-se de sempre procurar oportunidades para reutilizar componentes em seus projetos! Qualquer dúvida, chama a gente!

@@13
Faça como eu fiz: criando telas de cadastro e login do paciente

Vamos colocar seus conhecimentos em prática! Siga os passos a seguir:
Definindo a tela de login (SignInView):
Crie uma estrutura para sua tela de login;
Use o modificador @State para armazenar entradas de email e senha;
Utilize VStack para a estrutura principal, incluindo um logotipo, títulos e campos de texto. Estilize com modificações como padding, background, e cornerRadius.
Adicionando funcionalidades à tela de login:
Insira um botão "Entrar"~;
Implemente uma NavigationLink que conduza à tela de cadastro para usuários sem conta.
Construindo a Tela de Cadastro (SignUpView):
Crie uma nova estrutura para a tela de cadastro;
Utilize variáveis @State para entradas como nome, email, CPF, telefone e senha;
Estruture o código com um ScrollView e adicione campos de texto adequados para cada entrada;
Inclua um botão "Cadastrar" e uma NavigationLink para retornar à tela de login.
Implementando o Componente Picker:
Crie uma lista de planos de saúde;
Adicione um título e utilize o componente Picker para que o usuário possa selecionar um plano. Use ForEach para exibir as opções de planos.

O objetivo desta atividade é estimular a prática necessária para seu aprendizado!
Você pode conferir o código do projeto até o momento através desta branch no GitHub.

Se precisar de ajuda, chama a gente no fórum ou discord!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-01

@@14
O que aprendemos?

Nesta aula, você aprendeu a:
Construir a tela de login utilizando o componente TextField para permitir que as pessoas escrevam e insiram suas informações na tela do app;
Finalizar e refinar os detalhes da tela de login;
Criar uma tela dedicada para cadastro de usuários;
Conhecer e utilizar o componente Picker para opções de seleção.
O início de qualquer aplicativo começa com uma ótima experiência de entrada!

Continuamos na aula a seguir.

#### 11/04/2024

@02-Modelo de paciente

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto através desta branch no Github e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-01

https://github.com/alura-cursos/swiftui-vollmed-authentication/archive/refs/heads/aula-01.zip

@@02
Criando o modelo do paciente e fazendo a requisição POST

O que precisamos fazer agora? Ao clicar no botão de cadastro, precisamos enviar uma requisição POST para a nossa API para, de fato, registrar o paciente em nosso banco de dados. Vamos abrir o Insomnia e analisar o que precisamos enviar no cadastro.
{
  "cpf": "65147182055",
  "nome": "Lucas",
  "email": "lucas@email.com",
  "senha": "12345",
  "telefone": 99999999,
  "planoSaude": "Unimed"
}
COPIAR CÓDIGO
Nesse caso, enviamos um JSON com CPF, nome, e-mail, senha, telefone e plano de saúde. São os mesmos atributos que temos na nossa tela de cadastro. Vou apenas modificar o CPF já que esse paciente já foi cadastrado anteriormente. Portanto, vou adicionar o CPF como "11111111111".

Lembrando que a API faz uma validação se o CPF é válido, realizando todos os cálculos necessários para verificação. Além disso, não podemos registrar dois pacientes com o mesmo CPF ou o mesmo e-mail.

Vamos mudar o e-mail para "lucas@gmail.com". Clicando em "Send", a requisição retorna o paciente, significa que o cadastro foi aceito. O retorno é um objeto com os mesmos atributos enviados e um atributo adicional chamado "ID".

{
  "cpf": "11111111111",
  "nome": "Lucas",
  "email": "lucas@gmail.com",
  "senha":
   "a220fba0be8d95eb4d29216e8d429ed0:3d87e78b131f473014d48977366 6e07f",
  "telefone": 99999999,
  "planoSaude": "Unimed",
  "id": "0213ec39-41d4-4a81-871c-85eafa10a8a8"
}
COPIAR CÓDIGO
Vamos começar criando este modelo de dados na nossa aplicação com Swift.

Retornando ao Xcode, vou acessar a pasta Models, clicar com o botão direito para criar um novo arquivo, clicar em "Swift File > Next" e nomearemos esse arquivo como "Patient", que é o modelo para o paciente.

No arquivo Schedule Appointment, quando definimos o modelo de dados para agendar uma consulta, criamos dois modelos diferentes: um para a resposta que a API estava retornando e outro para a requisição que estávamos fazendo, pois alguns atributos eram diferentes.

Agora, farei de forma diferente. Como o único atributo que diferencia a requisição da resposta é o ID, vou criar apenas uma estrutura, um único modelo de dados, e adicionarei o parâmetro ID como opcional.

Vamos começar fazendo com que esta struct esteja em conformidade com o protocolo Identifiable, que exige um ID, e também ao protocolo Codable, para conseguirmos tanto a codificação dos dados para JSON quanto a decodificação desses dados do JSON para este modelo de dados. Então, vamos começar a definir a constante id, que é do tipo string e será opcional.

import Foundation

struct Patient: Identifiable, Codable {
        let id: String?
COPIAR CÓDIGO
Quando enviarmos para o back-end, vamos enviar o ID como new, pois ainda não temos o ID do paciente. Obtemos o ID quando a requisição retorna. Assim, conseguimos atualizar essa propriedade.

Após o id, vamos adicionar os demais dados:

struct Patient: Identifiable, Codable {
    let id: String?
    let cpf: String
    let name: String
    let email: String
    let password: String
    let phoneNumber: String
    let healthPlan: String
COPIAR CÓDIGO
Também vamos criar o enum CodingKeys, que representa o valor como string e o protocolo CodingKey para realizar o mapeamento das nossas chaves.

enum CodingKeys: String, CodingKey {
    case id
    case cpf
    case name = "nome"
    case email
    case password = "senha"
    case phoneNumber = "telefone"
    case healthPlan = "planoSaude"
}
COPIAR CÓDIGO
Agora temos a nossa struct Patient criada!

Para aproveitar o restante do vídeo, vamos começar a definir a função que cadastra o paciente no nosso webservice. Então, no arquivo WebService, antes da função cancelAppointment, vamos definir outra função: registerPatient. Precisamos pensar quais serão os atributos ou o atributo que essa função receberá.

Poderíamos receber os atributos de forma individual, como nome, CPF, e-mail. Entretanto, nesse caso, como são vários atributos, acho mais viável passar um único atributo do tipo Patient aqui, certo?

Então, entre parênteses, vou colocar patient, que é do tipo Patient. Vamos começar então com o async throws. Qual será o retorno dessa função? Será um Patient, que é opcional.

func registerPatient(patient: Patient) async throws -> Patient? {

}
COPIAR CÓDIGO
Dentro das chaves vamos iniciar a nossa requisição. Começaremos criando o endpoint. Então, let endpoint é igual a baseURL mais "/paciente".

Em seguida, faremos o tratamento da URL.

    func registerPatient(patient: Patient) async throws -> Patient? {
        let endpoint = baseURL + "/paciente"
        
        guard let url = URL(string: endpoint) else {
            print("Erro na URL!")
            return nil
        }
COPIAR CÓDIGO
Então, o que precisamos fazer agora?

Precisamos converter o patient, que é do tipo Patient, em JSON para enviarmos à nossa API no corpo da requisição. Vamos fazer isso com o seguinte código:

let jsonData = try JSONEncoder().encode(patient)
COPIAR CÓDIGO
Beleza, agora devemos criar a nossa requisição. Assim, var request, que é igual a URLRequest passando a url. Request.httpMethod é igual a POST, pois estamos criando um paciente e enviando informações. Request.setValue para application/json e forhttpHeaderField.

Vou especificar que estou enviando um JSON para a API fazer o tratamento correto. E o que mais vou preencher aqui? Vou incluir a request.httpBody, que será igual ao meu jsonData.

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
COPIAR CÓDIGO
Agora, de fato, vamos chamar essa requisição. Como vamos fazer isso?

Com let (data, _), é underline, pois não vou usar da minha variável resposta, isso aqui é uma dupla que estou desestruturando, é igual a try await URLSession.shared.dataForRequest.

let (data, _) = try await URLSession.shared.data(for: request)
COPIAR CÓDIGO
Agora precisamos decodificar esses dados. Escrevo, então, let patient é igual a try JSONDecoder.decode. Qual é o tipo? É um Patient.self, from: data. Agora, simplesmente vou retornar o patient e temos nossa requisição criada.

        let patient = try JSONDecoder().decode(Patient.self, from: data)
        
        return patient
COPIAR CÓDIGO
Continuaremos no próximo vídeo!

@@03
CodingKeys

Considerando esta aula e o código fornecido, analise o seguinte trecho:
struct Patient: Identifiable, Codable {
    ...
    enum CodingKeys: String, CodingKey {
        ...
        case name = "nome"
        ...
        case password = "senha"
        ...
    }
}
...
func registerPatient(patient: Patient) async throws -> Patient? {
    ...
    let jsonData = try JSONEncoder().encode(patient)
    ...
}
COPIAR CÓDIGO
Qual é a principal razão para a definição de CodingKeys dentro do modelo Patient e como isso afeta a função registerPatient?

A função registerPatient usará CodingKeys para adicionar automaticamente campos adicionais, como um token de autenticação, ao JSON.
 
Isto é incorreto. O CodingKeys não adiciona automaticamente campos adicionais ao JSON.
Alternativa correta
CodingKeys serve para garantir que todas as chaves sejam codificadas em caixa alta ao fazer a requisição POST.
 
Isto é incorreto. O propósito do CodingKeys não é mudar a capitalização das chaves.
Alternativa correta
CodingKeys garante que apenas os atributos listados dentro dela sejam enviados na requisição POST, excluindo todos os outros.
 
Ao definir um conjunto de CodingKeys, somente essas chaves especificadas serão codificadas ou decodificadas. No entanto, a principal função das CodingKeys não é necessariamente para excluir atributos.
Alternativa correta
A definição de CodingKeys é usada para mapear os nomes dos atributos de Patient para os nomes das chaves esperadas pelo servidor ao fazer a codificação e decodificação.
 
No padrão Swift Codable, quando você tem nomes de propriedades em sua estrutura ou classe que não correspondem exatamente às chaves no JSON que você está codificando ou decodificando, você pode usar CodingKeys para fornecer um mapeamento personalizado. No exemplo dado, temos name = "nome" e password = "senha" o que significa que enquanto a propriedade no Swift é chamada de name, a chave correspondente no JSON será "nome", e assim por diante.

@@04
Chamando a função de criar um paciente

Com a requisição já criada no nosso arquivo WebService, precisamos chamar essa função no nosso arquivo SignUpView.
No entanto, antes de fazer isso, vou explicar um pouco sobre o funcionamento de ambas as telas de cadastro e de login, e o fluxo da nossa aplicação.

Quando a pessoa usuária se cadastrar, ela ainda precisará fazer login. Portanto, se o cadastro for bem-sucedido, ela será redirecionada para a tela de login.

Se houver alguma falha no cadastro, um alerta de erro aparecerá, e a pessoa usuária permanecerá nessa página para realizar as possíveis correções conforme o tipo de erro.

Dito isso, vamos ao nosso arquivo SignUpView. O que vamos fazer? Logo após o init(), vamos criar uma função:

func register () async {

}
COPIAR CÓDIGO
Essa função será assíncrona. E quando chamaremos essa função? Quando a pessoa usuária clicar no botão de cadastrar. Então, vamos localizar este botão. O botão "Cadastrar" está na linha 118. Dentro da ação do botão, vamos remover o print(healthPlan) e escrever Task {} para inserir o meu contexto assíncrono, lembrando que preciso dele para chamar uma função assíncrona. Então, vou escrever Task {await register}.

     Button(action: {
         Task {
             await register()
         }
     }, label: {
         ButtonView(text: "Cadastrar")
     })
COPIAR CÓDIGO
Agora, vamos implementar a função register(). Mas ainda não instanciei a struct WebService. Vamos fazer isso. Logo antes das minhas variáveis de estado vamos escrever:

let service = WebService()
COPIAR CÓDIGO
Agora, sim, podemos chamar a função.

Então, dentro da função register(), vou inserir um do/catch, porque a minha chamada pode me retornar um erro.

Dentro do catch, vou adicionar um print("Ocorreu um erro ao cadastrar paciente, \(error)") onde error é a variável a qual tenho acesso.

    func register() async {
        do {

            }
        } catch {
            print("Ocorreu um erro ao cadastrar paciente: \(error)")
        }
COPIAR CÓDIGO
Agora, fora desse do, preciso criar a minha pessoa paciente, preciso instanciá-la. Por quê? Porque na minha função registerPatient() do meu WebService, estou recebendo um atributo patient que é do tipo Patient. Então, preciso instanciar isso. Vamos fazer isso na SignUpView:

    func register() async {
        let patient = Patient(id: nil, cpf: cpf, name: name, email: email, password: password, phoneNumber: phoneNumber, healthPlan: healthPlan)
        do {

            }
        } catch {
            print("Ocorreu um erro ao cadastrar paciente: \(error)")
        }
COPIAR CÓDIGO
Vou abrir chaves e vou escolher essa segunda opção. Para o id, vou passar new, porque ainda não tenho acesso ao id do paciente.

Dentro desse do, vamos começar a fazer a chamada. Como me retorna uma opcional, preciso fazer o desembrulho. Vamos lá, if let patientRegistered = try await service.registerPatient(patient). Como isso aqui é uma condicional, preciso adicionar chaves e, nesse momento, vou simplesmente dar um print("Paciente foi cadastrado com sucesso"). Como não vou utilizar essa minha variável patientRegistered, posso simplesmente colocar aqui um sublinhado, indicando que ela não será utilizada.

    func register() async {
        let patient = Patient(id: nil, cpf: cpf, name: name, email: email, password: password, phoneNumber: phoneNumber, healthPlan: healthPlan)
        do {
            if let _ = try await service.registerPatient(patient: patient) {
               print("Paciente foi cadastrado com sucesso!")
            }
        } catch {
            print("Ocorreu um erro ao cadastrar paciente: \(error)")
        }
COPIAR CÓDIGO
Vamos salvar e executar a aplicação.

Vou clicar em "Ainda não possui uma conta? Cadastre-se" e vou começar o cadastro.

Não se preocupe com esses avisos do Xcode, tudo bem? Isso é provavelmente porque estou usando meu teclado físico ou algo do tipo. Vou preencher os campos. E apareceu aqui no console: "Paciente foi cadastrado com sucesso".

E, se eu voltar no meu Insomnia, posso verificar o cadastro. Vou na rota GET "todos os pacientes" e clicar em "Send", e agora consigo ver que o que acabei de criar foi cadastrado com sucesso.

Implementando alertas
Agora, vamos implementar os alertas, algo que já fizemos em diversas outras telas. Então, vou retornar ao meu Xcode e vou criar duas novas variáveis de estado com @State private var showAlert, que inicializará como false. Como estou definindo o tipo das outras variáveis, também vou definir o tipo dessas. Isso é opcional. A outra será State private var isPatientRegistered, o que significa? Significa quando minha requisição for concluída com sucesso. Também vou inicializá-la como False.

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var cpf: String = ""
    @State private var phoneNumber: String = ""
    @State private var healthPlan: String
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var isPatientRegistered: Bool = false
COPIAR CÓDIGO
Na minha função register(), logo após o catch, vou definir showAlert como true, porque o alerta será exibido em qualquer caso. Neste catch, vou definir isPatientRegistered como false, porque ocorreu um erro, então o paciente não foi registrado. Também vou criar um else logo após o if let, onde escreverei isPatientRegistered = false. E dentro do meu if let, que é quando o registro foi bem sucedido, isPatientRegistered = true.

    func register() async {
        let patient = Patient(id: nil, cpf: cpf, name: name, email: email, password: password, phoneNumber: phoneNumber, healthPlan: healthPlan)
        do {
            if let _ = try await service.registerPatient(patient: patient) {
                isPatientRegistered = true
                print("Paciente foi cadastrado com sucesso!")
            } else {
                isPatientRegistered = false
            }
        } catch {
            isPatientRegistered = false
            print("Ocorreu um erro ao cadastrar paciente: \(error)")
        }
        showAlert = true
    }
COPIAR CÓDIGO
Agora, vamos criar o modificador de alerta. Logo após o meu .padding().

E então, .alert. Vou escolher a última opção. Qual será o título? Depende. Então, vou fazer um operador ternário. IsPatientRegistered ?. Se sim, meu título será sucesso. Então, ponto de interrogação. Se não, dois pontos, o meu título será "Ops, algo deu errado!".

No IsPresented, onde estou passando um binding (vinculação), vou passar minha variável isPatientRegistered.Vou passar como showAlert, que está controlando se o meu alerta deve ser exibido ou não. Quanto às ações, vou adicionar os botões. Terei apenas um botão, que é um "OK". Ele não terá nenhuma ação, porque, por padrão, quando a pessoa usuária clica em "OK", o alerta some. Então, um botão. No actionLabel, o action, como eu disse, não terá nada. E o label será um texto "OK". Como também não estou usando nenhuma variável, esse T na linha 155, vou substituir por um underline _.

Agora, na message, passo meu parâmetro isPatientRegistered. Mas, na verdade, também não preciso usá-lo. Então, vamos fazer aqui na mensagem. Vou colocar um if isPatientRegistered. Se sim, qual será o texto da mensagem? Texto. "O paciente foi criado com sucesso.". E um else. Texto. "Houve um erro ao registrar o paciente. Por favor, tente novamente."

        .navigationBarBackButtonHidden()
        .padding()
        .alert(isPatientRegistered ? "Sucesso!" : "Ops, algo deu errado!", isPresented: $showAlert, presenting: $isPatientRegistered) { _ in
            Button(action: {}, label: {
                Text("Ok")
            })
        } message: { _ in
            if isPatientRegistered {
                Text("O paciente foi criado com sucesso!")
            } else {
                Text("Houve um erro ao cadastrar o paciente. Por favor tente novamente.")
            }
        }
COPIAR CÓDIGO
Novamente, como não estou utilizando essa variável isPatientRegistered, que defini na message. Essa variável não é a mesma que defini como estado. Vou simplesmente colocar um underline _.

Vamos executar este código novamente e vamos ver se está funcionando. Vou cadastrar um novo usuário.

E ao clicar em "Cadastrar" apareceu uma caixa de alerta informando "Sucesso! O paciente foi cadastrado com sucesso!" e abaixo da mensagem temos o botão "OK".

Continuaremos no próximo vídeo.

@@05
Navegando para uma tela de acordo com um estado

Agora que já estamos mostrando alertas de sucesso e erro, precisamos redirecionar a pessoa usuária para a tela de login após um cadastro bem sucedido. Isso é uma navegação baseada em estado. Se o cadastro for bem sucedido, a pessoa será redirecionada. Do contrário, ela permanecerá na mesma tela.
Primeiramente, vamos ao nosso arquivo SignUpView. Criarei uma nova variável de estado, logo abaixo do IsPatientRegistered. Essa nova variável será do tipo booleano e, inicialmente, será false.

@State private var navigateToSignInView: Bool = false
COPIAR CÓDIGO
Agora, precisamos trabalhar na nossa função register. Quando o registro for realizado com sucesso, precisamos alterar NavigateToSignInView para true. Portanto, estamos alterando o estado dessa variável. Podemos apagar a linha que coloca o print com "Paciente foi cadastrado com sucesso".

    func register() async {
        let patient = Patient(id: nil, cpf: cpf, name: name, email: email, password: password, phoneNumber: phoneNumber, healthPlan: healthPlan)
        do {
            if let _ = try await service.registerPatient(patient: patient) {
                isPatientRegistered = true
                navigateToSignInView = true
            } else {
                isPatientRegistered = false
            }
        } catch {
            isPatientRegistered = false
            print("Ocorreu um erro ao cadastrar paciente: \(error)")
        }
        showAlert = true
    }
COPIAR CÓDIGO
Continuando, após o nosso alerta, precisamos criar um novo modificador chamado NavigationDestination. No parâmetro IsPresented, passarei a variável NavigateToSignInView, já que ela controla se uma view deve ser apresentada ou não. Como destino (Destination), indico a SignInView (tela de login).

        .navigationDestination(isPresented: $navigateToSignInView) {
            SignInView()
        }
COPIAR CÓDIGO
Verificando se a implementação está correta, pressiono "Command + R" para executar o simulador e realizarei um cadastro.

No entanto, mesmo após a mensagem de sucesso após clicar em "Cadastrar" , percebo que a tela não é alterada para a tela de login.

Acredito que esse erro ocorra por causa do alerta. Assim, retorno ao meu código e altero o estado da variável NavigateToSignInView na ação do botão, para true. E removo a alteração feita dentro da função Register, na linha 37. Agora, quando a pessoa usuária pressionar "OK" no alerta, ela será redirecionada para a tela de login.

Testando novamente, finalmente, ao registrar uma pessoa usuária com sucesso, ela é redirecionada para a tela de login. Então, já temos esta navegação baseada em estado. Toda vez que a pessoa usuária se cadastrar e a requisição for bem sucedida, ela será levada até a tela de login, onde poderá inserir o e-mail e senha. Depois disso, conseguirá acessar nossa aplicação.

@@06
Navegação entre telas por estado

Considere o seguinte cenário: você está desenvolvendo um aplicativo para e-commerce e, antes de finalizar uma compra, o usuário precisa estar logado. Se o usuário tentar finalizar a compra sem estar logado, um alerta é apresentado, sugerindo que ele faça o login.
Com base no tópico de navegação condicional, qual é a melhor maneira de utilizar a variável @State para controlar a navegação para a tela de login após o usuário clicar no botão "Ok" do alerta?

@State private var userIsLoggedIn: Bool = true
...
Button("Finalizar Compra") {
    if !userIsLoggedIn {
        navigateToSignInView.toggle()
    }
}
...
.navigationDestination(isPresented: $userIsLoggedIn) {
    SignInView()
}
 
Alternativa correta
@State private var userIsLoggedIn: Bool = false
...
Button("Finalizar Compra") {
    if !userIsLoggedIn {
        userIsLoggedIn = true
    }
}
...
.navigationDestination(isPresented: $userIsLoggedIn) {
    SignInView()
}
 
Alternativa correta
@State private var navigateToSignInView: Bool = false
...
Button("Finalizar Compra") {
    if !userIsLoggedIn {
        navigateToSignInView = true
    }
}
...
.navigationDestination(isPresented: $navigateToSignInView) {
    SignInView()
}
 
Aqui, definimos a variável navigateToSignInView para controlar a navegação para a tela de login. Quando o botão "Finalizar Compra" é pressionado e o usuário não está logado (!userIsLoggedIn), a variável navigateToSignInView é definida como true, acionando a navegação para SignInView.

@@07
Faça como eu fiz: utilizando da requisição POST para criar um paciente

Hora de praticar! Siga as instruções abaixo para criar um paciente:
1 - Definição do modelo de paciente:

a) Crie a struct Patient, que segue os protocolos Identifiable e Codable;
b) Use CodingKeys para mapear os campos de nome personalizado.
struct Patient: Identifiable, Codable {
    ...
    enum CodingKeys: String, CodingKey {
        ...
    }
}
COPIAR CÓDIGO
2- Implementando a função de registrar um paciente:

a) Crie a função registerPatient que faz uma requisição POST para registrar um paciente;
b) função deve receber um paciente e devolver um paciente opcional (pode ser nil).
        func registerPatient(patient: Patient) async throws -> Patient? {
            ...
        }
COPIAR CÓDIGO
3 - Chamada para a função de registro:

a) Defina variáveis @State para controlar a exibição de alertas e o sucesso do registro;
b) Implemente a função register que chama registerPatient e atualiza as variáveis de estado.
        @State private var showAlert: Bool = false
        @State private var isPatientRegistered: Bool = false
        
        func register() async {
            ...
        }
COPIAR CÓDIGO
4 - Adicionando função ao botão de registro:

a) Adicione uma ação ao botão "Cadastrar" para chamar a função register.
        Button(action: {
            ...
            Task {
                await register()
            }
        }, label: {
            ButtonView(text: "Cadastrar")
        })
COPIAR CÓDIGO
5 - Exibindo alertas com feedback:

a) Utilize um .alert para exibir feedback após a tentativa de registro;
b) Baseie-se nas variáveis de estado para decidir qual mensagem mostrar.
.alert(isPatientRegistered ? "Sucesso!" : "Ops, algo deu errado!", ...
COPIAR CÓDIGO
6 - Navegação condicional:

a) Use uma variável @State para controlar a navegação para a tela de login;
b) Implemente uma ação no botão "Ok" do alerta para atualizar esta variável e, assim, acionar a navegação.
        @State private var navigateToSignInView: Bool = false
        
        ...
        
        .navigationDestination(isPresented: $navigateToSignInView) {
            SignInView()
        }

Essa aula se concentra em integrar a interface do usuário com lógicas de back-end, através da criação e registro de pacientes. É essencial entender como os dados fluem entre a interface e o servidor e como os estados são gerenciados em SwiftUI.
Confira o progresso do código no GitHub aqui.

Se tiver dúvidas ou enfrentar desafios, lembre-se de usar o fórum ou discord para obter ajuda!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-02

@@08
O que aprendemos?

Nesta aula, você aprendeu a:
Definir o modelo de dados para um paciente e como fazer uma requisição POST para criá-lo;
Chamar a função na tela de cadastro para criar um novo paciente;
Navegar para diferentes telas com base em um estado atual da aplicação.
Avançamos um passo essencial para personalizar a experiência do usuário!

Vejo você na próxima aula.

#### 12/04/2024

@03-Login e autenticação

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto através desta branch no Github e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-02

https://github.com/alura-cursos/swiftui-vollmed-authentication/archive/refs/heads/aula-02.zip

@@02
Criando modelo de login

Antes de começarmos a falar efetivamente sobre o login, gostaria de ressaltar que quando cadastramos uma nova pessoa paciente, o objeto retornado apresenta uma senha diferente daquela que eu inicialmente enviamos, porque ela é uma senha criptografada. Portanto, é por isso que ela contém uma grande sequência de letras e números. Dito isso, vamos começar a pensar no nosso login da aplicação.
Ainda no Insomnia, na coluna esquerda acessaremos a rota de login, abrindo "Autenticação > login". Esta é uma rota do tipo POST que recebe como entrada um JSON contendo dois atributos: o e-mail e a senha. Vamos clicar no botão "Send" (Enviar) ao lado do endereço da rota e verificar o que essa requisição nos retorna.

Rota login:
{
    "email":"lucas@gmail.com",
    "senha":"12345"
}
COPIAR CÓDIGO
Retorno:

{
    "auth": true,
    "id": "701c4af0-068d-4eef-b98a-31267ff4aa6a",
    "token": "eyJhbGc101JIUzI1NiIsInRSCCI6IkpXVC39.eyJpZCI6IjMMYWYLTA 20601NGV LZ1110ThhLTMxMjY3ZmY@YWEZYSIsImLhdCI6MTY5NDcxMDc10Cwl ZXWIjoxNzI2M1Q2NzU410.XTBJAq@WRPYnkPIgBQmqsTLXHCMGB38Hd3H-tB91qRo
}
COPIAR CÓDIGO
No caso, ela retornou um objeto com uma chave auth como true, pois a pessoa usuária está autenticada. Este objeto também contém o id da pessoa paciente e um token de autenticação. Em um vídeo posterior, eu explicarei melhor o que significa o token e como ele funciona o uso do token.

Neste momento, começaremos a criar o nosso modelo de dados. Criaremos dois modelos diferentes, um para a requisição de login e outro para a resposta da requisição de login. Para isso, voltaremos ao meu XCode.

Dentro do XCode, criaremos um novo arquivo na pasta "Models". Para isso, clicamos com o botão direito do mouse sobre a pasta, selecionamos "New file" (Novo arquivo). Na janela que abre no centro da tela, selecionamos "Swift File" e clicamos no botão "Next" (Próximo), no canto inferior direito da janela. Na nova janela que abre no centro da tela, nomearemos o arquivo como Login e clicaremos no botão "Create" (Criar), no canto inferior direito da janela.

No arquivo Login.swift, que abriu no centro da tela, abaixo do import Foundation, codaremos struct LoginRequest, que é a estrutura que representará as informações que precisamos enviar. Ela se adequará ao protocolo Codable.

Dentro dessa estrutura, passaremos o let email: String e let password: String. Adicionaremos também o enum CodingKeys para fazer o mapeamento dessas chaves. O tipo dele é string e ele precisa se adequar ao protocolo CodingKey. Dentro do CodingKeys, passamos o case email, que não muda, e case password = "senha".

struct LoginRequest: Codable {
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case email
        case password = "senha"
    }
}
COPIAR CÓDIGO
Após a LoginRequest, criaremos uma outra estrutura, codando struct LoginResponse: Identifiable, Codable{}. Dessa vez, além do protocolo Codable, passamos o Identifiable, pois ela me retorna o ID. Dentro do LoginResponse, adicionamos os atributos let auth: Bool, ou seja, do tipo booleano, let id: String e, por fim, let token: String, sendo os dois últimos do tipo string.

struct LoginResponse: Identifiable, Codable {
    let auth: Bool
    let id: String
    let token: String
}
COPIAR CÓDIGO
Neste caso, não precisamos utilizar as Coding Keys, porque os atributos de LoginResponse são os mesmos da resposta que a API está me retornando. Ao verificarmos o Insomnia, observamos que a API também retorna auth, id e token, ou seja, não há nenhum nome diferente. Portanto, neste caso, não precisamos fazer o mapeamento.

Código final do Login.swift
import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case email
        case password = "senha"
    }
}

struct LoginResponse: Identifiable, Codable {
    let auth: Bool
    let id: String
    let token: String
}
COPIAR CÓDIGO
Já temos os modelos de dados criados. Agora, precisamos efetuar a requisição do tipo POST para realizar o login da pessoa usuária de fato.

@@03
Fazendo a requisição POST

Vamos implementar a requisição do tipo POST. Entendo que possam estar cansados de fazer requisições, mas estamos quase concluindo.
Com o XCode aberto, acessaremos o arquivo WebService, antes do registerPatient(), criaremos uma nova função chamada loginPatient(). Esta função poderia receber um parâmetro do tipo loginRequest, mas receberá o e-mail e a senha dela, em seguida instanciaremos esse tipo dentro da função. Essa é uma opção que vocês têm, não é obrigatório.

Então, passaremos como parâmetros o email: String e password: String. Logo após os parênteses, passamos o async throws com o retorno opcional da resposta de login, ou seja LoginResponse?. Dentro da função, começaremos criando o endpoint, escrevendo let endpoint = baseURL + "auth/login", como podemos confirmar no Insomnia.

func loginPatient(email: String, password: String) async throws -> LoginResponse? {
    let endpoint = baseURL + "/auth/login"
}
COPIAR CÓDIGO
Observação: A instrutora esqueceu de colocar a barra (/) antes do auth, o que gera um erro no momento da execução e ela corrige posteriormente. Para facilitar o processo de aprendizagem, já deixamos o código correto na transcrição.
Agora vamos tratar a URL. Para isso, podemos copiar o código da url da registerPatient(), porque será igual, e colar abaixo do endpoint. Após a manipulação da URL, instanciaremos o loginRequest, passando os parâmetros email e password. Além disso, precisamos transformar a variável loginRequest para JSON, codando let jsonData = try JSONEncoder().encode(loginRequest).

Feito isso, podemos criar a requisição de fato, criando a var request e passando a URLRequest(url: url). Em seguida informamos que o httpMethod da requisição será POST, codaremos o setValue() e p httpBody.

Depois, para realizarmos a requisição, codaremos o let (data, _) = try await URLSession.shared.data(for: request). Feito isso, precisamos decodificar os dados, codando let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data). Por fim, fazemos o retorno, com return loginResponse.

Arquivo WebService.swift
func loginPatient(email: String, password: String) async throws -> LoginResponse? {
    let endpoint = baseURL + "/auth/login"

    guard let url = URL(string: endpoint) else {
        print("Erro na URL!")
        return nil
    }

    let loginRequest = LoginRequest(email: email, password: password)

    let jsonData = try JSONEncoder().encode(loginRequest)

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData

    let (data, _) = try await URLSession.shared.data(for: request)

    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)

    return loginResponse
}
COPIAR CÓDIGO
Criamos a nossa requisição, então vamos chamar essa função na nossa tela de login. Portanto, acessaremos "Views > SigninView. Nesse arquivo, precisamos instanciar o WebService, então, no começo da View, após as variáveis de estado, codaremos let service = WebService(). Abaixo dela, criaremos a func login() async, que é uma função assíncrona.

Arquivo SigninView.swift
@State private var email: String = ""
@State private var password: String = ""
@State private var showAlert: Bool = false

let service = WebService()

func login() async {

}
COPIAR CÓDIGO
Esta função será chamada quando a pessoa usuária pressiona o botão "Entrar". Então, na linha 62, dentro da ação do botão "Entrar", codaremos task { await login() }.

Arquivo SigninView.swift
Button(action: {
    Task {
        await login()
    }
}, label: {
    ButtonView(text: "Entrar")
})
COPIAR CÓDIGO
Retornando para função login, no começo do código, dentro dela codaremos o do/catch. No catch codaremos um print("Ocorreu um erro no login: \(error). Já no do, codaremos o if let response = try await service.loginPatient() { }.

Os parâmetros do loginPatient() serão o email e a password, que são as duas variáveis de estado, definidas nas linhas 12 e 13. Como é uma condicional, precisamos colocar o corpo da condicional entre chaves, onde passaremos apenas um print(response).

func login() async {
    do {
        if let response = try await service.loginPatient(email: email, password: password) {
            print(response)
        }
    } catch {
        print("Ocorreu um erro no login: \(error)")
    }
}
COPIAR CÓDIGO
Vamos executar essa aplicação, com "Command + R". No emulador, tentaremos acessar a aplicação com o e-mail lucas@gmail.com e a senha 12345. Ao clicarmos em "Entrar", recebemos a mensagem "Erro na URL!" no nosso Console. Precisamos verificar o problema no WebService. No caso, eu esqueci a barra antes de auth, então o endpoint do loginPatient() é baseURL + "/auth/login".

Vamos executar o código novamente e preencher o formulário de login com os mesmo dados de antes. Ao clicarmos no botão entrar, nosso Console retornou um objeto do tipo LoginResponse() com os atributos auth: true, id (o ID do paciente) e token (uma string enorme).

Retorno do Console após a ação de Login

LoginResponse(auth: true, id: "701c4af0-068d-4eef-b98a-31267ff4aa6a", token: "eyJhbGc101JIUzI1NiIsInRSCCI6IkpXVC39.eyJpZCI6IjMMYWYLTA 20601NGV LZ1110ThhLTMxMjY3ZmY@YWEZYSIsImLhdCI6MTY5NDcxMDc10Cwl ZXWIjoxNzI2M1Q2NzU410.XTBJAq@WRPYnkPIgBQmqsTLXHCMGB38Hd3H-tB91qRo
COPIAR CÓDIGO
A última coisa que precisamos implementar é um alerta. Entretanto, só teremos um alerta se o login não for bem-sucedido. Se a pessoa paciente conseguir logar com sucesso, ela será redirecionada para a tela em que pode visualizar as especialidades, agendar consultas, remarcar, entre outras operações.

Neste caso, criaremos apenas um alerta de erro, sem a necessidade de uma variável para controlar se é de sucesso ou de erro. Então, no arquivo SigninView, começaremos criando uma nova variável de estado a password. Será a variável showAlert, do tipo booleano e será inicializada como falsa.

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    //código omitido
COPIAR CÓDIGO
Exibiremos o alerta quando ocorrer um erro. Para isso, dentro do catch, acima do print, codaremos showAlert = true. Já dentro do do, também criaremos um bloco else {} logo após o if let, onde codaremos showAlert = true.

func login() async {
    do {
        if let response = try await service.loginPatient(email: email, password: password) {
            print(response)
        } else {
            showAlert = true
        }
    } catch {
        showAlert = true
        print("Ocorreu um erro no login: \(error)")
    }
}
COPIAR CÓDIGO
Com isso feito, implementaremos o modificador de alerta. Após o navigationBarBackButtonHidden(), que está na linha 89, adicionaremos .alert(), mas escolheremos a opção titleKey:isPresented:actions:message dentre as sugestões do XCode. Essa opção é um tanto diferente, pois não possui uma variável presente.

Para titleKey, vamos atribuir a string "Ops, algo deu errado". Já para isPresented, passaremos nossa variável $showAlert. Para actions, passaremos Button, que possuirá uma action vazia e uma label com Text("Ok"). Por fim, na mensagem, passaremos um Text("Houve um erro ao entrar na sua conta. Por favor, tente novamente.").

.padding()
.navigationBarBackButtonHidden()
.alert("Ops, algo deu errado!", isPresented: $showAlert) {
    Button(action: {}, label: {
        Text("Ok")
    })
} message: {
    Text("Houve um erro ao entrar na sua conta. Por favor tente novamente.")
}
COPIAR CÓDIGO
Observação: Também é possível utilizar estes alertas nas outras telas que criadas sem passar o parâmetro utilizado, porém será mantida a forma utilizada anteriormente para as outras telas.
Agora executaremos esse código, com "Cmd + R". Na tela de login do emulador, passaremos dados errados nos campos de e-mail e senha. Ao clicar em "Entrar", receberemos o alerta "Ops, algo deu errado. Houve um erro ao entrar na sua conta, por favor, tente novamente.". Portanto já temos um alerta criado.

O próximo passo é entender mais sobre o funcionamento de um token. A seguir, teremos uma pequena aula teórica sobre isso. Aguardo você no próximo vídeo!

@@04
Entendendo o funcionamento do processo de autenticação JWT

Vamos falar sobre o processo de autenticação com o token JWT, que é retornado do nosso back-end quando fazemos a requisição POST para autenticar uma pessoa usuária. Quando a pessoa usuária consegue logar na nossa aplicação, significa que ela está, de fato, autenticada.
Token de Autenticação
O token de autenticação funciona como uma assinatura digital, ou uma chave, que seria sua identificação única. Por exemplo, em aplicativos bancários, para verificar seu saldo ou para fazer uma transferência, você precisa fazer um login. Assim sendo, é necessário passar esse token de autenticação para confirmar que, de fato, você é uma pessoa usuária autenticada e poder então realizar essas operações.

Existem vários algoritmos e padrões que transformam informações, como as informações da pessoa usuária, da autenticação ou do token, em um token. Um desses padrões é o JWT.

JWT
JWT é a sigla para JSON Web Token, que é um padrão para autenticação e troca de informações. Através dele, o token é decodificado no Back-end para decifrar algumas informações e, então, confirmar a autenticidade. Assim o Back-end informa se a pessoa usuária está autenticada e se está tudo certo para retornar qualquer tipo de informação que a pessoa esteja procurando. Vejamos um exemplo de token JWT:

Exemplo de token JWT
eyJhbGciOiJIUZI1NilsInR5cC161kpXVCJ9.ey JpZCI6IjA4YmJkYZRhLTNmYZAtNDg0OS04 YzlhLThjZmJhYTYzZGNhNSIsImlhdCI6MTY 5NDEZMDc2MSwiZXhwljoxNjk0MjE3MTYxf Q.btnPOeMXDJ_E3MaXNaToosbLTwsjeFTD m7GHf|1EWrU
COPIAR CÓDIGO
O token JWT é uma string com várias letras, maiúsculas e minúsculas, e números. Este é o token com o qual estamos lidando, então Vamos entender um pouco mais sobre o seu funcionamento.

Como o JWT funciona
Tudo começa com a pessoa usuária preenche o formulário de login, por exemplo, na nossa aplicação ele informa o e-mail e a senha. A aplicação front-end, que é a Cliente, como a nossa aplicação iOS, enviará uma requisição do tipo POST para o servidor com esse e-mail e a senha. O Servidor, que é o Back-end, verifica as credenciais. Se o e-mail existe e a senha está correta, o servidor cria o token JWT e retorna para a nossa aplicação.

Por sua vez, a Cliente armazena o token em local seguro, e em breve discutiremos sobre as boas práticas de segurança. Com esse token armazenado em local seguro, a Cliente envia requisições com este token no cabeçalho do tipo authorization (auth) , lembrando que o cabeçalho são as informações das nossas requisições. Assim, nosso Back-end checa esse JWT e obtém informações sobre a pessoa usuária. Com isso, ele retornará a resposta da nossa requisição.

Esquema do funcionamento de um token JWT. Esse esquema envolve três atores, que estão dispostas horizontalmente na parte superior na seguinte ordem: Usuário, Cliente e Servidor. No "Cliente", informa que se trata da aplicação front-end, enquanto no "Servidor" informa que se trata da aplicação back-end. O funcionamento tem 6 passos. 1: Pessoa usuária preenche o formulário de login com e-mail e senha; 2: Cliente envia uma requisição POST para o servidor com e-mail e senha; 3: Se estiver tudo certo com as credenciais, o servidor cria um token JWT e o retorna para Cliente; 4: Cliente armazena o token em um lugar seguro; 5: Cliente envia futuras requisições com o token no cabeçalho de "Authorization"; e 6: O Servidor checa o JWT, obtém informações sobre usuário e, então, retorna a resposta. Cada passo está abaixo do ator responsável por ele, então sob o Usuário tem apenas o passo 1, sob o Ciente tem os passo 2, 4 e 5 e sob o Servidor tem os passo 3 e 6. Além disso, os passos estão conectados por setas amarelas, que apontam para o próximo passo.

Enviando o token nas rotas
Como enviar o token nas rotas? Uma vez que o JWT é gerado na hora do login, ele é enviado de volta para o cliente, conforme vimos no funcionamento. Assim, precisamos incluir este token no cabeçalho do tipo authorization da requisição HTTP. Para isso, enviamos com a palavra-chave "Bearer" (Portador), que significa que estamos enviando um token para autenticação. Então enviamos Bearer StringDoToken, substituindo StringDoToken pelo token JWT gerado.

Para entender melhor, abriremos o Insomnia. Quando abrimos rota que necessita de autenticação, como a Criar uma consulta, Na parte superior ao campo de código, temos um menu horizontal onde a segunda opção é "Bearer".

Clicando na aba "Bearer", observamos que há o campo "TOKEN" com um token inserido. Neste caso, eu adicionei um token qualquer, que obviamente não é válido no momento, mas serve para ilustrar. Existem outras formas de autenticação também, que podemos observar clicando na seta para baixo ao lado direito do nome "Bearer", mas estamos utilizando é a opção Bearer Token.

Conclusão
Aprendemos mais sobre o funcionamento do token e vou disponibilizar um material complementar para que você possa se aprofundar ainda mais nesse assunto. Agora está na hora de começarmos a lidar com o token de fato, salvando-o em algum lugar e o enviando para as requisições.

Espero você para o próximo vídeo.

@@05
Para saber mais: JWT (JSON Web Token)

Para complementar seus estudos, não deixe de ler este artigo na Alura que explica sobre o JWT.

@@06
Fluxo de login

Em nosso aplicativo, estamos construindo um sistema de login para permitir que as pessoas se cadastrem e entrem na própria conta!
Considerando o fluxo de login, qual das afirmações abaixo é verdadeira sobre o processo de autenticação e login implementado?

A função loginPatient faz uma requisição GET para o servidor para autenticar o paciente.
 
Alternativa correta
A estrutura LoginRequest é responsável por enviar as credenciais do usuário, e sua representação em JSON irá sempre conter os campos "email" e "senha".
 
A afirmação está correta! A estrutura LoginRequest tem campos para email e password, e usa a enum CodingKeys para mapear o campo password para a chave "senha" em JSON. Portanto, sua representação em JSON contém os campos "email" e "senha".
Alternativa correta
O aplicativo utiliza autenticação baseada em cookies, conforme indicado no campo token na estrutura LoginResponse.
 
Alternativa correta
A função loginPatient definida no WebService tem como única responsabilidade decodificar a resposta do servidor e, por isso, não se preocupa em enviar os dados de LoginRequest como corpo da requisição POST.

@@07
Faça como eu fiz: requisição POST para login de um paciente

Bora implementar a requisição para logar um paciente?
1 - Modelo de requisição de login:

a) Defina a struct LoginRequest que será usada para enviar informações de login;
b) Utilize CodingKeys para mapear os campos personalizados.
    struct LoginRequest: Codable {
        ...
        enum CodingKeys: String, CodingKey {
            ...
        }
    }
COPIAR CÓDIGO
2 - Modelo de resposta de login:

a) Crie a struct LoginResponse que define a estrutura da resposta do login;
b) Este modelo contém um token JWT, que é um padrão para autenticação.
    struct LoginResponse: Identifiable, Codable {
        ...
    }
COPIAR CÓDIGO
3 - Realizando o login:

a) Implemente a função loginPatient que realiza uma requisição POST para autenticar um paciente;
b) A função usa o LoginRequest e espera um LoginResponse.
    func loginPatient(email: String, password: String) async throws -> LoginResponse? {
        ...
    }
COPIAR CÓDIGO
4 - Chamando a função de login:

a) Defina uma variável @State para controlar a exibição de um alerta;
b) Implemente a função login que chama loginPatient e lida com a resposta;
c) Não se esqueça de chamar essa função na ação do botão “Entrar”!
    @State private var showAlert: Bool = false
    
    func login() async {
        ...
    }
    
    Button(action: {
        Task {
            await login()
        }
    }
COPIAR CÓDIGO
5 - Exibindo um alerta em caso de erro:

a) Utilize .alert para mostrar um feedback se algo der errado durante o processo de login.
        .alert("Ops, algo deu errado!", isPresented: $showAlert) {
            ...
        }


Nesta aula, mergulhamos mais profundamente na integração com a API, focando no processo de login e autenticação. Utilizar padrões de autenticação, como JWT, é crucial para garantir a segurança e a privacidade dos usuários.
Dê uma olhada no progresso do código no GitHub.

Bons estudos!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-03

@@08
O que aprendemos?

Nesta aula, você aprendeu a:
Construir o modelo necessário para o login de um paciente;
Implementar a requisição POST para fazer a autenticação;
Compreender o funcionamento do processo de autenticação JWT, uma prática padrão na indústria.
Utilizar de tokens é muito comum no fluxo de uma aplicação!

Na próxima aula, vamos continuar evoluindo o nosso app.