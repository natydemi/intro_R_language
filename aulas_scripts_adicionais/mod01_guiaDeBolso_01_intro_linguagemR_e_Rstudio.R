
# Guia de Bolso - Introdução Linguagem R e RStudio

# Introdução
  # Neste script você irá encontrar uma revisão sobre o R, considerando a 
  # apresentação do ambiente RStudio, e aspectos estruturais da linguagem.
  # De maneira complementar (e opcional), são apresentados alguns recursos
  # mais avançados da linguagem.


# ----- Instalação -----

# Instalação R -----

  # Para instalar o R, o primeiro passo é entrar na página oficial do 
  # ‘The R Project for Statistical Computing’ (http://www.r-project.org/), 
  # e na sessão Downloads, opção CRAN, escolha o servidor do local mais 
  # próximo à sua região. Ou vá direto em: 
    # https://cloud.r-project.org
      # escolha o seu sistema operacional e o subdiretório “base” 
      # faça o download da versão mais recente do programa
      # abra o arquivo baixado, e siga as instruções da Assistente de Instalação 

  # Pronto! Tendo o R na sua máquina você pode acessa-lo via ícone na área de 
  # trabalho, busca do Windows, ou pelo executável que se encontra na pasta 
  # em que o R foi instalado.

  # Neste ambiente, via point-and-click, temos opções que vão desde mudanças de 
  # diretórios até a instalação de bibliotecas. 

  #Tutorial: https://livro.curso-r.com/1-1-instalacao-do-r.html


# Instalação RStudio -----

  # O R que baixamos na sessão anterior é um interpretador, e 
  # portanto, disponibiliza poucos recursos em termos de usabilidade. 
  # Como alternativa podemos trabalhar com Ambientes de Desenvolvimento Integrados, 
  # ou IDEs (Integrated Development Environment), como são mais conhecidas. 
  # A mais difundida no caso do R é a IDE RStudio:

  # Para fazer o download, entre na página de download do RStudio:
    #https://posit.co/download/rstudio-desktop/
  # e siga as instruções (caso já tenha instalado o R, 
  # você pode pular diretamente para o Step 2 da página)

  
# RStudio (Posit): muito mais que uma IDE ----- 

  #	RStudio não é apenas uma IDE, mas também uma empresa, uma 
  # organização que tem por objetivo ajudar cientistas a dar sentido para 
  # o mundo por meio de dados.

  # Em 2022, a RStudio passou a se chamar Posit (https://posit.co/), visando 
  # ampliar sua comunidade e poder de atuação. 

  # Seja como Posit, seja como Rstudio, existem MUITOS materiais interessantes
  # voltados para profissionais que trabalham com dados, vale visitar o site ;)


# Atualizando as versão do R e RStudio ----- 

  # Sobre updates: Atualizar a sua versão do R e do RStudio será importante 
  # para garantir que você tenha acesso aos recursos mais recentes. 
  # Sendo assim, seguem algumas dicas para: 
      # checar a versão do R: digite a função R.Version()
      # checar a versão do Rstudio: digite RStudio.Version()
      # fazer o update do Rstudio: 
        # acesse a barra de tarefas do: `RStudio> Help > Check for updates`
        # baixe a versão mais recente disponível no site
        # execute a instalação como se estivesse fazendo pela primeira vez
        # Pronto! O seu Rstudio está atualizado! 

  # Para fazer o update do R, você pode seguir a mesma dinâmica, mas 
  # baixando a versão mais atualizada do R. 
  
  # No caso do windowns, existe ainda a opção de fazer o update via bibliotecas 
  # como o installlr::updateR(). No caso do Mac, a biblioteca seria updateR.
  
  # ATENÇÃO: Ao atualizar o R, por default, você irá “perder” as bibliotecas 
  # que estiverem instaladas no seu computador, sendo necessário fazer a 
  # instalação destas novamente. Isto porque não há garantia que as bibliotecas 
  # funcionem com a nova versão do R – um comportamento usual para qualquer 
  # linguagem de programação. Para consultar a versão dos seus pacotes: 
  # sessionInfo()


