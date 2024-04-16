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

#### 15/04/2024

@04-Token de autenticação

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto através desta branch no Github e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-03

https://github.com/alura-cursos/swiftui-vollmed-authentication/archive/refs/heads/aula-03.zip

@@02
Salvando o token e ID do paciente no UserDefaults

Já temos uma requisição de login funcionando. Além disso, estamos retornando o token e também entendemos um pouco mais sobre como ele funciona.
Agora, precisamos salvar o token em algum lugar. Também precisamos guardar o ID do paciente, que estamos utilizando em diversas requisições. Portanto, enquanto a pessoa usuária estiver logada em nossa aplicação, precisamos que o token e o ID dela estejam salvos.

Mas, por que isto é necessário? Pois usaremos o token em outras requisições, então ele precisa estar armazenado em algum lugar, disponível para nós.

Estrutura UserDefaults
Para começar, vamos salvar essas informações no que chamamos de UserDefaults.

Para quem vem do desenvolvimento web, o UserDefaults é muito semelhante ao localStorage, por exemplo. Basicamente, é uma classe no iOS na qual armazenamos algumas informações de forma persistente no dispositivo.

Essas informações são armazenadas com uma chave e um valor. No caso do token, por exemplo, o armazenaríamos com uma chave nomeada "token", seguida do valor desse token.

No UserDefaults, podemos armazenar e recuperar algumas informações de forma persistente nas configurações do dispositivo, até que o aplicativo seja desinstalado. O UserDefaults é ótimo para quando você precisa salvar alguma preferência de usuário ou alguma configuração específica.

Em um primeiro momento, vamos utilizar o UserDefaults. Mas, se você já conhece um pouco do iOS, não se preocupe: também iremos discutir sobre boas práticas de segurança e outras maneiras de armazenar esses valores.

Vamos começar criando uma estrutura chamada UserDefaultsHelper. Dentro desta estrutura, definiremos algumas funções para, por exemplo, salvar, recuperar ou remover algo no UserDefaults.

Sem mais delongas, vamos para o código!

Retornaremos ao meu Xcode e criaremos este arquivo dentro da pasta "Services". Clicando nela com o botão direito, selecionaremos "New file > Swift file". Nomearemos o novo arquivo como UserDefaultsHelper e clicaremos em "Create".

Vamos inserir o seguinte código:

UserDefaultsHelper
struct UserDefaultsHelper {
  static func save(value: String, key: String) {
    UserDefaults.standard.set(value, forKey: key)
  }
}
COPIAR CÓDIGO
Acima, começamos definindo a struct de nome UserDefaultsHelper e definimos uma função estática save. A função ser estática significa que não precisamos instanciar a classe para utilizá-la, e fazemos isso com a palavra static.

A função save recebe dois parâmetros: o valor value e a chave key, ambos do tipo String. Não estamos retornando nada quando salvamos algo. Logo, o retorno não contém nada.

Essa struct é apenas um "auxiliador", ou seja, ela nos auxiliará a salvar algo, de fato, no UserDefaults. Isso para não ficarmos chamando a classe UserDefaults o tempo inteiro na nossa View, por exemplo.

Então, dentro da função save, chamamos UserDefaults.standard.set. É essa função que realmente salva algo no UserDefaults. Seu primeiro parâmetro é value e o segundo é forKey, para o qual passamos a nossa key.

Pronto! Essa é a função que salva algo no UserDefaults. Em seguida, adicionamos o seguinte à nossa struct:

static func get(for key: String) -> String? {
    return UserDefaults.standard.string(forKey: key)
}
COPIAR CÓDIGO
Criamos outra função estática para recuperar algo do UserDefaults, denominada get. Ela recebe como parâmetro o for com key, ou seja, um labeled parameter.

Esse parâmetro é do tipo String e retorna uma string opcional, ou seja, String?. Isso porque pode haver ou não algo com essa chave no UserDefaults.

Depois, adicionamos nessa função um return de UserDefaults.standard.string(forKey: key), passando a chave para o retorno. Ou seja, essa função retorna uma string para a chave que queremos localizar.

Por fim, temos outra função estática nessa nossa struct, que chamamos de remove:

static func remove(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
}
COPIAR CÓDIGO
Também passamos o for key: String como parâmetro dessa função, e ela não retornará nada.

Em seguida, escrevemos entre as chaves: UserDefaults.standard.removeObject(forKey: key), passando a nossa chave.

Agora, temos completa a struct chamada UserDefaultsHelper que contém três funções diferentes: para salvar, para recuperar e para remover uma informação do UserDefaults:

