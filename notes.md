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