# Alternativa às instalações físicas ----- 

  #De maneira alternativa à instalação você pode considerar o RStudio Cloud,
  # um serviço gratuito oferecido pelo RStudio que permite que os usuários R 
  # tenham acesso a todo o ambiente RStudio via web, de maneira on-line, 
  # inclusive permitindo colaboração, através do site :
  
  #https://posit.cloud/


# ----- Um tour pela IDE Rstudio  -----

  #O RStudio possui uma série de recursos que otimizam a análise de dados, 
  # sendo a própria interface, a principal vantagem, visto os seus paines:
  
  #*Console - painel onde os comandos são executados interativamente, 
  # permitindo opções como autocompletar e consultas por meio da tecla ‘Tab’, 
  # ou o acesso aos comandos já digitados via a tecla ‘Seta para cima’
  
  #*Source - onde são abertos os scripts do R, ou seja, onde você irá 
  # escrever o código - sendo necessário enviá-lo manualmente para o Console,
  # isto é, para execução, quando desejado. Para criar um script podemos  
  # utilizar o point-and-click ‘File > New File > R Script’ 
  # ou por meio do atalho Ctrl+Shift+N

    #*Environment - lista dos objetos carregados e/ou criados ao longo da sessão
    
    #*History - consulta do histórico de comandos
    
    #*Files - acesso às pastas e arquivos do computador
    
    #*Plots - visualização dos gráficos gerados
    
    #*Packages - gerenciamento das bibliotecas instaladas
    
    #*Help - menu de ajuda e visualização das documentações consultadas
    
    #*Viewer - visualização dos relatórios e aplicativos criados
    
    #*Connections - ferramentas para conexão com diferentes bancos de dados 
    
    #*Tutorial - tutoriais de aprendizado — disponível apenas em versões mais 
    # recentes da IDE RStudio


  #Todos os painéis possuem uma série de funcionalidades próprias, 
  # sendo interessante que, conforme avance na sua utilização do R, volte a 
  # explorar tais opções, como as abas Git e Jobs.
  
  #A mesma dica de investigação vale para a barra de ferramentas do RStudio, 
  # onde é possível encontrar desde recursos de codificação, como busca e 
  # substituição, desenvolvimento de pacotes, ou Debug de código. 
  
  #DICA: Um recurso interessante do RStudio é a personalização da interface: 
  # acesse na barra superior a opção  `Tools > Global Options’, dentre
  # as alternativas, recomendo a sessão `Appearance` e `Pane Layout`.




# ----- Programação R -----

# Organização dos scripts  -----
  
  #Textos precedidos por # são comentários (note a mudança na cor do texto),
  # vale comentar que a indentação no R não é um pré requisito, mas sim
  # uma boa prática, visto auxiliar na organização do código.
  
  #DICA: para comentar um bloco de códigos, ao invés de fazer o comentário 
  # linha a linha, você pode selecionar os comandos que você quer comentar 
  # e usar o atalho `ctrl + shift + c`
  
  #DICA: um recurso interessante do RStudio são as seções, ou sections.
  # Para conhecer digite: crtl + shift + R, e teste você mesmo! Você 
  # pode acessar tais seções na parte superior direita do script, 
  # ou na parte inferior esquerda.
  


# R como calculadora  -----

  #Operações
  #soma (o separador decimal no R é o ponto)
  1 + 1.5
  
  #subtração
  7 - 2 
  
  #divisão
  9 / 3  
  
  #multiplicação
  100 * 10 
  
  #potência (ponto e vírgula é equivalente a dar um enter entre linhas)
  2^4 ; 2**4  
  
  #resto da divisão de 10 por 3
  10 %% 3 
  
  #parte inteira da divisão de 10 por 3
  10 %/% 3  
  
  #O resultado foi precedido por `[1]`, o que faz referência à quantidade 
  # de elementos do resultado. Aqui vale comentar que os contadores/index no R  
  # são iniciados no `1`, e não no `0`, como ocorre em muitas outras linguagens. 
  
  #Podemos também escrever o código no Editor (Source/R Script), e enviá-lo  
  # para a execução no Console por meio do atalho ‘Ctrl + Enter’ ou
  # pelo botão ‘Run’ do RStudio.
  
  #Podemos ampliar as equações mantendo a notação básica de operações algébricas
  #equação ok
  (2 * ( 2 * ( 2 * (4-3))))
  
  #equação não ok, ou seja, este comando retornará um erro! 
  (2 * { 2 * [ 2 * (4-3)]})
  
  #DICA: note que o comando com o erro é precedido de um 'X' em vermelho 
  # no próprio script no RStudio 
  


