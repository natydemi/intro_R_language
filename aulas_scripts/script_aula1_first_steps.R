
# Introdução à Programação em R
# Nathália Demetrio

# Apresentações  -----
    #professora e monitoras
    #revisar forms
    #combinar dinamica das aulas

# Agenda -----
  #contextualizar temas
  #dialetos do R: Rbase, tidyverse, data.table

# Primeiros passos  -----

  # Contextualização
    # https://www.r-project.org/

  # Da Instalação ao `Hello World`
    # https://cloud.r-project.org

  # A IDE Rstudio 
    # https://www.rstudio.com/

  # Alternativa ao Desktop: Rstudio Cloud 
    #https://posit.cloud/


# Um tour pelo Rstudio  -----
    #Console - painel onde os comandos são executados interativamente;  
    #Source - onde são abertos os scripts do R, que só será enviado para o Console quando executado; 
    #Environment - listagem dos objetos definidos ao longo da sessão;
    #Files - acesso às pastas e arquivos do computador;
    #Help - menu de ajuda e visualização das documentações consultadas;
    #History - consulta do histórico de comandos;
    #Packages - gerenciamento das bibliotecas instaladas;
    #Plots - visualização dos gráficos gerados; e
    #Viewer - visualização dos relatórios e aplicativos gerados.

  # Dica: 
    #Vá em `Tools > Global Options` e personalize o RStudio
    # considerando itens como `Appearance` ou `Pane Layout`

# R como calculadora  -----
    #Textos precedidos por # são comentários (note a mudança na cor do texto)

    #Operações
        #soma (o separador decimal no R é o ponto)
        1 + 1.5

        #subtração
        7 - 2 ; 9 / 3 
        
        #divisão
        9 / 3  
        
        #multiplicação
        100 * 10 
        
        #potência
        2^4 ; 2**4  
        
        #resto da divisão de 10 por 3
        10 %% 3 
        
        #parte inteira da divisão de 10 por 3
        10 %/% 3  
        
    #O resultado foi precedido por `[1]`, o que faz referência à quantidade de elementos do resultado
    #spoiler: contadores no R partem do `1`, e não do `0` como muitas outras linguagens 
        
    #podemos escrever o código no Editor (Source/R Script), e envia-lo para a execução no Console 
    #por meio do atalho ‘Ctrl + Enter’ ou pelo botão ‘Run’ do RStudio.
        
    #O R permite ampliar as equações mantendo a notação básica de operações algébricas
        #equação ok
        (2 * ( 2 * ( 2 * (4-3))))
        
        #equação não ok (dará erro)
        (2 * { 2 * [ 2 * (4-3)]})

        
# ::::: check-point -------------------------------------------------------------
    # @s elun@s devem criar um script, 
    # salva-lo contendo uma mensagem comentada, 
    # fechar o script e abri-lo novamente
        
       
         
# Operadores lógicos -----
        
    #Podemos também trabalhar com operadores lógicos no R, tendo como saída TRUE ou FALSE.
        #maior/menor
        1 < 0 
        1 > 0 
        #menor/maior ou igual
        1 <= 1 ; 1 > 1 
        
        #igual/diferente (igual são com DOIS simbolos seguidos)
        1 == 1 
        1 != 1 
        
    #No caso de digitarmos um comando incompleto no Console, o R mostrará o símbolo + 
    #Para iniciar um novo comando, desconsiderando comandos parciais anteriores, basta pressionar a tecla ‘Esc’. 
        #comando incompleto
        8 ==
            
    #no caso de comandos que o R não reconheça, ele retornará uma mensagem de erro
        #erro
        3 % 9
        
    #para resgatar algum comando já digitado no Console, você pode utilizar a tecla ‘seta para cima’    
    

        
# Entendendo funções  -----

    #Uma função no R é de um conjunto de instruções organizadas visando 
    # executar uma tarefa.

    #No R apenas com as funções builtins, 
    # podemos fazer desde cálculos aritméticos a gráficos e modelos estatísticos.
    #Segue uma lista de funções no R:
        builtins() 

    #O nome de tais funções no R são, em geral, intuitivas
        #aplicando a função exponencial ao número 1
        exp(1)
        #podemos ver o código da função ao digitar a função sem os parênteses
        exp

    #Uma das funções mais importantes no R é a função `help()`, ou o seu operador equivalente `?` 
    #temos acesso a: descrição do objeto consultado, possibilidades de alterações, exemplos, etc
        ?log
        
        #por default o log é calculado na base exponencial
        log(10)
        
        #de modo que o resultado não é alterado mesmo se explicitarmos o argumento 'base'
        log(10, base = exp(1))
        
        #mas podemos altera-lo para qualquer número positivo, como a base 10 por exemplo
        log(10, base = 10)
        
    #Note que não foi necessário especificar o nome do primeiro argumento da função em nenhum dos casos (`log(x=10)`).
        
    #No caso de consultas que envolvam objetos com caracteres especiais, é necessário que o texto esteja entre crases.
        ?`?`
        
    #Podemos também obter ajuda considerando tópicos de modo mais geral, por meio das funções `help.search()` ou `??`.
        ??median
        
           
         