struct UserDefaultsHelper {
    static func save(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func get(for key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    static func remove(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
COPIAR CÓDIGO
Feito isso, vamos chamar a função save para salvar tanto o token quanto o ID do paciente.

Chamando as funções de UserDefaults
Voltaremos ao arquivo SignInView. Na função login, quando damos um print response, vamos remover o print e escrever UserDefaultsHelper.save().

Qual será o valor (value)? Será o response.token. Já a chave (key) será marcada como token. Assim, no UserDefaults, a chave é o token e o valor é aquela string grande que representa o token.

Chamaremos a função UserDefaultsHelper.save() novamente, logo abaixo. Dessa vez, o valor será response.id, que representa o ID do paciente, e a chave será marcada como "patient-id".

SignInView
func login() async {
        do {
                if let response = try await service.loginPatient(email: email, password: password) {
                        UserDefaultsHelper.save(value: response.token, key: "token")
                        UserDefaultsHelper.save(value: response.id, key: "patient-id")
// código omitido
}
COPIAR CÓDIGO
Dessa forma, nós estamos salvando tanto o token quanto o ID do paciente no UserDefaults!

@@03
Verificando se o usuário está logado na aplicação

Nossa próxima tarefa é manipular o arquivo ContentView de maneira a fazer com que, se a pessoa usuária estiver logada na aplicação, seja exibida a tela de boas-vindas com especialistas e a tela que mostra as consultas, em que é possível realizar operações como remarcar ou cancelar consultas.
No entanto, caso não esteja logada, deve ser mostrada a tela de login e de cadastro.

Essa é uma verificação que faremos baseado em: se o token estiver armazenado nos UserDefaults, mostraremos a tela inicial, pois a pessoa usuária está logada. Caso contrário, se o token não estiver armazenado nos UserDefaults e retornar nil, um valor nulo, mostramos a tela de login.

Como estamos salvando o token e o ID do paciente nos UserDefaults, existe uma property wrapper, uma propriedade especial, chamada de AppStorage. Basicamente, ela vincula alguns valores às chaves específicas do UserDefaults.

Portanto, se houver uma AppStorage relacionada à chave do token, isso significa que qualquer modificação que for feita no valor dessa chave "token" será detectada por essa propriedade. Isso é muito útil e nos permite trabalhar de maneira muito simples.

Então, vamos começar. No arquivo ContentView, vamos definir essa propriedade. Logo após a struct, escreveremos @AppStorage, depois abrir e fechar parênteses.

Qual é a chave que ela vai observar? O token. Então vamos passar como parâmetro uma string "token". Em seguida, definimos a variável com var, que chamaremos de token também, sendo do tipo String. Vamos inicializá-la com uma string vazia.

ContentView
@AppStorage("token") var token: String = ""
COPIAR CÓDIGO
Ela é inicializada com uma string vazia, mas não se preocupe! Afinal, se a aplicação analisar esse @AppStorage e verificar que o token tem algum valor correspondente, então ele vai simplesmente ignorar essa string vazia e substituir com o valor do token.

Agora, faremos uma verificação de valor dentro do body. Primeiro, escreveremos if token.isEmpty, verificando se o token está vazio, então vamos abrir e fechar chaves.

Se ele estiver vazio, significa que não localizou um valor para essa chave token, então, utilizou o valor padrão, ou seja, a string vazia. Sendo assim, vamos inserir uma NavigationStack e, dentro dela, chamar a SignInView.

Depois disso, colocaremos um else e colaremos toda a TabView que vem logo abaixo.

struct ContentView: View {
    
    @AppStorage("token") var token: String = ""
    
    var body: some View {
        
        if token.isEmpty {
            NavigationStack {
                SignInView()
            }
        } else {
            TabView {
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house") }
                    )
                }
                
                NavigationStack {
                    MyAppointmentsView()
                }
                .tabItem {
                    Label(
                        title: { Text("Minhas consultas") },
                        icon: { Image(systemName: "calendar") }
                    )
                }
            }
        }
    }
}
COPIAR CÓDIGO
Só precisamos fazer mais uma modificação. No arquivo VollmedApp, em vez de deixar a NavigationStack com a SignInView dentro, vamos voltar para a ContentView.

VollmedApp
@main
struct VollmedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
COPIAR CÓDIGO
Vamos testar para ver se está funcionando, rodando a simulação com "Command + R".

Apareceu a tela de login. Vamos tentar logar com o e-mail do Lucas:

Email: lucas@gmail.com
Senha: 12345
Ao clicar em "Entrar", a tela é redirecionada para a página de boas-vindas. Como podemos observar no terminal, tivemos um erro para localizar os especialistas, mas podemos resolver isso em breve. Mas conseguimos o que queríamos!

O que aconteceu?!

Quando realizamos o login, ele salvou o token no UserDefaults na linha 21 da SignInView. A propriedade especial AppStorage, que está definida na ContentView, na linha 12, detectou essa mudança, porque um valor foi inserido na chave token, então ela atualizou a tela. Dessa forma, dentro do if, ele se deu conta de que agora existe algo no token. Então, exibiu a TabView.

O erro de localização de especialistas ocorreu porque a instrutora resetou a API e esqueceu de criar os especialistas de novo. Ela corrigiu e, agora, eles aparecem normalmente na tela.
Agora que já temos uma verificação para saber se a pessoa usuária está logada ou não, precisamos adicionar o token nas rotas necessárias.

Isso porque, se tentarmos agendar uma consulta, por exemplo, encontraremos um erro, visto que não estamos enviando nenhum token de autenticação. E, para a pessoa usuária conseguir agendar uma consulta, ela precisa estar autenticada. Assim, precisamos enviar esse token.

Então, esperamos você no próximo vídeo!

@@04
Desafio: adicionando um loading (feedback de carregamento)

Importante! Este desafio é uma atividade opcional e, se preferir, pode continuar o curso sem completá-la. Para desafiar você, este exercício não terá um gabarito ou resposta esperada. A ideia é que você busque a solução por conta própria, simulando o dia a dia de trabalho. Caso queira, pode interagir no Discord da Alura e conferir como outras pessoas solucionaram este desafio.
Você pode ter percebido que há um delay (atraso ou demora) de quando o usuário se loga e de quando ele é levado para a tela inicial.

Em aplicativos, hoje em dia é comum que façamos requisições para servidores, sejam para buscar, enviar ou até mesmo para validar informações, como estamos fazendo durante este curso.

Durante esse tempo de requisição, é fundamental fornecer um feedback visual para o usuário para que ele saiba que algo está acontecendo. Um dos feedbacks mais utilizados é o indicador de carregamento, também conhecido como "loading spinner" (giro de carregamento).

O seu desafio será implementar um indicador de carregamento para quando o usuário fazer o login no app. Esse indicador aparecerá após o usuário inserir suas credenciais e pressionar o botão de login, e desaparecerá quando a requisição for concluída (com sucesso ou erro).

O resultado final deve parecer com algo do tipo:

Imagem que mostra uma caixa de diálogo com um ícone de carregamento e a palavra “loading”, em português, “carregando”

Requisitos:
A tela deve apresentar um indicador de carregamento durante a tentativa de login;
O indicador de carregamento deve ser removido da tela após a finalização da requisição;
Enquanto o indicador estiver sendo exibido, o usuário não deve ser capaz de interagir com outros componentes na tela (para evitar múltiplas tentativas de login).
Dica: Use uma variável de estado para controlar o carregamento.
Por que esse desafio é importante?
Feedback ao usuário: O indicador de carregamento fornece um feedback visual que garante ao usuário que o aplicativo está processando seu pedido.
Melhoria da experiência do usuário (UX): Ao evitar que o usuário interaja com a tela enquanto o aplicativo estiver processando, você previne possíveis erros ou comportamentos inesperados.
Profissionalismo: Apps que fornecem um feedback visual apropriado parecem mais profissionais e bem construídos.

Boa sorte com o desafio e lembre-se: praticar é a chave para dominar qualquer habilidade! Qualquer impedimento, chama a gente para ajudar você!

@@05
Armazenando informações no UserDefaults

Na construção do nosso aplicativo, precisamos armazenar localmente as informações da pessoa usuária (token, id do paciente), ou seja, essas informações ficarão salvas no dispositivo - e não em um servidor online que necessitaria de uma requisição para API.
Qual das seguintes afirmações é verdadeira sobre como o código utiliza UserDefaults para gerenciar informações do usuário logado?

O código utiliza a classe UserDefaultsHelper para adicionar, recuperar e remover o token e ID do paciente.
 
Exatamente! A classe UserDefaultsHelper tem métodos save, get e remove que são utilizados no código para manipular dados em UserDefaults, como o token e ID do paciente.
Alternativa correta
Quando o paciente realiza logout, somente o token é removido de UserDefaults, o ID do paciente permanece.
 
No método logout, após um logout bem-sucedido, o código remove tanto o token quanto o ID do paciente de UserDefaults.
Alternativa correta
O código utiliza UserDefaults para armazenar a senha do paciente para futuras autenticações automáticas.
 
Alternativa correta
O código verifica se o usuário está logado procurando um token em UserDefaults a cada vez que uma requisição é feita.

@@06
Adicionando token nas rotas necessárias

Na aula sobre JWT, discutimos o uso do nosso token de autenticação e entendemos ser necessário passar este token via cabeçalho de uma requisição, acompanhado pela palavra-chave bearer antes.
Quais requisições exigem autenticação?
Vamos então analisar quais rotas requerem que a pessoa usuária esteja autenticada, no arquivo WebService.

Não é necessário que a pessoa usuária esteja autenticada para visualizar todos os especialistas, então não realizaremos nenhuma modificação na função getAllSpecialists(). O mesmo se aplica ao download de imagens, que não está relacionado à nossa API, na função downloadImage(). .

No entanto, para marcar uma consulta (função scheduleAppointment()), é necessário que a pessoa usuária esteja autenticada. Isso também se aplica para acessar todas as consultas de um paciente (getAllAppointmentsFromPatient()), reagendar uma consulta (rescheduleAppointment()) e cancelar uma consulta (cancelAppointment()).

Para registrar um paciente (registerPatient() ) ou realizar o login de um paciente (loginPatient()), a autenticação não é necessária — afinal, essas rotas retornam o token.

Você pode estar se perguntando: como podemos determinar quais rotas requerem autenticação? Vamos testar algo no Insomnia para ilustrar isso.

Voltando ao Insomnia, vamos clicar em "GET Todos os pacientes" na aba esquerda e copiar o ID de um paciente retornado por essa rota, na aba direita da tela. Por exemplo, o do Lucas:

"id": "701c4af8-068d-4eef-b98a-31267ff4aa6a"
COPIAR CÓDIGO
Em seguida, vamos na rota "GET Consultas de um paciente". Na URL, substituiremos o ID do paciente (/id) pelo código que copiamos:

GET localhost:3000/paciente/701c4af8-068d-4eef-b98a-31267ff4aa6a/consultas
COPIAR CÓDIGO
Ao enviar a solicitação, clicando em "Send", o servidor me retorna um erro: "Falha ao autenticar o token'". Isso aconteceu porque não passamos nenhum token de autenticação. Portanto, essa rota não pode ser acessada sem autenticação.

Precisamos, então, modificar nossas requisições para incluir o token no cabeçalho.

Verificando token nas rotas
Voltando ao Xcode, começaremos verificando a existência do token na função scheduleAppointment, logo após a url. Ou seja, vamos verificar se ele está armazenado no UserDefaults. Isso porque, quando recuperamos uma informação do UserDefaults, recebemos um opcional.

Vamos adicionar o seguinte trecho de código:

WebService
guard let token = UserDefaultsHelper.get(for: "token") else {
    print("Token não informado")
    return nil
}
COPIAR CÓDIGO
Agora, vamos adicionar isso ao cabeçalho da nossa requisição. Logo após o request.setValue, escreveremos request.addValue(), porque agora estamos adicionando um valor.

Esse valor será passado numa string com a palavra-chave Bearer antes, para que se identifique ser um token de autenticação. Então, essa string terá essa palavra e uma interpolação da variável token, resultando em "bearer \(token)". O segundo parâmetro, forHTTPHeaderField, receberá `"Authorization".

var request = URLRequest(url:url)
// código omitido
request.addValue("bearer \(token)", forHTTPHeaderField: "Authorization")
COPIAR CÓDIGO
Isso é tudo que precisamos fazer para recuperar o token e enviá-lo no cabeçalho para uma requisição.

Vamos repetir esse processo para todas as demais requisições que exigem autenticação. Podemos copiar a linha request.addValue() para usá-la em outros lugares.

Na função getAllAppointmentsFromPatient, faremos o mesmo. Antes da url, adicionaremos o guard let token:

guard let token = UserDefaultsHelper.get(for: "token") else {
    print("Token não informado")
    return nil
}
COPIAR CÓDIGO
No entanto, temos um problema com a função getAllAppointmentsFromPatient: não estamos usando o URLRequest. Como é uma requisição GET, fizemos isso de uma forma padrão, então precisamos alterar isso.

Então, após a url, criaremos um request do tipo "GET" e, ao fim, passar o request.addValue que copiamos:

var request = URLRequest(url: url)
request.httpMethod = "GET"
request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
COPIAR CÓDIGO
Na linha 131, onde chamamos a URLSession, precisamos alterar o data(from: url), porque não estamos mais passando a URL, mas sim a request. Portanto, deverá ser data(for: request):

let (data, _) = try await URLSession.shared.data(for: request)
COPIAR CÓDIGO
Isto deverá funcionar sem problemas agora.

Vamos fazer o procedimento semelhante na função scheduleAppointment. Após url:

guard let token = UserDefaultsHelper.get(for: "token") else {
    print("Token não informado")
    return nil
}
COPIAR CÓDIGO
Dentro da request, após setValue, adicionaremos o addValue:

request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
COPIAR CÓDIGO
Agora, vamos para a última requisição que precisa do token: função cancelAppointment(). Após a url: vamos usar guard let token = UserDefaultsHelper.get(for: "token") para tentar recuperar o token do usuário, caso contrário, vamos imprimir "Token não informado" e retornar false (não podemos retornar nil por ser um retorno booleano):

guard let token = UserDefaultsHelper.get(for: "token") else {
    print("Token não informado!")
    return false
}
COPIAR CÓDIGO
Após a recuperação do token, precisamos adicionar o mesmo addValue ao nosso request, após o setValue(), para adicionar o token:

request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
COPIAR CÓDIGO
Com isso, nós já adaptamos todas as rotas que precisam de um token de autenticação! No entanto, há mais um problema que precisamos consertar neste arquivo deWerbService.

Recuperando o ID do paciente
Ainda temos o ID do paciente de forma totalmente estática através da variável patientID. Vamos corrigir isso eliminando a variável, executando o aplicativo e adaptando nosso código de acordo com os erros que aparecerão.

Para o primeiro erro que ocorre, na MyAppointmentsView(), antes de do {} dentro da função getAllAppointments(), faremos o seguinte:

guard let patientID = UserDefaultsHelper.get(for: "patient-id") else {
    return
}
COPIAR CÓDIGO
No código acima, estamos recuperando o ID do paciente armazenado no UserDefaults. Caso não seja possível, não imprimimos nada e apenas retornamos para sair da função.

Em seguida, faremos uma correção similar para o erro que aparece no agendamento da consulta, ou seja, na função scheduleAppointment(), logo antes do do {}:

guard let patientID = UserDefaultsHelper.get(for: "patient-id") else {
    return
}
COPIAR CÓDIGO
Depois de corrigir os erros, podemos testar nosso aplicativo no simulador.

Conseguimos agendar uma consulta com sucesso, o que significa que deu tudo certo com o token! Além disso, conseguimos conferir a consulta marcada na aba 'Minhas Consultas'.

Tudo parece estar funcionando corretamente. Estamos passando o token para as rotas conforme necessário.

Agora precisamos implementar a funcionalidade de logout para que a pessoa usuária possa finalizar a sessão.

@@07
Realizando o logout de um usuário

Para realizar o logout de um usuário, vamos começar adicionando um botão no canto superior direito da nossa HomeView. Este botão conterá um ícone e também um texto de logout, para que a pessoa usuária consiga finalizar sua sessão.
Aparência do botão de Logout
Vamos construir este botão com o toolbar e o ToolbarItem, para os quais temos conteúdo sobre aqui na Alura.

Na HomeView, desceremos até o final do código. Logo após o .onAppear, vamos colocar um ponto e começar escrevendo o modificador toolbar seguido por abrir e fechar chaves {}. Dentro deste toolbar, vamos escrever ToolbarItem para criar um item, abrir parênteses () e selecionar a opção do placement e do content.

O placement é o lugar onde estará posicionado este botão. Se colocarmos um ponto como seu valor, podemos conferir algumas opções. A opção que queremos é a navigationBarTrailing, mas é avisado que essa será opção depreciada em uma futura versão da iOS. Então, temos que utilizar o topBarTrailing.

No content, daremos dar um "Enter". Teremos:

HomeView
.toolbar {
        ToolbarItem(placement: ToolbarTrailing) {
            code
        }
}
COPIAR CÓDIGO
Dentro dessas últimas chaves, no lugar de code, vamos criar um botão utilizando Button, com os parâmetros action e label.

A action, por enquanto, deixaremos no comentário. Na label, vamos criar um contêiner horizontal para colocar o ícone e o texto. Então, HStack, abrimos parênteses () para vou definir o espaço (spacing) entre os elementos com 2 para ficarem bem próximos um do outro.

Depois, abrimos e fechamos chaves {}. Dentro delas, colocamos uma imagem usando Image() com o parâmetro systemName para pegar no sf-symbols. Para isso, vamos inserir uma string "rectangle.portrait.and.arrow.right", o ícone mais similar ao ícone de logout (retângulo vertical com uma seta para a direita).

Depois da imagem, colocamos um Text(), que será "Logout". Teremos:

.toolbar {
    ToolbarItem(placement: .topBarTrailing) {
        Button(action: {
            //
        }) {
            HStack(spacing: 2) {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                Text("Logout")
            }
        }
    }
}
COPIAR CÓDIGO
Vamos verificar se está funcionando com "Command + R". Temos o botão de logout no canto superior direito da nossa tela!

tela de  boas-vindas do aplicativo da VollMed no simulador. no canto superior direito da tela, um ícone de retângulo vertical vazado com uma seta apontando para a direita e o nome "Logout".

Ação do botão de Logout
Para entender como funciona a requisição de logout, vamos abrir o Insomnia. A requisição "Logout" é do tipo POST e não envia nada com JSON, mas precisamos passar o token de autenticação.

Já tínhamos realizado o login de um usuário anteriormente. Vamos clicar na requisição de login, enviá-la novamente clicando em "Send" e copiar o token gerado:

{
    "auth": true,
    "id": "701c4af0-068d-4eef-b98a-31267ff4aa6a",
    "token":
    "eyJhbGc101JIUZI1NiIsInR5cC161kpXVCJ9.eyJpZCI6IjcwMWM0YWYWLTA 20GQINGVLZ1110ThhLTMxMjY3ZmYBYWE2YSIsIm1hdCI6MTY5NDcxMDc10Cwi ZXhwIjoxNzI2MjQ2NzU4fQ.XTBJAq8wRPYnkPIqBQmqsTLXHCMGB30Hd3H- }
    tB91qR
}
COPIAR CÓDIGO
Agora, vamos clicar na requisição "POST logout". Na opção "Bearer", logo abaixo da URL, é onde inserimos o token no Insomnia. No campo de texto "Token", colamos o token que acabamos de copiar.

Em seguida, clicamos em "Send" para enviar a requisição de Logout e ele retorna uma resposta com status code de 200, indicando que a resposta foi bem-sucedida, com auth como falso e token como nulo:

{ 
    "auth": false,
    "token": null
}
COPIAR CÓDIGO
Vamos começar construindo essa função no nosso arquivo WebService. retornando ao Xcode. Antes da função loginPatient, vamos escrever func logoutPatient. Essa função não precisa receber nenhum parâmetro específico, pois não precisamos mandar nada para a requisição, e o token pegamos do nosso UsersDefault.

O retorno será um async throws, e vamos simplesmente delimitar que é um booleano, porque faremos o mesmo de quando cancelamos uma consulta. Na hora em que cancelamos, verificamos o status code. Se foi 200, se deu tudo certo ou não, então, retornaremos true ou false baseado nisso.

WebService
func logoutPatient() async throws -> Bool {

}
COPIAR CÓDIGO
Não vamos criar um modelo de dados só para receber as informações de logout, que são auth: false e token: null. Simplesmente vamos retornar true se a requisição for bem-sucedida, ou retornar false caso não seja bem-sucedida.

Então, começamos com o endpoint: let endpoint é igual a baseURL + "/auth/logout", que é a nossa rota.

func logoutPatient() async throws -> Bool {
    let endpoint = baseURL + "/auth/logout"
}
COPIAR CÓDIGO
Depois, declaramos guard let url = URL(), passando a string, o endpoint. Depois de um else, imprimimos o erro com print("Erro na URL") e retornamos false:

guard let url = URL(string: endpoint) else {
    print("Erro na URL!")
    return false
}
COPIAR CÓDIGO
Agora, vamos pegar o token com guard let token = UserDefaultsHelper.get(for: "token"), caso contrário, imprimimos print("Token não informado") e retornamos false:

guard let token = UserDefaultsHelper.get(for: "token") else {
        print("Token não informado!")
        return false
}
COPIAR CÓDIGO
Não estamos enviando nada por esta requisição, mas é preciso especificar que o tipo desta requisição também é um POST.

Para isso, criaremos uma variável request igual a URLRequest, passando a url. Depois, request.httpMethod igual a POST.

Por fim, request.addValue para adicionar o token, passando um "Bearer", interpolando a variável token com barra invertida e parênteses. No parâmetro forHTTPHeaderField, passamos a chave "Authorization":

var request = URLRequest(url: url)
request.httpMethod = "POST"
request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
COPIAR CÓDIGO
Agora, vamos enviar a requisição chamando o URLSession. Então, dentro do let (), como não vamos utilizar o data, colocaremos um underline. Mas vamos utilizar o response, que é igual a try await URLSession.shared.data(for: request).

let (_, response) = try await URLSession.shared.data(for: request)
COPIAR CÓDIGO
Por fim, faremos a verificação do status code: if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200. Então, damos um return true e, caso contrário, um return false.

if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
        return true
}

return false
COPIAR CÓDIGO
Pronto, já temos a requisição de logout criada!

Chamando a função de logout
Vamos voltar na HomeView, porque precisamos chamar essa função. Subindo no meu arquivo, criaremos uma função logo abaixo de getSpecialists() chamada logout(), que será assíncrona.

HomeView
func logout() async {

} 
COPIAR CÓDIGO
Onde vamos chamar essa função? Quando a pessoa usuária clicar no botão que acabamos de criar no ToolbarItem.

Dentro da action (ação) desse botão, vamos chamar o Task, nosso contexto assíncrono, e await logout().

.toolbar {
        ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                        Task {
                                await logout()
                        }
                }, label: {
                        HStack(spacing: 2) {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                Text("Logout")
                        }
                })
        }
}
COPIAR CÓDIGO
Dentro da função logout(), vamos começar a fazer o do/catch. No catch, daremos um print("Ocorreu um erro no logout: \(error)").

Já no do, faremos um let logoutSuccessful = try await Service.logoutPatient. Faremos, em seguida, uma verificação: if logoutSuccessful, vamos remover do UserDefaults o token e o ID do paciente. Então, UserDefaultsHelper.remove(for: "token") e também UserDefaultsHelper.remove(for: "patient-id").

func logout() async {
        do {
                let logoutSuccessful = try await service.logoutPatient()
                if logoutSuccessful {
                        UserDefaultsHelper.remove(for: "token")
                        UserDefaultsHelper.remove(for: "patient-id")
                }
        } catch {
                print("Ocorreu um erro no logout: \(error)")
        }
}
COPIAR CÓDIGO
Você pode estar pensando: "poderíamos fazer esse if try await direto sem precisar criar uma variável". É verdade. Mas, vamos manter essa variável para deixar tudo mais descritivo.

Agora, vamos executar a aplicação e verificar ver se deu tudo certo.

No simulador, clicamos em "Logout" no canto superior direito da tela. Voltamos para a tela de login! Isso significa que o logout foi realizado com sucesso.

Por que isso acontece? Porque estamos removendo a chave token do UserDefaults. Então, a propriedade especial @AppStorage, que está definida na ContentView, irá detectar essa mudança e recarregar essa view, fazendo, então, com que ela navegue para a tela de login.

Agora temos um login totalmente funcional e precisamos começar a discutir um pouco mais sobre boas práticas de segurança da nossa aplicação.

Por isso, nos encontramos no próximo vídeo.

@@08
Token de autenticação

Durante a construção do sistema de autenticação do Vollmed, precisamos oferecer a possibilidade do usuário se deslogar do aplicativo.
Como podemos fazer isso em relação ao token de autenticação?

Utilizando o header "Authentication" com o valor "Token (token)".
 
Falso! Não se utiliza o cabeçalho "Authentication" com o valor "Token (token)" para incluir o token de autenticação.
Alternativa correta
Utilizando o header "Authorization" com o valor "Bearer (token)".
 
Isso mesmo! No método logoutPatient, é visível a linha request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization"), indicando que o token é incluído no header "Authorization" com o prefixo "Bearer ".
Alternativa correta
Adicionando o token diretamente ao corpo da requisição HTTP.
 
O token de autenticação não é adicionado ao corpo da requisição quando se deseja fazer logout. Em vez disso, ele é adicionado ao cabeçalho da requisição.
Alternativa correta
O token não é necessário para realizar o logout, então não é incluído na requisição.
 
Ainda não! O token é necessário para fazer logout e é incluído na requisição.

@@09
Para saber mais: expiração do token

A expiração do token refere-se ao período de tempo que um token de autenticação permanece válido. Uma vez gerado, esse token tem uma "data de validade", após a qual ele não é mais aceito pelo sistema para fins de autenticação ou autorização.
Por que os tokens possuem essa expiração?
A razão principal é segurança. Tokens podem ser interceptados ou roubados; ao limitar a sua validade, você limita o tempo em que um ator mal-intencionado pode abusar dele. Além disso, a expiração ajuda a garantir que os usuários retornem periodicamente para reautenticar e, potencialmente, revalidar suas permissões.

E de quanto tempo é a validade do token no nosso caso?
Na API que foi construída para utilização deste projeto, os tokens possuem uma validade de 1 ano.

Note que 1 ano é um período consideravelmente longo para a validade de um token, a maioria das aplicações no mundo real não possuem um token com validade tão longa. Entretanto, por fins didáticos, preferimos manter desta forma.

E como lidar com a expiração do token?
Monitoramento ativo: Uma prática comum em aplicações é monitorar ativamente a validade do token no lado do cliente. Quando um token está prestes a expirar, ou assim que ele expira, o sistema pode:
a. Solicitar reautenticação: Simplesmente peça ao usuário para fazer login novamente.

b. Renovar automaticamente com refresh tokens: Muitos sistemas utilizam o que é chamado de "refresh token". Este é um token secundário que é emitido juntamente com o token principal e tem a capacidade de solicitar um novo token sem que o usuário precise fazer login novamente. Entretanto, a nossa API não possui tal funcionalidade.

Trate exceções de tokens expirados: No lado do servidor, sempre que um token expirado for recebido, uma resposta específica (geralmente com o status 401 - Unauthorized) deve ser enviada. O lado do cliente deve ser capaz de interpretar essa resposta e agir de acordo - seja solicitando ao usuário para fazer login novamente ou usando um refresh token para obter um novo token de acesso.
Feedback ao usuário: Se um token estiver expirado e uma ação requer autenticação, informe o usuário de forma clara e direta sobre a necessidade de se autenticar novamente.
Concluindo, a expiração do token é um mecanismo que aprimora a segurança e a integridade do processo de autenticação. Lidar com tokens expirados requer monitoramento ativo, comunicação clara ao usuário e estratégias como a utilização de refresh tokens para oferecer uma boa experiência ao usuário enquanto mantém o sistema seguro.

@@10
Faça como eu fiz: salvando token de autenticação e utilizando-o nas rotas

Vamos implementar, então, a parte do token! Siga as instruções:
1 - Salvar, ler e remover dados do UserDefaults:

a) Defina o UserDefaultsHelper para armazenar e recuperar informações (como token e ID) do paciente no UserDefaults. Além disso, remover também.
        struct UserDefaultsHelper {
            ...
        }
COPIAR CÓDIGO
2 - Salvando o token e o ID do paciente após o login:

a) Depois de chamar o método de login, armazene o token e o ID do paciente usando o helper.
        func login() async {
            ...
            UserDefaultsHelper.save(value: response.token, key: "token")
            UserDefaultsHelper.save(value: response.id, key: "patient-id")
            ...
        }
COPIAR CÓDIGO
3 - Verificando o status de login:

a) Use @AppStorage para observar o token e verificar se ele está presente;
b) Baseado no token, defina a tela que deve ser mostrada para o usuário (tela de login ou tela inicial).
        @AppStorage("token") var token: String = ""
        
        if token.isEmpty {
            NavigationStack {
                SignInView()
            }
        } else {
          TabView {
              ...
          }
        }
COPIAR CÓDIGO
4 - Adicionando token nas requisições:

a) Antes de fazer requisições que precisam de autenticação, recupere o token e adicione-o ao header da requisição.
        guard let token = UserDefaultsHelper.get(for: "token") else {
            ...
        }
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
COPIAR CÓDIGO
5 - Recuperando o ID do paciente:

a) Nas requisições que o ID do paciente é necessário, obtenha-o do UserDefaultsHelper.
        guard let patientID = UserDefaultsHelper.get(for: "patient-id") else {
            return
        }
COPIAR CÓDIGO
6 - Realizando o logout:

a) Implemente a função logoutPatient que chama uma rota de logout e, se for bem-sucedido, remove o token e o ID do paciente do UserDefaults.
        func logoutPatient() async throws -> Bool {
            ...
            if logoutSuccessful {
                UserDefaultsHelper.remove(for: "token")
                UserDefaultsHelper.remove(for: "patient-id")
            }
        }
COPIAR CÓDIGO
7 - Botão de logout:

a) Adicione um botão na barra de ferramentas que, ao ser pressionado, chama a função de logout.
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    Task {
                        await logout()
                    }
                }, label: {
                    ...
                })
            }
        }


Nesta aula, abordamos um aspecto importante no desenvolvimento de aplicativos - a gestão de autenticação. O manejo seguro e eficaz do token de autenticação é essencial para a experiência do usuário e para a segurança da aplicação.
Mergulhamos em como usar o UserDefaults para armazenar e recuperar informações vitais, bem como como implementar o fluxo de login/logout para garantir que os usuários tenham acesso apenas ao que devem.

Explore o progresso do projeto no GitHub.

A medida que você continua a construir, tenha em mente a importância da segurança do usuário. Sempre esteja aberto a aprendizado e melhoria. E como sempre, estamos aqui para ajudar no fórum ou no discord!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-04

@@11
O que aprendemos?

Nesta aula, você aprendeu a:
Salvar o token de autenticação e ID do paciente usando UserDefaults;
Verificar se um usuário está devidamente autenticado no aplicativo;
Incluir o token nas rotas que necessitam de autenticação;
Implementar a funcionalidade de logout para um usuário.
Agora já temos uma aplicação totalmente funcional!

Vamos fazer os últimos retoques na aula a seguir.

#### 16/04/2024

@05-Boas práticas de segurança

@@01
Projeto da aula anterior

Você pode revisar o seu código e acompanhar o passo a passo do desenvolvimento do nosso projeto através desta branch no Github e, se preferir, pode baixar o projeto da aula anterior.
Bons estudos!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-04

https://github.com/alura-cursos/swiftui-vollmed-authentication/archive/refs/heads/aula-04.zip

@@02
Conhecendo o Keychain

Até o momento, estávamos utilizando o UserDefaults para armazenar o token de autenticação e também o ID do paciente.
Entretanto, o UserDefaults não é a melhor opção quando estamos tratando de dados sensíveis, como tokens de autenticação, porque é muito fácil ter acesso a esse token com o UserDefaults, já que ele não é criptografado.
Portanto, as informações ficam armazenadas como texto aberto e são de fácil acesso. Isso não é uma boa prática.

Uma vez que você tem o token de autenticação, você pode obter informações sensíveis do usuário através desse token. Portanto, usar o UserDefaults para armazenar esse tipo de dado não é recomendado.

Quando falamos de informações sensíveis, como senhas, chaves secretas e tokens de autenticação, é mais adequado armazená-las em um lugar chamado Keychain, um serviço de segurança do iOS, que é criptografado e muito mais seguro.

Agora, será preciso fazer uma modificação na nossa aplicação, pois vamos migrar do uso do UserDefaults para o Keychain, salvando o token de autenticação e o ID do paciente.

Dados sensíveis com Keychain
Antes de partir para o código, vamos fazer uma analogia do UserDefaults com o Keychain. Imagine que você esteja armazenando suas joias. Você as armazenaria em uma caixa transparente, bem ao meio da sala, ou em um cofre de alta segurança? Podemos comparar o UserDefaults à caixa transparente e o Keychain ao cofre de alta segurança.

Pois, quando falamos de token de autenticação, imagine que o token seja como a chave para sua casa. Se essa chave for armazenada debaixo do tapete de entrada, qualquer pessoa que tiver acesso a chave debaixo do tapete conseguirá acessar sua casa de forma simples.

Portanto, o UserDefaults é específico para guardar informações que não são sensíveis, como preferências, configurações da pessoa usuária, de uma maneira persistente. Já o Keychain é mais seguro para armazenar essas informações sensíveis.
Como estamos lidando com informações sensíveis, vamos utilizar o Keychain.

Agora, falando sobre o código, já podemos adiantar que a implementação nativa do Keychain é complexa. É daquele tipo de código que exige uma atenção constante na documentação, muita pesquisa na internet e, muitas vezes, é um copia e cola.

Existem algumas bibliotecas que facilitam esse processo, mas quisemos apresentar a forma nativa. Porém, como mencionamos que é um código complicado de ser escrito, já trouxemos esse código pronto.

Criamos um arquivo chamado KeychainHelper dentro da pasta "Services". Esse arquivo possui as mesmas funções que definimos no UserDefaultsHelper. Portanto, temos uma função estática para salvar um valor para uma determinada chave, porque o Keychain também funciona da mesma maneira do UserDefaults. Temos um valor para uma respectiva chave.

KeychainHelper.swift:
struct KeychainHelper {
    static func save(value: String, key: String) {
        guard let data = value.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

// código omitido…
}
COPIAR CÓDIGO
Portanto, temos essa função save() para salvar, que basicamente converte o valor (value), que é uma string, em um objeto do tipo data, utilizando o padrão de codificação UTF-8. Nesta função, é criado um query que é dicionário com alguns atributos, como a chave (key) e também o valor, convertido em data.

No final, a linha SecItemDelete() assegura que, se já existir um valor associado a uma chave, ele removerá esse valor e, por fim, adiciona a query com chave e valor no Keychain.

static func get(for key: String) -> String? {
        let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecReturnData as String: kCFBooleanTrue!,
                kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
                if let data = dataTypeRef as? Data {
                        return String(data: data, encoding: .utf8)
                }
        }
        return nil
}
COPIAR CÓDIGO
Também temos a função get(), que basicamente recupera um valor do Keychain. E, se ele não encontrar nenhum valor correspondente à chave, retorna um nil, ou seja, uma string opcional.

static func remove(for key: String) {
        let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
}
COPIAR CÓDIGO
E, finalmente, temos a função remove(), que remove algo do Keychain.

Substituindo UserDefaultsHelper por KeychainHelper
Com o arquivo já criado, o que precisamos fazer? Precisamos modificar de onde estamos utilizando o UserDefaultsHelper em nossa aplicação para o KeychainHelper.

Para isso, no canto superior esquerdo, vamos clicar no ícone de lupa, que representa a barra de pesquisa. Nesta barra, pesquisaremos por UserDefaultsHelper para verificar onde estamos utilizando essa instrução e assim realizar a mudança para Keychain.

Identificamos que o utilizamos na tela de login. Na função login(), trocaremos ambos UserDefaultsHelper para KeychainHelper. Não é necessário fazer mais nada, pois as funções são as mesmas, como mencionamos anteriormente, a função de salvar, obter algo e também de remover.

É uma boa prática passar o nome de nossas chaves, como, por exemplo, app-vollmed-token. Essa será uma identificação de qual aplicativo está utilizando essa chave. Faremos o mesmo para o patient-id, portanto, app-vollmed-patient-id.

SignInView.swift:
func login() async {
        do {
                if let response = try await service.loginPatient(email: email, password: password) {
                        KeychainHelper.save(value: response.token, key: "app-vollmed-token")
                        KeychainHelper.save(value: response.id, key: "app-vollmed-patient-id")
                } else {
                        showAlert = true
                }
        } catch {
                showAlert = true
                print("Ocorreu um erro no login: \(error)")
        }
}
COPIAR CÓDIGO
Vamos para o próximo arquivo, MyAppointmentsView, onde está sendo utilizada a variável patientID. Na função getAllAppointments(), mudaremos para KeychainHelper e a chave será app-vollmed-patient-id.

MyAppointmentsView.swift:
func getAllAppointments() async {
        guard let patientID = KeychainHelper.get(for: "app-vollmed-patient-id") else {
                return
        }

        // código omitido…
}
COPIAR CÓDIGO
No arquivo ScheduleAppointmentsView, substituiremos UserDefaultHelper por KeychainHelper, mantendo a chave app-vollmed-patient-id.

ScheduleAppointmentsView.swift:
func scheduleAppointment() async {
        guard let patientID = KeychainHelper.get(for: "app-vollmed-patient-id") else {
                return
        }

        // código omitido…
}
COPIAR CÓDIGO
Chegamos no arquivo HomeView, onde também precisamos realizar a troca na parte de logout. Portanto, dentro da função logout(), teremos dois KeychainHelper.remove(). Em vez da chave token, utilizaremos app-vollmed-token e app-vollmed-patient-id.

HomeView.swift:
func logout() async {
        do {
                let logoutSuccessful = try await service.logoutPatient()
                if logoutSuccessful {
                        KeychainHelper.remove(for: "app-vollmed-token")
                        KeychainHelper.remove(for: "app-vollmed-patient-id")
                }
        } catch {
                print("Ocorreu um erro no logout: \(error)")
        }
}
COPIAR CÓDIGO
Agora temos o WebService. Vamos substituir na função scheduleAppointment() novamente para KeychainHelper e app-vollmed-token.

WebService.swift:
func scheduleAppointment(specialistID: String,
                                                 patientID: String,
                                                 date: String) async throws -> ScheduleAppointmentResponse? {
        // código omitido…

        guard let token = KeychainHelper.get(for: "app-vollmed-token") else {
                print("Token não informado!")
                return nil
        }

        // código omitido…
}
COPIAR CÓDIGO
Faremos as mesmas substituições nas funções getAllAppointmentsFromPatient(), rescheduleAppointment(), cancelAppointment() e, por fim, em logoutPatient() também.

Próximo passo
Com isso, concluímos a adaptação de UserDefaults para Keychain. Agora, vamos testar nossa aplicação, executando com o "Command + R". Quando o simulador abrir, vamos tentar entrar na conta do Lucas.

Ao informar o e-mail e a senha, não recebemos um alerta de erro. Isso significa que o login foi realizado com sucesso, embora não tenha sido direcionado para a tela inicial. Por que isso está acontecendo?

No arquivo ContentView, estávamos utilizando a propriedade @AppStorage. Entretanto, essa propriedade funciona apenas com UserDefaults e não com Keychain. Portanto, nossa tela não está sendo atualizada para entrar na condição if, para verificar se o token é nulo ou não, se o token está salvo ou não.

Portanto, precisamos fazer algumas modificações. Precisamos pensar em uma nova lógica para quando a pessoa usuária entrar na aplicação e o token for salvo com sucesso no Keychain. O programa precisa receber essa modificação e, então, direcionar a pessoa usuária para a tela inicial.

Nos encontramos no próximo vídeo para começar essa implementação.

@@03
Preparando o ambiente: código do KeychainHelper

É importante que você siga as instruções deste “preparando o ambiente” para prosseguir com seus estudos. Vamos lá?
Durante o vídeo, comentei sobre o Keychain e como precisamos adicionar esse código no nosso projeto.

Vamos ao código!
Para facilitar o uso do Keychain, trouxemos uma implementação simplificada chamada KeychainHelper. Isso abstrai a complexidade da API nativa e fornece uma interface mais amigável para salvar, recuperar e remover informações do Keychain.

import Foundation

struct KeychainHelper {
    static func save(value: String, key: String) {
        guard let data = value.data(using: .utf8) else { return }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    static func get(for key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            if let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }

    static func remove(for key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
COPIAR CÓDIGO
Passo a passo:
Integre o KeychainHelper em seu projeto.
Modifique qualquer implementação anterior que usava UserDefaults para armazenar informações sensíveis e substitua pelo uso do KeychainHelper.
Teste as funcionalidades de salvar, recuperar e remover informações do Keychain usando o KeychainHelper.
E o que é Keychain?
O Keychain é uma ferramenta de gerenciamento de segurança disponibilizada pela Apple para dispositivos iOS, macOS, watchOS e tvOS. Ele permite que os desenvolvedores armazenem informações sensíveis, como senhas, chaves de criptografia e tokens de autenticação, de maneira segura.

As informações salvas no Keychain são criptografadas e podem ser acessadas apenas por aplicativos autorizados. Isso faz do Keychain uma escolha preferencial para armazenar informações que não devem ser facilmente acessadas ou visíveis para usuários ou outros aplicativos.

Embora o conceito do Keychain seja simples, sua implementação nativa no iOS é relativamente complicada.

Recomenda-se sempre revisar a documentação oficial ao trabalhar com o Keychain. Isso ajudará você a entender todas as capacidades disponíveis e a evitar erros comuns.

Conclusão
Sempre priorize a segurança em seu aplicativo, especialmente ao lidar com informações sensíveis. O Keychain é uma ótima ferramenta para isso. Lembre-se, a segurança não é apenas uma camada adicionada no final do desenvolvimento, mas uma consideração contínua em todo o ciclo de vida do desenvolvimento do aplicativo.

@@04
Para saber mais: entendendo o código do Keychain e conhecendo bibliotecas

Vamos entender passo a passo do que está acontecendo no código de implementação do Keychain, que vimos durante esta aula.
Função de salvar dados
static func save(value: String, key: String) {
    guard let data = value.data(using: .utf8) else { return }

    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key,
        kSecValueData as String: data
    ]

    SecItemDelete(query as CFDictionary)
    SecItemAdd(query as CFDictionary, nil)
}
COPIAR CÓDIGO
No código acima, estamos definindo uma função save que tem a finalidade de salvar dados no Keychain. Ela é static, o que significa que você pode chamar esta função sem criar uma instância da estrutura. Ela aceita dois parâmetros: o value que é o valor que você deseja salvar e a key que é a chave associada a esse valor.

Nessa função, tentamos converter a String do valor para um tipo Data usando a codificação utf8. Se a conversão falhar, a função irá retornar e não executar o código subsequente.

Então, criamos um dicionário chamado query que descreve os atributos do item que queremos salvar no Keychain.

O kSecClass especifica a "classe" do item que você está querendo adicionar, buscar ou modificar no Keychain. O Keychain suporta vários tipos diferentes de itens, e o kSecClass ajuda a categorizar esses itens. Os valores possíveis para kSecClass incluem:

kSecClassGenericPassword: Representa um item de senha genérica.
kSecClassInternetPassword: Representa um item de senha para recursos da Internet, como senhas FTP ou HTTP.
kSecClassCertificate: Representa um item de certificado.
kSecClassKey: Representa uma chave criptográfica (poderíamos usar este para o token também).
kSecClassIdentity: Representa uma identidade, que é uma combinação de chave privada e certificado.
Já o kSecAttrAccount é um dos muitos atributos que você pode definir para um item do Keychain. Especificamente, kSecAttrAccount é usado para armazenar o "nome da conta" para um item. Por exemplo, se você estiver armazenando uma senha para um e-mail, o endereço de e-mail poderia ser o valor do kSecAttrAccount, enquanto a senha seria armazenada como o valor do item em si.

Em termos mais simples, kSecAttrAccount é geralmente usado como uma "chave" ou "identificador" para o item que você está armazenando, ajudando você a buscá-lo mais tarde.

A função save usa a chave fornecida como valor para kSecAttrAccount para identificar unicamente o item que está sendo salvo. Da mesma forma, as funções get e remove usam essa chave para buscar e remover o item apropriado, respectivamente.

E então, kSecValueData é usada para especificar os dados reais ou o conteúdo que você deseja armazenar no Keychain. No contexto dos tokens, kSecValueData seria o valor do token em si.

Por fim, o código tenta deletar qualquer item existente no Keychain com a mesma chave. Em seguida, adiciona o novo item com a chave e valor fornecidos.

Função de recuperar dados
static func get(for key: String) -> String? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key,
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]

    var dataTypeRef: AnyObject?
    let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

    if status == errSecSuccess {
        if let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8)
        }
    }
    return nil
}
COPIAR CÓDIGO
Esta é uma função para recuperar um valor associado a uma chave do Keychain.

Assim como na função save, estamos definindo um query para descrever o item que queremos buscar.

Usamos a função SecItemCopyMatching para buscar um item no Keychain que corresponda à nossa query. O resultado é armazenado em dataTypeRef.

Se a busca foi bem-sucedida (status == errSecSuccess), tentamos converter o resultado em Data e depois em String. Se qualquer parte falhar, retornamos nil.

Função para remover dados
static func remove(for key: String) {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: key
    ]
    SecItemDelete(query as CFDictionary)
}
COPIAR CÓDIGO
Esta função remove um item associado à chave fornecida do Keychain.

Novamente, definimos uma query para descrever o item que queremos remover. E então, chamamos a função SecItemDelete para remover o item do Keychain.

Conhecendo bibliotecas
Existem bibliotecas (dependências) de terceiros que abstraem todo o código de implementação do Keychain, fornecendo uma interface muito mais amigável para nós, desenvolvedores, não nos preocuparmos com a implementação por baixo dos panos.

Alguns exemplos de dependências constituem em:

KeychainSwift;
KeychainAccess.
Essas bibliotecas simplificam o processo de interação com o Keychain, permitindo um desenvolvimento mais rápido e menos propenso a erros. Ao usar essas abstrações, você pode focar no que realmente importa para o aplicativo, sem se perder nos detalhes da implementação do Keychain.

Ambas as bibliotecas são amplamente usadas pela comunidade de desenvolvedores iOS e são bem documentadas. No entanto, antes de escolher qualquer biblioteca, é sempre uma boa ideia avaliar o projeto em termos de requisitos e verificar qual delas se adapta melhor ao escopo do aplicativo. Também é importante manter-se atualizado sobre qualquer atualização de segurança ou mudanças no Keychain fornecidas pela Apple, para garantir que seu aplicativo permaneça seguro e funcional.

@@05
UserDefaults ou Keychain?

Imagine que estamos desenvolvendo um aplicativo de gerenciamento de finanças pessoais. Dentro do aplicativo, queremos armazenar informações sobre as categorias de gastos favoritos do usuário, bem como o token de autenticação para manter o usuário conectado.
Com base neste cenário e considerando o Keychain e UserDefaults, analise as seguintes afirmações. Selecione as que são verdadeiras:

firmações. Selecione as que são verdadeiras:

Alternativa correta
Se quiséssemos implementar uma funcionalidade em que os usuários pudessem trocar temas (como modo escuro ou claro), o armazenamento dessas preferências no Keychain seria a abordagem mais adequada.
 
Alternativa correta
Se o nosso aplicativo armazenasse informações de contas bancárias do usuário, como números de conta, seria ideal usar UserDefaults.
 
Alternativa correta
Para armazenar as categorias de gastos favoritos do usuário, é apropriado usar o Keychain, pois essa é uma informação altamente sensível.
 
Alternativa correta
Dada a necessidade de manter o usuário conectado, o nosso aplicativo deve armazenar o token de autenticação no Keychain.
 
Isso mesmo! Tokens de autenticação são dados sensíveis e o Keychain oferece a camada extra de segurança necessária para armazená-los.
Alternativa correta
Ao armazenar o token de autenticação no Keychain, vamos demorar mais e precisaremos lidar com uma complexidade maior do que armazenar preferências de usuário no UserDefaults.
 
Correto! Devido à criptografia e às camadas adicionais de segurança, trabalhar com o Keychain é mais complexo em comparação com UserDefaults.

@@06
Criando um AuthenticationManager

Agora precisamos pensar em uma solução para conectar o token que está sendo salvo no Keychain com o ID do paciente e também com a nossa ContentView para realizar a mudança de telas necessárias, de acordo com a condicional.
Porque o @AppStorage não funciona mais, ele só funciona com o UserDefaults. Para fazer essa conexão, precisaremos conhecer algumas propriedades especiais do SwiftUI, os chamados property wrappers.

Contudo, antes disso, vamos pensar em uma solução: podemos criar uma classe chamada AuthenticationManager. Essencialmente, essa classe conterá todas as responsabilidades envolvendo autenticação, como, por exemplo, salvar e remover token e salvar e remover o ID do paciente.

Dessa forma, temos uma camada de abstração. Isso é relevante, pois, por exemplo, se acessamos SignInView, na função login(), estamos chamando diretamente os métodos do KeychainHelper. Portanto, essa classe de abstração vai nos ajudar a atribuir melhor as responsabilidades da nossa aplicação.

Authentication Manager
Na pasta raiz do projeto, vamos criar uma nova pasta, clicando com o botão direito e selecionando "New Group". Vamos chamá-la de "Managers". Dentro dessa pasta "Managers", vamos criar um novo arquivo swift, e chamá-lo de AuthenticationManager.

Vamos começar definindo uma classe AuthenticationManager e logo entenderão o motivo do uso de class em vez de strict. Dentro dessa classe, vamos definir duas propriedades, o token e o patientID, que serão opcionais, porque pode ter um token salvo ou não.

No corpo da classe, definimos var token que é do tipo String? e var patientID que também é do tipo String?.

Agora, vamos criar um construtor que será utilizado para inicializar as nossas variáveis. Basta escrever init() e, dentro, self.token que será igual ao que pegamos do keychain, ou seja, KeychainHelper.get(), passando for e a chave do token, app-vollmed-token.

Faremos o mesmo para o patientID. Isto é, self.patientID igual à KeychainHelper.get(for: "app-vollmed-patient-id").

AuthenticationManager.swift:
import Foundation

class AuthenticationManager {
        var token: String?
        var patientID: String?

        init() {
                self.token = KeychainHelper.get(for: "app-vollmed-token")
                self.patientID = KeychainHelper.get(for: "app-vollmed-patient-id")
        }
}
COPIAR CÓDIGO
Posteriormente, criaremos nossos métodos. Vamos criar uma função func chamada saveToken(), passando o valor do token. Para isso, escrevemos o parâmetro token que é do tipo String.

Dentro desta função, chamaremos o método save do KeychainHelper. Para isso, escrevemos KeychainHelper.save(), indicando que value será o token que passamos como parâmetro e key será app-vollmed-token. Essa função é específica para salvar apenas o token, por isso, passamos a chave diretamente.

Agora atualizaremos nossa variável token que está definida dentro dessa classe. Então, self.token é igual a token.

func saveToken(token: String) {
        KeychainHelper.save(value: token, key: "app-vollmed-token")
        self.token = token
}
COPIAR CÓDIGO
Em seguida, criaremos uma função para remover o token. Essa função removeToken() não recebe nenhum parâmetro, porque só vamos utilizar a chave.

Dentro dela, escrevemos KeychainHelper.remove(), passando for e a chave app-vollmed-token. Então, vamos definir self.token igual à nil já que o removemos do Keychain.

func removeToken() {
        KeychainHelper.remove(for: "app-vollmed-token")
        self.token = nil
}
COPIAR CÓDIGO
Agora faremos o mesmo para o ID do paciente. Também estamos salvando o ID do paciente no Keychain, porque se tivéssemos um acesso fácil à informação do ID do paciente, poderíamos obter informações sensíveis desse paciente também. Por isso, estamos tratando essa dado como uma informação sensível.

Vamos criar uma func savePatientID(), passando o parâmetro id que é do tipo String. No corpo, escrevemos KeychainHelper.save(), sendo value o parâmetro id e key o app-vollmed-patient-id.

Depois, digitamos self.patientID igual à id que recebemos como parâmetro.

func savePatientID(id: String) {
        KeychainHelper.save(value: id, key: "app-vollmed-patient-id")
        self.patientID = id
}
COPIAR CÓDIGO
Agora, vamos fazer a função de remover, a func removePatientID(). Não vamos passar nenhum parâmetro porque só precisamos da chave. Então, KeychainHelper.remove(), passando a chave app-vollmed-patient-id. Também vamos atualizar a variável self.patientID para nil.

func removePatientID() {
        KeychainHelper.remove(for: "app-vollmed-patient-id")
        DispatchQueue.main.async {
                self.patientID = nil
        }
}
COPIAR CÓDIGO
Portanto, já temos as funções criadas.

@@07
Utilizando as propriedades especiais @ObservedObject e @Published

Agora, vamos conhecer as duas novas Property Wrappers no SwiftUI.
Property Wrappers
A primeira é chamada de @Published. Essa Property Wrapper é utilizada antes dos atributos definidos em uma classe.

Essa Property Wrapper significa que essas variáveis serão monitoradas por uma view, uma tela que esteja observando a classe em questão. Vamos entender melhor na prática.

Em AuthenticationManager, adicionaremos antes das minhas variáveis token e patientID, um @Published. As duas variáveis serão então monitoradas, quer dizer que elas serão publicadas, por assim dizer.

AuthenticationManager.swift:
class AuthenticationManage {
    @Published var token: String?
    @Published var patientID: String?

    // código omitido…
}
COPIAR CÓDIGO
A próxima etapa é instanciar a classe AuthenticationManager na ContentView. Desta forma, retornarei à ContentView e definiremos o var authManager igual à AuthenticationManager(). Observe que também removemos a linha @AppStorage, já que nós não vamos utilizá-la.

Entretanto, para que as propriedades token e patientID sejam monitoradas, é necessário definir que a classe AuthenticationManager está sendo observada pela struct ContentView, ou seja, a view. Fazemos isso através de outra Property Wrapper chamada @ObservedObject.

Desse modo, antes do var authManager, colocaremos um @ObservedObject.

ContentView.swift:
struct ContentView: View {

    @ObservedObject var authManager = AuthenticationManager()

// código omitido…
}
COPIAR CÓDIGO
Isso significa que a struct ContentView está observando a classe AuthenticationManager. E na classe AuthenticationManager, nós temos essas duas propriedades marcadas como @Published. Quando alguma alteração for realizada nelas, então vai notificar a view que está observando essa classe.

No entanto, ao retornar à ContentView, foi gerado um erro. Qual é o erro? Ele informa que a struct ObservedObject precisa que a classe AuthenticationManager se adapte ao protocolo ObservableObject.

Portanto, retornaremos ao AuthenticationManager e logo após o meu class AuthenticationManager, adicionamos dois-pontos e ObservableObject. E isso só pode ser feito em classes e não em structs.

AuthenticationManager.swift:
class AuthenticationManage: ObservableObject {
    // código omitido…
}
COPIAR CÓDIGO
Agora ao voltar para ContentView, outro erro será emitido, pois ele informa "cannot find 'token' in scope", ou seja, ele não consegue achar a variável token pois removemos @AppStorage.

Sendo assim, vamos modificar essa verificação. Vamos apagar esse if e escrever if authManager.token == nil. Estamos fazendo uma verificação se o token é nil, porque se for nil, significa que não tem nada salvo no Keychain, portanto, ele vai navegar para a tela de login.

ContentView.swift:
if authManager.token == nil {
        NavigationStack {
                SignInView()
        }
 }
COPIAR CÓDIGO
O próximo passo é ir para a tela de login, no arquivo SignInView. É preciso substituir o KeychainHelper.save() para utilizar a classe AuthenticationManager.

Logo após o @State private var showAlert, vamos criar uma instância dessa AuthenticationManager. Isto é, @ObservableObject para observar a classe seguido de var authManager igual à AuthenticationManager(). Ao invés de utilizar o KeychainHelper.save(), vamos utilizar o authManager.

Devemos apagar as linhas 23 e 24 onde temos KeychainHelper. No lugar, escreveremos authManager.saveToken passando o token que é o response.token. Faremos o mesmo para o patientID, ou seja, authManager.savePatientID(), passando o response.id.

SignInView.swift:
struct SignInView: View {

        @State private var email: String = ""
        @State private var password: String = ""
        @State private var showAlert: Bool = false

        @ObservableObject var authManager = AuthenticationManager()

        let service = WebService()

        func login() async {
                do {
                        if let response = try await service.loginPatient(email: email, password: password) {
                                authManager.saveToken(token: response.token)
                                authManager.savePatientID(id: response.id)
                        } else {
                                showAlert = true
                        }
                } catch {
                        showAlert = true
                        print("Ocorreu um erro no login: \(error)")
                }
        }

// código omitido…
}
COPIAR CÓDIGO
Para verificar se tudo está funcionando, executaremos a aplicação com "Command + R". Inicialmente, estamos logados, porém ao clicar em logout, não funciona. Isso acontece porque ainda estamos usando o Keychain e ainda não implementemos a classe AuthenticationManager nesse arquivo.

Por isso, vamos voltar na tela inicial do simulador e apagar o aplicativo. Basta clicar e segurar no ícone do aplicativo até aparecer a opção "Remove App". Em seguida, executaremos novamente. Agora, a tela de login aparece.

Vamos inserir o e-mail e a senha para verificar se somos levados para a tela inicial. Ao clicar em "Entrar", não foi exibido o erro de login, mas também não houve nenhuma ação. E por que isso aconteceu?

O problema é que ao retornar à nossa ContentView, estamos instanciando a classe AuthenticationManager. Enquanto na SignInView, também estamos instanciando a nossa classe AuthenticationManager. Portanto, temos duas instâncias completamente diferentes que não se comunicam entre si.

Quando salvamos o token e o ID do paciente na nossa tela de login, em SignInView, a nossa ContentView não está recebendo essas informações porque é uma instância diferente. Sendo assim, precisamos pensar em uma solução para que elas compartilhem a mesma instância e, assim, as modificações poderão ser atualizadas com sucesso.

Desta forma, a ContentView conseguirá obter essa modificação feita na tela de login, por exemplo. É precisamente por essa razão que precisamos conhecer um padrão de projeto chamado Singleton. No entanto, deixaremos essa discussão para o próximo vídeo.

@@08
Compreendendo o @ObservedObject e @Published

Imagine que estamos desenvolvendo um aplicativo chamado "TaskList" em SwiftUI, que permite aos usuários criar, editar e excluir tarefas. Há duas telas no aplicativo:
A tela principal que exibe a lista de tarefas;
A tela de edição onde as tarefas podem ser modificadas.
Neste caso, estamos usando @ObservedObject e @Published para gerenciar e refletir as mudanças no aplicativo.

Analise as afirmações a seguir sobre a implementação de "TaskList". Selecione as que são verdadeiras:

Na tela de edição, quando o usuário edita uma tarefa, as alterações são refletidas automaticamente na lista de tarefas na tela principal, graças ao @Published.
 
Correto! Se uma propriedade da tarefa for anotada com @Published, qualquer alteração nessa propriedade notificará as visualizações observadoras sobre a mudança.
Alternativa correta
Como a tela principal está constantemente sendo alterada e editada pela pessoa usuária, precisamos inserir um @ObservedObject para observar as alterações na lista de tarefas que aparecem nessa tela.
 
Faz sentido! A tela principal precisa reagir às mudanças na lista de tarefas. Para isso, @ObservedObject seria usado para observar uma instância que conforma o protocolo ObservableObject.
Alternativa correta
Precisamos criar o modelo de tarefa do aplicativo como uma struct (estrutura), pois a anotação @Published não pode ser usada dentro de classes.
 
Alternativa correta
Para garantir que os dados do usuário não se percam quando ele fechar o aplicativo, precisamos aplicar o @ObservedObject , que permitirá salvar as informações automaticamente.

@@09
Conhecendo o padrão de projeto Singleton

Singleton é um padrão de projeto que garante que nossa classe tenha uma instância única, ou seja, um único ponto de acesso. Esse padrão não permite que outras classes ou structs instanciem nossa classe.
Por isso, vamos aplicar esse padrão de projeto Singleton na AuthenticationManager, para compartilhar instâncias na aplicação.

Padrão de projeto Singleton
Para garantir que tenhamos apenas uma única instância e que nenhuma outra classe ou struct consiga instanciar a AuthenticationManager, precisamos prevenir isto no init(). Portanto, na linha 14, quando estamos definindo meu construtor, devemos adicionar a palavra-chave private antes. Isso significa que ninguém consegue instanciar essa classe.

Em seguida, precisamos compartilhar essa instância única. Como faremos isso? Antes das variáveis na linha 11, vamos escrever static, que será uma propriedade estática, let, que será uma constante. Definiremos essa constante como shared, que significa compartilhado.

E o que será essa shared? Será igual à instância de AuthenticationManager(). Essa será a única instância da nossa classe. Portanto, quando outra classe, ou outra struct, for acessar a AuthenticationManager, ela vai acessar por esta propriedade shared. Ela não vai conseguir instanciar a classe.

AuthenticationManager.swift:
class AuthenticationManager: ObservableObject {

        static let shared = AuthenticationManager()

        @Published var token: String?
        @Published var patientID: String?

        private init() {
                self.token = KeychainHelper.get(for: "app-vollmed-token")
                self.patientID = KeychainHelper.get(for: "app-vollmed-patient-id")
        }

    // código omitido…
}
COPIAR CÓDIGO
Vale lembrar, que esta palavra-chave, private, que temos antes do construtor, previne que outras classes e structs instanciem a AuthenticationManager. Mas a própria classe pode ter uma instância de AuthenticationManager. Esse private é apenas para classes e structs externas a este arquivo.

Com o shared, conseguimos compartilhar uma única instância entre todas as views da aplicação. Este é o padrão Singleton.
Agora, iremos em ContentView e, já aparece um erro em var authManager na linha 12, porque ele afirma que o inicializador é inacessível porque utilizamos a palavra-chave private. Portanto, não podemos mais instanciar esta classe. Então, vamos remover os parênteses de AuthenticationManager e colocar um .shared.

ContentView.swift:
@ObservedObject var authManager = AuthenticationManager.shared
COPIAR CÓDIGO
Agora, temos acesso a esta instância da classe, porque a instância está sendo definida dentro da classe AuthenticationManager, mas não estamos instanciando ela de uma forma direta. Estamos compartilhando essa instância. Isso ficará mais claro ao decorrer do projeto.

Vamos manter o @ObservedObject, porque precisamos que ele observe a classe. Portanto, não é preciso fazer mais nenhuma modificação.

Agora, vamos à SignInView, onde faremos outras modificações. Nesse caso, não é preciso utilizar o @ObservedObject na linha 16. Podemos removê-lo porque é a ContentView que precisa receber a informação da atualização - e não a SignInView.

A SignInView não precisa receber a informação de quando o token é atualizado ou removido, por exemplo. É apenas a ContentView, porque é ela que vai fazer todo o remanejamento das telas. Portanto, podemos apagar o @ObservedObject antes de var authManager.

Novamente, não conseguimos instanciar a AuthenticationManager. Então, vamos apagar os parênteses e colocar um .shared.

SignInView.swift:
var authManager = AuthenticationManager.shared
COPIAR CÓDIGO
Agora, vamos executar e verificar se está funcionando. Vamos pressionar "Command + R" para abrir o emulador na tela de login. Vamos tentar logar com o e-mail do Lucas, lucas@gmail.com, e senha 12345. O aplicativo foi para a tela de boas-vindas. Conseguimos realizar esta navegação!

Substituindo KeychainHelper por AuthenticationManager
Agora, precisamos implementar este AuthenticationManager em todos os lugares que ainda estamos utilizando daquele KeychainHelper, como, por exemplo, na função de logout().

Vamos à HomeView, que é onde esta função de logout() está implementada. Vamos usar a propriedade AuthenticationManager.shared. Logo após a minha variável let service, vamos criar um var authManager, que é igual a AuthenticationManager.shared.

Nos locais onde estamos utilizando o KeychainHelper, vamos deletar e substituir por authManager.removeToken() e authManager.removePatientID().

HomeView.swift:
var authManager = AuthenticationManager.shared

// código omitido…

func logout() async {
        do {
                let logoutSuccessful = try await service.logoutPatient()
                if logoutSuccessful {
                        authManager.removeToken()
                        authManager.removePatientID()
                }
        } catch {
                print("Ocorreu um erro no logout: \(error)")
        }
}
COPIAR CÓDIGO
Onde mais estamos utilizando o KeychainHelper? Podemos pesquisar. Clicando na barra de pesquisa, no canto superior esquerdo, procuramos por KeychainHelper. Estamos utilizando no Webservice, na ScheduleAppointmentView e na MyAppointmentsView.

Começaremos com o MyAppointmentsView. Vamos precisar criar o AuthenticationManager.shared, ou seja, var authManager = AuthenticationManager.shared.

Vamos deletar o KeychainHelper.get() e manter o guard let patientID que será igual à authManager.patientID. Como este é um opcional, então else return para que ele retorne à função caso ocorra algum erro ao obter o ID do paciente.

MyAppointmentsView.swift:
var authManager = AuthenticationManager.shared

// código omitido…

func getAllAppointments() async {
        guard let patientID = authManager.patientID else {
                return
        }
        // código omitido…
}
COPIAR CÓDIGO
Copiaremos essa expressão guard let patientID, ou seja, "Comand + C" da linha 18 até a linha 20, porque vamos precisar utilizá-la também na ScheduleAppointmentView. Vamos colá-la na função scheduleAppointment(). E também é preciso criar a variável authManager, logo após o let service.

ScheduleAppointmentView.swift:
var authManager = AuthenticationManager.shared

// código omitido…

func scheduleAppointment() async {
        guard let patientID = authManager.patientID else {
                return
        }
        // código omitido…
}
COPIAR CÓDIGO
Agora precisamos modificar todos os KeychainHelper do WebService, onde estamos obtendo o token. O princípio é o mesmo do ID do paciente. É preciso definir authManager = authenticationManager.shared, logo após o private let.

Na função logoutPatient(), em vez de KeychainHelper.get, vamos definir guard let token = authManager.token. O else vai exibir print("Token não informado!") e fazer o return como falso.

WebService.swift:
var authManager = AuthenticationManager.shared

func logoutPatient() async throws -> Bool {
        let endpoint = baseURL + "/auth/logout"

        guard let url = URL(string: endpoint) else {
                print("Erro na URL!")
                return false
        }

        guard let token = authManager.token else {
                print("Token não informado!")
                return false
        }

        // código omitido…
}
COPIAR CÓDIGO
Vamos copiar essa instrução de guard let token, da linha 23 até a 26, e vamos colar em todas as rotas onde precisamos do token. Ou seja, vamos colar nas funções cancelAppointment(), rescheduleAppointment() e getAllAppointmentsFromPatient() e scheduleAppointment().

Note que em rescheduleAppointment(), getAllAppointmentsFromPatient() e scheduleAppointment() o return não é falso. Na verdade, é return nil.

Confira o arquivo WebService.swift completo.
Vamos testar, iniciando a aplicação com "Command + R". Como estamos logados, vamos tentar fazer o logout da aplicação. Somos redirecionados para a tela de login.

Vamos fazer o login novamente, apenas para garantir que tudo está funcionando como esperado. Entramos na tela de boas-vindas e também todas as requisições estão funcionando conforme esperado.

Portanto, temos todo o fluxo da aplicação funcionando de maneira adequada e agora utilizando o Keychain, que é uma prática muito mais segura para armazenar informações sensíveis.

@@10
Para saber mais: atualizando propriedades @Published na thread principal com SwiftUI

Se você executar a sua aplicação neste momento, pode se deparar com um aviso no console:
Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates. Em livre tradução: “Publicar mudanças a partir de threads em segundo plano não é permitido; certifique-se de publicar valores a partir da thread principal (através de operadores como receive(on:)) nas atualizações do modelo.”
No desenvolvimento de aplicativos iOS, é essencial entender a importância dos threads e como eles afetam a atualização da interface do usuário. Ao trabalhar com SwiftUI e propriedades @Published, você encontra o aviso acima sobre a tentativa de atualizar a interface do usuário a partir de um thread que não seja o principal.

Entendendo o problema
Os aplicativos iOS têm um "thread principal" que é responsável por atualizar a interface do usuário e responder às interações do usuário. Qualquer modificação da interface do usuário deve acontecer neste thread. Se tentarmos fazer alterações na interface do usuário a partir de um thread de background, isso pode levar a comportamentos indesejados ou até mesmo ao travamento do aplicativo.

Em SwiftUI, quando uma propriedade marcada com @Published é alterada, ela notifica a interface do usuário para se atualizar. Se essa propriedade for alterada em um thread de background, isso é equivalente a tentar atualizar a interface do usuário a partir desse thread, o que não é permitido.

Solução
Para resolver isso, você deve garantir que as alterações na propriedade @Published sejam feitas no thread principal. Isso pode ser conseguido usando o DispatchQueue.main.async.

Portanto, precisamos modificar as linhas de código, na classe AuthenticationManager, em que modicamos as propriedades marcadas como @Published. Veja a solução abaixo:

func saveToken(token: String) {
    KeychainHelper.save(value: token, key: "app-vollmed-token")
    DispatchQueue.main.async {
        self.token = token
    }
}

func removeToken() {
    KeychainHelper.remove(for: "app-vollmed-token")
    DispatchQueue.main.async {
        self.token = nil
    }
}

func savePatientID(id: String) {
    KeychainHelper.save(value: id, key: "app-vollmed-patient-id")
    DispatchQueue.main.async {
        self.patientID = id
    }
}

func removePatientID() {
    KeychainHelper.remove(for: "app-vollmed-patient-id")
    DispatchQueue.main.async {
        self.patientID = nil
    }
}
COPIAR CÓDIGO
Portanto, ao trabalhar com SwiftUI, é vital garantir que todas as atualizações da interface do usuário ocorram no thread principal. Usando DispatchQueue.main.async, você pode garantir que as alterações sejam feitas de forma segura e evitar potenciais problemas ou avisos em sua aplicação.

@@11
Para saber mais: padrão de projeto Singleton

O que é Singleton?
Imagine que você tem uma sala especial em sua casa, onde apenas uma pessoa pode entrar de cada vez e, uma vez dentro, essa pessoa tem acesso exclusivo a recursos especiais. Agora, independentemente de quem entra na sala, eles sempre verão as mesmas coisas que a última pessoa deixou lá. Este é o princípio básico do padrão Singleton: é como ter uma sala especial que sempre tem o mesmo estado para todos que a acessam.

Singleton é um padrão de projeto que garante que uma determinada classe tenha apenas uma instância e forneça um ponto global para acessar essa instância. Assim, fornecemos um único ponto de acesso para a classe.

Por que utilizar do Singleton?
Controle de acesso único: Às vezes, queremos ter certeza de que uma classe tem apenas uma instância. Por exemplo, você pode ter um gerenciador de configurações e quer garantir que haja apenas um conjunto de configurações em toda a aplicação.
Economia de recursos: Se sabemos que não precisamos de múltiplas instâncias, por que gastar memória e recursos criando várias? Singleton pode ser uma solução mais eficiente em termos de recursos.
Estado global compartilhado: Em alguns casos, pode ser benéfico ter um estado compartilhado que várias partes do código podem consultar. Singleton oferece uma maneira de fazer isso.
Onde é utilizado?
O padrão Singleton é comumente usado em situações onde uma única instância de uma classe deve ser usada por vários clientes. Alguns exemplos comuns incluem:

Gerenciadores de configuração: Para armazenar e recuperar configurações em toda a aplicação.
Configuração de conexões: Onde as conexões com um banco de dados são reutilizadas, por exemplo.
Logs: Para manter um único arquivo de log ou ferramenta de logging.
Gerenciadores de cache: Para armazenar e reutilizar dados frequentemente acessados.
Como implementar?
Aqui está um exemplo simples de como criar um Singleton em Swift:

class Singleton {
    static let sharedInstance = Singleton()
    
    private init() { 
        // construtor privado garante que ninguém
        // pode criar uma nova instância desta classe
    }
    
    func someFunction() {
        // Alguma lógica aqui...
    }
}

// Uso:
let instance = Singleton.sharedInstance
instance.someFunction()
COPIAR CÓDIGO
O construtor privado garante que ninguém fora da classe pode instanciar um novo objeto.

Considerações
Enquanto Singleton pode ser um padrão poderoso, ele deve ser usado com cautela. Ter muitos singletons ou usar o padrão inapropriadamente pode levar a problemas, como tornar o código difícil de testar ou introduzir estados globais que tornam o sistema complexo e difícil de entender.

Conclusão
O padrão Singleton é uma ferramenta útil para garantir uma única instância de uma classe e fornecer um acesso global a ela. No entanto, como todas as ferramentas, é importante usá-la corretamente e apenas quando apropriado.

@@12
Faça como eu fiz: criando um AuthenticationManager como camada de abstração

Vamos colocar em prática os nossos conhecimentos sobre as novas propriedades especiais e o padrão de projeto Singleton!
1 - Conhecendo o Keychain:

a) O Keychain é uma área segura onde você pode salvar informações sensíveis, como senhas e tokens. Isso é mais seguro do que o UserDefaults, que é um armazenamento mais simples e menos protegido.
b) A estrutura KeychainHelper auxilia nas operações do Keychain.
c) Troque o uso do UserDefaultsHelper para KeychainHelper em todos os lugares que utilize do UserDefaultsHelper.
        struct KeychainHelper {
            ...
        }
COPIAR CÓDIGO
2 - Criando um AuthenticationManager:

a) Para gerenciar informações de autenticação (como token e ID do paciente), crie um AuthenticationManager.
        class AuthenticationManager {
            ...
        }
COPIAR CÓDIGO
3 - Utilizando @ObservedObject e @Published:

a) Usando ObservableObject e @Published, permitimos que as views observem as mudanças nas propriedades de um objeto.
b) Quando uma propriedade @Published é modificada, a view é notificada e se atualiza.
        @ObservedObject var authManager = AuthenticationManager()
        
        class AuthenticationManager: ObservableObject {
            @Published var token: String?
            @Published var patientID: String?
        }
COPIAR CÓDIGO
4 - Implementando o padrão Singleton:

a) O padrão Singleton garante que uma classe tenha apenas uma instância e fornece um ponto de acesso a essa instância.
b) Isso é útil para o AuthenticationManager, já que queremos garantir que todas as partes do aplicativo estejam olhando para a “mesma fonte de verdade” quando se trata de autenticação.
        class AuthenticationManager: ObservableObject {
            static let shared = AuthenticationManager()
            ...
            private init() {
                ...
            }
        }
        
        var authManager = AuthenticationManager.shared
COPIAR CÓDIGO
c) Troque de KeychainHelper para authManager em todos os lugares que utilizem do KeychainHelper.

Nesta aula, abordamos técnicas cruciais de segurança e design de software.
Keychain: Uma escolha sábia para armazenar informações sensíveis, em vez de UserDefaults. No mundo real, usar o Keychain para armazenar tokens ou credenciais é uma prática recomendada.
AuthenticationManager: Centralizar a lógica e o estado de autenticação em uma classe torna seu código mais limpo e mais fácil de gerenciar.
Singleton: A capacidade de uma classe poder ter apenas uma única instância nos ajudará a lidar com a lógica de autenticação.
Sempre considere a segurança como uma prioridade ao projetar e desenvolver aplicativos, especialmente quando lidar com informações sensíveis.

Explore o progresso do projeto no GitHub aqui.

Lembre-se, ao abordar a autenticação, mantenha a simplicidade sem sacrificar a segurança. Se você tiver dúvidas ou feedback, estamos aqui para ajudar no fórum ou no discord!

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/aula-05

@@13
Projeto final

Você pode baixar ou acessar o código fonte do projeto final. Aproveite para explorá-lo e revisar pontos importantes do curso.
Bons estudos!

https://github.com/alura-cursos/swiftui-vollmed-authentication/archive/refs/heads/main.zip

https://github.com/alura-cursos/swiftui-vollmed-authentication/tree/main

@@14
O que aprendemos?

Nesta aula, você aprendeu a:
Conhecer o Keychain, uma ferramenta segura para armazenar informações sensíveis;
Construir um AuthenticationManager para centralizar lógicas de autenticação;
Utilizar as propriedades especiais @ObservedObject e @Published para monitorar mudanças de estado;
COnhecer o padrão de projeto Singleton e seus benefícios.
Priorizando sempre a segurança da aplicação, concluímos o nosso sistema de autenticação!

@@15
Recados finais

Parabéns, você chegou ao fim do nosso curso. Tenho certeza que esse mergulho foi de muito aprendizado.
Após os créditos finais do curso, você será redirecionado para uma tela na qual poderá deixar seu feedback e avaliação do curso. Sua opinião é muito importante para nós.

Aproveite para conhecer a nossa comunidade no Discord da Alura e se conectar com outras pessoas com quem pode conversar, aprender e aumentar seu networking.

Continue mergulhando com a gente.

https://discord.com/invite/QeBdgAjXnn

@@16
Conclusão

Queremos te parabenizar por ter concluído mais um curso de SwiftUI. Durante este curso, nós aprendemos sobre autenticação e como autenticar pessoas usuárias na nossa aplicação.
O que aprendemos?
Primeiro, criamos a tela de login com campos de texto, ou seja, aprofundamos nossos conhecimentos sobre o TextField. Também construímos uma tela de cadastro com vários campos de texto e com um componente chamado Picker, que permite a seleção em uma lista.

Tratando do aspecto da autenticação, entendemos como lidar com Token e como salvá-lo na nossa aplicação. Abordamos as duas formas, tanto com o UserDefaults quanto com o Keychain, que é uma prática muito mais segura.

Quando a pessoa usuária realiza o login na aplicação, inserindo e-mail e a senha, ela é redirecionada para a tela principal. Esta é a tela em que ela consegue visualizar especialistas, agendar uma consulta, remarcar e também cancelar. A pessoa usuária também consegue fazer o logout da aplicação e, assim, voltar para a tela de login.

Discutimos como podemos realizar esta comunicação com algo que está sendo salvo no Keychain com a nossa ContentView, através das property wrappers chamadas de @Published e também @ObservedObject.

Por fim, aprendemos um novo padrão de projeto chamado Singleton para compartilhar instâncias na nossa aplicação.

Comunidade
Estes conhecimentos são muito importantes porque autenticação é uma questão com a qual estamos sempre lidando em projetos reais, no mercado de trabalho.

Também queremos conferir a sua versão do projeto. Então, compartilhe conosco, nos marque nas redes sociais e compartilhe no Discord da Alura. Lá, você vai conhecer mais pessoas que estão fazendo esse curso ou que já o finalizaram.

Até a próxima!