# Operadores lógicos -----

  #Considerando operadores lógicos, tendo como saída TRUE ou FALSE, temos:
  
  #maior/menor
  1 < 0 
  1 > 0 
  
  #menor/maior ou igual
  1 <= 1 ; 1 >= 1 
  
  #igual/diferente (igual são com DOIS simbolos seguidos)
  1 == 1 
  1 != 1 
  
  #ATENÇÃO: ao digitarmos um comando incompleto no Console, o R mostrará  
  # o símbolo `+` para iniciar um novo comando. Para desconsiderar os comandos  
  # anteriores, ou seja, reiniciar o comando, basta pressionar a tecla ‘Esc’. 
  #exemplo de comando incompleto
  8 ==
    
    #Ao receber comandos desconhecidos, o R  retornará uma mensagem de erro
    #erro
    3 % 9
  
  #DICA: para resgatar algum comando já digitado no Console, você 
  # pode utilizar a tecla ‘seta para cima’. 
  


# Acessando Funções  -----
  
  #Uma função no R é um conjunto de instruções organizadas e parametrizadas,
  # visando a execução de uma tarefa.
  
  #No R, apenas com as funções builtins, podemos fazer desde gráficos e
  # cálculos aritméticos, até análises descritivas e aplicação de
  # modelos estatísticos (deixei alguns spoilers na última seção do script).
  
  #Para consultar a lista de funções default no R:
  builtins() 
  
  #Os nomes das funções no R são, em geral, intuitivos
  #aplicando a função exponencial ao número 1
  exp(1)
  
  #podemos ver o código da função ao digitar a função sem os parênteses
  exp
  
  #Uma das funções mais importantes no R é a função `help()`, 
  # ou o seu operador equivalente `?`, que nos permitem acessar o help
  # do objeto consultado, possibilidades de estilização, exemplos, etc
  ?log
  
  #por default o log é calculado na base exponencial
  log(10)
  
  #e o resultado não é alterado mesmo se explicitarmos o argumento 'base'
  log(10, base = exp(1))
  
  #mas podemos altera-lo, no caso, para qualquer número positivo:
  log(10, base = 10)
  
  #Note que não foi necessário especificar o nome do primeiro argumento da 
  # função em nenhum dos casos (`log(x=10)`).
  
  

# Criando objetos  -----
  
  #Objetos no R são elementos que podem ser armazenados em variáveis, 
  # como, por exemplo, dados ou funções. E podemos criar tais objetos 
  # utilizando os sinais de atribuição `<-`, `=` ou até `->`.
  
  #Os Objetos podem ser nomeados com letras, números, e os símbolos `.` e `_`.
  # importante comentar que o R é case sensitive, ou seja, letras maiúsculas  
  # e minúsculas são processadas como caracteres diferentes.
  
  #sintaxe: letras minúsculas
  objeto <- 1 #atribuição da direita para a esquerda (RECOMENDADO)
  
  #sintaxe: letras minúsculas com a primeira letra maiúscula
  Objeto =  2 #atribuição da direita para a esquerda
  
  #sintaxe: letras minúsculas, símbolo e número
  3 -> objeto_1 #atribuição da esquerda para a direita
  
  #Atribuição: a recomendação é trabalhar com `<-` para atribuição de objetos, 
  # `=` para a especificação de parâmetros de funções e evitar o `->`.
  
  #DICA: para inserir o símbolo `<-` podemos utilizar o atalho 'alt + -'.
  
  #Ao criar objetos, passamos a ter a informação que estes carregam 
  # salvos na memória e podemos chama-los posteriormente  
  sqrt(Objeto) 