# Criando objetos  -----

    #Objetos no R são elementos que podem ser armazenados em variáveis, como dados e funções
        
    #Podemos criar objetos utilizando o sinal de <- ou =
    #Objetos podem ser nomeados com letras (case sensitive), números, e os símbolos . e _ 
        #síntaxe: letras minúsculas
        objeto <- 1 #atribuição da direita para a esquerda (RECOMENDADO)
        
        #síntaxe: letras minúsculas com a primeira letra maiúscula
        Objeto = 2 #atribuição da direita para a esquerda
        
        #síntaxe: letras minúsculas, símbolo e número
        3 -> objeto_1 #atribuição da esquerda para a direita
     
    #Atribuição: a recomendação é trabalhar com <- para atribuições de objetos, 
    # e = para a especificação de parâmetros de funções, e evitar o `->`
        
    #Para inserir o símbolo de atribuição `<-` no RStudio podemos utilizar o atalho 'alt + -'.
        
    #Ao criar objetos passamos a ter a informação que estes carregam salvos na memória, e podemos chama-los  
       sqrt(Objeto) 
        
    #Podemos fazer operações entre elementos e objetos
       #atribuindo um elemento diretamente
       a <- 3; a
       #resultado de operações entre elementos
       b <- 5 + a ; b
       
       #excluindo o objeto a
       rm(a); a
       
       #operações entre outros objetos
       c <-  b * (-1); c
       #resultado da aplicação de funções
       d <- abs(c); d
       
   #Para listar todos os objetos disponíveis na sessão podemos utilizar a função `ls()`
   #Enquanto que para excluir algum destes objetos temos a função `rm(nome_do_objeto)`
   
   # Regras para nomear objetos    
       #É possível trabalhar com objetos nomeados com sintaxes não padrão, porém é necessário utilizar aspas
       #definindo o objeto com sintaxe não padrão
       `1¨ objeto c/ $int@xe que $&ria #inva!ida for@ da$ a$pa$` <- 6 
       
       #aplicando-o em uma função (log na base 10)
       log10(`1¨ objeto c/ $int@xe que $&ria #inva!ida for@ da$ a$pa$`)
       
       #no R existem alguns nomes reservados para representar os seguintes casos especiais    
       #Not Available: uma constante lógica utilizada para representar dados faltantes
       NA
       
       #Not a Number: objeto lógico representando indefinições matemáticas, como log de números negativos.
       NaN
       
       #Infinite: conceito matemático (positivo ou negativo).
       Inf; -Inf
       
       #Null object: representa a ausência de informação, utilizada como retorno de funções cujos valores são indefinidos.
       NULL
       
       #Visto a relevância de tais objetos, estes não podem ser reescritos. Diferentemente de outras constantes
       NA <- 0
       
       pi
       pi <- 0
       pi

       
# ::::: hands-on: criação de objetos -----
    # @s alun@s devem criar um objeto chamado c, e outro chamado f, em que:
       # 1) o c irá receber como input uma temperatura em graus celsius, digitado pelo usuário
       # 2) e o f será uma fórmula que tem o c como um dos seus valores
       # 3) ao mudar o valor de c o que acontece com o f? é atualizado? 
       #    Algo precisaria ser feito para ele ser atualizado?
       # 4) substitua o c para que receba a função readline(prompt="Graus Celsios: "), o que acontece?
       # 5) digite novamente a definição do objeto f, avalie a mensagem de erro, e 
       #    investigue o uso das funções class() e as.numeric() para solucionar o problema


# ::::: practice: estatísticas descritivas (objeto/base mtcars)-----
    #base para exemplo
    mtcars
        
      View(mtcars)
     
      #`head()` - que retorna as primeiras linhas da base de dados, ou similarmente a função `tail()` que contempla as últimas linhas:
      head(mtcars)
      tail(mtcars)
      
      
      #`str()` - exibe a estrutura interna de um objeto, no caso da base de dados que estamos trabalhando p.e., temos: a estrutura dos dados (data.frame), o número de linhas (32 observações) e colunas (11 variáveis), além da classe de cada uma das colunas, e uma amostra das primeiras observações de cada uma das colunas: 
      str(mtcars)
      
      
      # `summary()` - é uma função genérica usada para produzir resumos de resultados segundo várias funções descritivas, no caso de variáveis numéricas, por exemplo: 
      summary(mtcars)
                  
      cor(mtcars)
       
      #plot
      plot(mtcars)
      
      #boxplot
      boxplot(mtcars)
      
      #como esta base faz parte do repertório básico do R, 
      # não a visualizamos na aba `Environment`, salvo se fizermos:
      data("mtcars")


    #para consultar mais funções estatísticas: help(package=stats) 

      #regressão: um exemplo em que ajustamos a variável qsec 
      # em função da variável carb:
      fit <- lm(qsec ~ carb + disp, data = mtcars)  
      summary(fit)
      plot(fit)
      
      #excluindo o modelo
      rm(fit)
      
      # agora a variável qsec em função de todas as demais:
      fit <- lm(qsec ~ ., data = mtcars)  
      summary(fit)
      plot(fit)
        