# Manuseando objetos  -----
  
  #Podemos fazer operações entre elementos e objetos
  #atribuindo um elemento diretamente
  a <- 2; a
  
  #ao rodar o comando, note que o valor de a não é alterado
  a + 1 
  a
  
  #para que a mudança seja salva, precisamos reatribuir o valor
  a <- a + 1
  a
  
  #resultado de operações entre elementos
  b <- 5 + a ; b
  
  #excluindo o objeto a
  rm(a); a
  
  #operações entre outros objetos
  c <-  b * (-1); c
  
  #resultado da aplicação de funções
  d <- abs(c); d
  
  #Para listar todos os objetos disponíveis na sessão podemos utilizar 
  # a função `ls()`. Enquanto que para excluir algum destes objetos temos 
  # a função `rm(nome_do_objeto)`.
  
  # Regras para nomear objetos    
  #É possível trabalhar com objetos nomeados com sintaxes não padrão, 
  # sendo, porém, necessário adicionar aspas ao objeto:
  
  #definindo o objeto com sintaxe não padrão
  `1¨ objeto c/ $int@xe que $&ria #inva!ida for@ da$ a$pa$` <- 6 
  
  #aplicando-o em uma função (log na base 10)
  log10(`1¨ objeto c/ $int@xe que $&ria #inva!ida for@ da$ a$pa$`)
  
  #No R existem alguns nomes/termos reservados para representar casos 
  # especiais, são eles:
  
  #Not Available: constante lógica utilizada para representar dados faltantes.
  NA
  
  #Not a Number: objeto lógico representando indefinições matemáticas, 
  #como log de números negativos.
  NaN
  
  #Infinite: conceito matemático (positivo ou negativo).
  Inf; -Inf
  
  #Null object: representa a ausência de informação, utilizada como 
  #retorno de funções cujos valores são indefinidos.
  NULL
  
  #Visto a relevância de tais objetos, estes não podem ser reescritos. 
  #Diferentemente de outras constantes
  NA <- 0
  
  pi
  pi <- 0
  pi
  
  #Um tipo de objeto particularmente importante para quem trabalha com dados, 
  # são as base de dados, vamos tomar como exemplo uma das bases default do R
  mtcars
  
  #para que esta base apareça como um objeto na aba "Environment" 
  # podemos considerar:
  
  mtcars <- mtcars


# ----- > TÓPICOS AVANÇADOS -----
# Um pouco mais sobre a linguagem R ----- 
  #A partir daqui serão apresentados alguns recursos da linguagem R.
  # Não será algo que utilizaremos de maneira direta no curso, 
  # mas que serão cruciais 

# Estruturas de controle -----
  #Estruturas de controle são blocos de programação, baseados em  
  # parâmetros pré-definidos, que definem a direção a seguir. 
  #O R possui todas as estruturas usualmente existentes em linguagens de 
  # programação, e neste script vamos listar alguns dos principais. 
  
  #Primeiramente vamos listar os principais operadores lógicos disponíveis:
  
  #O console retorna TRUE (T) ou FALSE (F) se:
  x != y #diferente que: para a negação de um elemento apenas `!x`
  x | y #ou: retornando T/F para cada elemento das comparações
  x || y #ou, retornando apenas um T/F (1ª comparação à esquerda do vetor)
  x & y #e, retornando T/F para cada elemento das comparações
  x && y #e, retornando apenas um T/F (1ª comparação à esquerda do vetor)
  x %in% y #se os elementos à esquerda, um a um, estão contidos à direita
  
  #Além das funções `any()` e `all()`, úteis no caso de vetores lógicos
  
  #Considerando fluxos condicionais e de repetição:
  
  #if: se a declaração feita entre parênteses for verdade, então 
  # os comandos dentro das chaves `{}` serão executados: 
  x <- 0
  
  if(x != 0){
    print(x+1)
  }
  
  #
  
  if(x != 0){
    print(x+1)
  } else{print("não faça nada")}
  
  
  #if-else: similar ao comando `if()`, porém seguido de um segundo bloco, 
  # que será avaliado se, e somente se, o resultado do primeiro bloco 
  # for `FALSE`: 
  x <- 15
  
  if (x<=10) {
    print("x é menor ou igual a 10")
  } else if (x>10 & x<20) {
    print("x está entre 10 e 20")
  } else{
    print("x é maior ou igual a 20")
  }
  
  #ifelse: uma versão mais simples do if-else, em que especificamos 
  # ambas as ações como parâmetro de uma função:
  x <- "olar"
  ifelse(x == "olar", "flor.do.campo", "xovens")
  
  
  #for: uma sequência de instruções que são repetidas com cada um dos elementos especificados:
  x <- 1:3
  
  for(i in x){
    print(i)
  }
  
  # DICA: Podemos não utilizar as chaves caso as instruções sejam dadas 
  # em uma única linha, após o `for`:
  x <- 1:3
  
  for(i in x) print(i)
  
  
  #nested loops: de modo similar ao anterior temos o caso dos loops aninhados:
  x <- 1:2; y <- c(1,10)
  
  for(i in seq(x)){
    for(j in seq(y)) print(x[i]*y[j])
  }
  
  #while: repetição de um bloco de comandos até que certa condição não seja mais satisfeita:
  i <- 1
  while (i<=6){
    print(i*i)
    i = i+1
  }
  
  #além dos comandos citados, existem ainda funções como: 
  #`break()`, que pode ser utilizada para interromper um loop e dar 
  # continuidade ao fluxo, ou next()` que descontinua uma interação 
  # particular, e pula para a próxima. 
  

# Criando suas próprias funções -----
  #Estes recursos vão te permitir garantir que, independente do arsenal 
  # que o R possua em termos de bibliotecas e funções, você possa implementar 
  # as suas próprias funções. 
  
  #No R podemos criar as nossas próprias funções, por meio do objeto function(), 
  # isto permite a automação de atividades de forma: estruturada, consistente, 
  # escalável e reprodutível. Para criar tais funções existem três aspectos 
  # que devemos considerar: 
  #1) o nome do objeto criado para a função ser armazenada (que terá 
  # papel fundamental na legibilidade do código), 
  #2) os argumentos que a função pode, ou não, possuir, e 
  #3) o corpo da função, onde é definido o que a função faz e 
  # o seu retorno, isto é, o seu output.
  
  #modelo de uma função:
  #nome_funcao <- function(arg_1, arg_2, ...){
  #    corpo da função
  #}
  
  #ex. 1
  funcao_mean <- function(vetor){
    output <- sum(vetor)/length(vetor)
    return(output)
  }
  
  #ex. 2
  celcius_fahrenheit <- function(temp_c){
    temp_f <- (temp_c * 9/5) + 32
    temp_f #ou, equivalentemente, return(temp_f)
  }
  
  celcius_fahrenheit(temp_c = 25)
  celcius_fahrenheit(25)
  
  #ATENÇÃO: o R, por default, retorna a última linha do corpo da função, 
  # ou seja, o seu output. Alternativamente, utilizamos a função `return()`, 
  # de modo que o output independa da sua posição no corpo da função.
  
  #Quanto aos argumentos, assim como ocorre nas funções *built-in*, podemos 
  # especificar valores default. Adicionalmente, quando o corpo da função 
  # estiver na mesma linha do comando `function`, o uso de chaves não é 
  # necessário - assim como foi descrito para o comando `for()`:
  
  #exemplos
  ex_function <- function(x, y=1) x+y
  ex_function(1,0)
  ex_function(1)    
  
  #Ao definir funções, podemos salvá-las em scripts diferentes e chamá-las 
  # (carregá-las), por meio da função `source()`. Sendo necessário 
  # especificar o nome do script, acompanhado do nome do diretório em que o  
  # script se encontra caso o script não se encontre no mesmo diretório.

# Ambientes (environments) -----        
  #Funções possuem os seus próprios ambientes, também denominados `environments`, 
  # ou seja, sua própria coleção de objetos (funções, variáveis, etc). 
  # Assim os cálculos realizados dentro de uma função não alteram e não são  
  # registrados pelos demais ambientes. Contudo, o `environment` de uma função  
  # consegue consultar o ambiente em que foi definida (`parent environment`),  
  # bem como o ambiente pai deste, e assim por diante, de forma hierárquica. 
  # Tal recurso é utilizado no contexto em que algum objeto necessário para 
  # a execução da função não é encontrado.
  
  #exemplo
  temp_c <- 25
  
  celcius_fahrenheit <- function(){
    temp_f <- (temp_c * 9/5) + 32
    temp_f #ou, equivalentemente, return(temp_f)
  }
  
  temp_f
  celcius_fahrenheit()
  temp_f
  
  #Vale ressaltar que o exemplo acima foi desenhado visando ilustrar como 
  # o R lida com os funções e seus ambientes. Porém, em termos práticos, é 
  # extremamente desaconselhável deixar que a função dependa de parâmetros 
  # externos ao seu próprio `environment`. Idealmente, todas as dependências 
  # devem ser especificadas e passadas como argumentos da função.


# Tratamento de exceções -----
  
  # Chamamos de exceção qualquer condição anormal que possa aparecer quando 
  # estamos executando um programa de computador. Normalmente, esses erros 
  # acontecem por fatores externos do ponto de vista do código, como valores
  # ou tipos não suportados passados para uma função, necessidade de leitura 
  # ou gravação de arquivos no sistema operacional, necessidade de conexão com 
  # a internet para obter algum dado.
  
  # As linguagens costumam ter formas de tratar as exceções, ou seja, métodos 
  # e funções que possam ser usados para que o programa não quebre a execução, 
  # não apresente erros abruptos ou até mesmo continue a partir do ponto em que 
  # o erro ocorreu. O tratamento de exceções em R é feito utilizando a função 
  # `tryCatch.` A sintaxe da função é:
  
  result = tryCatch(
    {
      #Código a ser executado
    }, 
    warning = function(condição) {
      #Código a ser executado caso ocorra algum aviso (warning)
    }, 
    error = function(condição) {
      #Código a ser executado caso ocorra algum erro
    }, 
    finally={
      # Código a sempre ser executado após um dos três blocos acima.
    }
  )
  
  
  # Por exemplo, vamos escrever um código que retorna para uma variável as 
  # linhas de um arquivo lido de uma url:
  
  arquivo <- function(url) {
    linhas <- tryCatch(
      {
        message("Tentando ler o arquivo")
        readLines(con=url)
      },
      error=function(condicao) {
        message(paste("O caminho não pode ser acessado: ", url))
        message("Mensagem de erro original: ")
        message(condicao)
        return(NA)
      },
      warning=function(condicao) {
        message("Warnings foram gerados ao ler a url:") 
        message(condicao)
        return(NULL)
      },
      finally={
        message("Fim da execução")
      }
    )    
    return(linhas)
  }
  
  
  # Caso o arquivo consiga ser lido, a última linha do primeiro bloco ( o 
  # resultado de readLines ) será retornado. Se ocorrer um erro, as mensagens 
  # de erro são exibidas e é retornado o valor NA. Se ocorrer algum warning, 
  # as mensagens correspondentes são enviadas e a função retorna NULL.
  # Independente do valor de retorno, a mensagem de fim da execução será 
  # exibida ao final. É importante utilizar blocos de tratamento de exceção 
  # toda vez que não houver certeza sobre as condições necessárias para 
  # execução do código. Uma boa escolha de alternativas em caso de erros ou 
  # problemas faz com que o programa seja executado com maior confiabilidade, 
  # além de melhorar a legibilidade e diminuir o tempo gasto para correção 
  # desses erros e problemas.


# ----- > MÃO NA MASSA -----
  #No RStudio Learn Primers: #https://posit.cloud/learn/recipes
  # você encontrará materiais para praticar e seguir evoluindo na linguagem R!
  # ao longo dos módulos vamos fazer referências a alguns materiais daqui ;)
  
  #Se você nunca tiver programado em R recomendo dar uma olhada nos materiais  
  # da apresentação "Oficina de Introdução ao R" das R-Ladies São Paulo:
    # https://r-ladies-sao-paulo.github.io/2022-11-oficina-introducao-R/

