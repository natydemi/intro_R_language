
# Introdução à Programação em R
# Nathália Demetrio

# O que você verá neste script: Tipos e Estruturas de Dados no R -----
  #1) No R existem 6 tipos de dados, em geral trabalhamos com 4: 
      #character > numeric > integer > logical
  #2) Os dados podem ser organizados em 5 estruturas de dados: 
      #vetor atômico, matriz, array, data.frame e listas

# Tipos de Dados  -----
    # No R existem seis tipos de dados, que basicamente indicam como os objetos são armazenados (*low-level*)
        # character - textos ou strings:  `"a"` ou `"isto é um teste"` (sempre entre aspas simples ou duplas)
        # numeric (ou double ): valores decimais - `6` ou `19.4`
        # integer: números naturais -`2L` ou `0L` (o `L` diz para o R armazenar o objeto como inteiro)
        # logical: valores booleanos - `TRUE` e `FALSE`
        # complex: números complexos - `1+4i` ou `1+3i`  
        # raw: bytes - `0a` ou `c8`
        
    #Para verificar qual é o tipo de armazenamento de um objeto, podemos utilizar a função `typeof()`. 
    #A função `class()` também pode ser utilizada, porém, visto que trabalha com a lógica hierárquica de classes
    #o resultado só será o mesmo do `typeof()` quando o objeto tiver a estrutura mais básica do R - vetores atômicos.
    
    #Podemos também utilizar as funções `is.` e `as.` para testar e converter objetos, respectivamente:
        
            
        #definindo um objeto
        x <- 1
        #o objeto é um inteiro?
        is.integer(x)
        #conferindo o tipo do objeto (double e numeric são sinônimos no R)
        typeof(x) ; class(x)
        #trasformando 'x' em um texto, e redefinindo o objeto
        x <- as.character(x)
        #conferindo novamente o tipo do objeto
        class(x)
        
    #Tais definições são importantes pois algumas funções só farão sentido para determinados tipos de dados
        #tentativa de cálculo com um objeto de texto 
        log(x)
        
    #Uma característica de armazenamento dos objetos no R, 
    # é que eles respeitam a seguinte hierarquia de coerção: 
        # character > complex > numeric > integer > logical > raw
        
    
    #Ou seja, se tentarmos colocar tipos diferentes de objetos em um mesmo vetor 
    #o R irá modificar o tipo dos objetos de modo que todos passem a pertencer à mesma classe. 
    #falaremos de vetores na próxima seção, mas adiantando que   
    #a forma mais usual para criar um vetor no R é por meio da função `c()`
        #Algumas funções inclusive fazem a mudança na classe do objeto de forma automática:
            #coerção da classe lógica para inteira
            class(length(c(TRUE, FALSE))) #`length()` retorna o tamanho do objeto
            #coerção da classe inteira para numérica
            class(cos(c(3L, 5L, 8L))) #`cos()` retorna o cosseno de um número
            #coerção da classe numérica para a de texto
            class(paste(1:3, 3:1)) #`paste()` concatena objetos
        
            
# Estruturas de Dados -----
    
    #como os objetos podem ser organizados em termos de estrutura?
        #Vetores atômicos
            #estrutura mais básica do R, se caracterizam por uma única dimensão, e guardam objetos de um mesmo tipo. 
        #Matrizes
            #nos permitem trabalhar com dados bidimensionais que contenham o mesmo tamanho e o mesmo tipo de dados
        #Arrays
            #similares as Matrizes, porém permitindo mais que duas dimensões 
        #Data Frame
            #estruturas bidimensionais mais genéricas que as matrizes, uma vez que suas colunas podem conter tipos de objetos diferentes.
        #Listas
            #permitem que diferentes tipos de objetos sejam guardados em um único `vetor`
            #além de serem recursivos, i.e., uma lista pode conter outras listas, de diferentes tamanhos
        
        
  #> VETORES -----
      #A forma mais usual para criar um vetor no R é por meio da função `c()`
          ex_vetor_character <- c("laranja", "roxo", "verde", "roxo", "verde") 
          ex_vetor_character
          
          ex_vetor_numerical <- c(1,2,3,4,5)
          ex_vetor_numerical
          
          ex_vetor_integer <- c(1L,2L,3L,4L,5L) 
          ex_vetor_integer
          
          ex_vetor_logical <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
          ex_vetor_logical
          
          #Existem muitas outras formas de definir vetores no R, como os operadores `:`, `seq()`, `rep()`
              #alternativas para a criação de vetores
              ex_vetor_character2 <- rep("azul", times = 5) 
              ex_vetor_numerical2 <- 1:5
              ex_vetor_integer2 <- c(1L:3L,4L,5L)
              ex_vetor_logical2 <- c(TRUE, FALSE, c(FALSE,TRUE)) 
          
      
      #CONSULTA    
          #basta indicar o índice do elemento de interesse entre colchetes
              #consultando elementos de um vetor
              ex_acesso <- c("primeiro", "segundo", "terceiro")
              ex_acesso
              
              #acessando o primeiro elemento 
              ex_acesso[1] 
              
              #acessando o último elemento
              n <- 3; ex_acesso[n]
          
          #Para consultar múltiplos elementos, podemos indicar os índices de interesse por meio de um vetor:
              #consultando multiplos elementos de um vetor por meio da função c()
              ex_acesso[c(2,4)]
              #ou qualquer função que retorne os índices
              ex_acesso[1:2]
              #podemos inclusive fazer consultas em outras ordens
              ex_acesso[5:1]
              #ou criar novos objetos a partir destes
              ex_acesso2 <- ex_acesso[c(1,3,5)]; ex_acesso2
              #ou ainda utilizar vetores lógicos
              ex_acesso[c(rep(TRUE,3), rep(FALSE,3))]
          
          #No R podemos inclusive fazer consultas a partir dos elementos que não temos interesse:
              #excluindo o primeiro elemento
              ex_acesso[-1]
              #excluindo os três últimos elementos
              n <- 5; ex_acesso[-((n-2):n)]
          
          #O `[1]` que precede o resultado no Console, se trata a quantidade de elementos do resultado
              #exemplo
              letters
          
      #CLASSE
          #um vetor possui como classe o tipo dos objetos que guarda
          ex_vetor_integer
          class(ex_vetor_integer)
          
          ex_vetor_combinado <- c(ex_vetor_character, ex_vetor_integer)
          class(ex_vetor_combinado)
          
      #OPERAÇÕES
          #Para fazer operações entre vetores, o R alinha os objetos, e faz o cálculo elemento a elemento
              #operação entre vetores do mesmo tamanho
              1:5 + 1:5
              paste(1:5,"_",6:10)
              #ou
              paste(1:5,1:5, sep = "_")
              
              #operações entre vetores de tamanhos diferentes
              1:3 + 1
              
              #operações entre vetores de tamanhos diferentes, múltiplos
              1:3 != 1:6
              
              #no caso de objetos não múltiplos o R retorna o resultado + um aviso
              1:3 == c(1:3,4)
              
      #ATRIBUTOS
          #O R permite que adicionemos atributos aos objetos, o que significa associar propriedades como:
          #nomes, dimensões, classes, comentários, etc
              #verificando classe e tamanho, atributos básicos
              class(ex_vetor_integer); length(ex_vetor_integer)
              
              #nenhum dos vetores que definimos até agora tiveram atributos vinculados
              attributes(ex_vetor_integer)
              
              #adicionando o atributo nome
              names(ex_vetor_integer) <- c("um", "dois", "três", "quatro", "cinco")
              attributes(ex_vetor_integer)       
              
              #permitindo o acesso diretamente por seus respectivos nomes
              ex_vetor_integer["três"]
                  #erro
                  ex_vetor_integer[-"três"]
                  #pelo index funciona
                  ex_vetor_integer[-3]
                  #acerto
                  names(ex_vetor_integer) != "três"
                  ex_vetor_integer[names(ex_vetor_integer) != "três"]
                  
              ex_vetor_integer[c("um","três")]
                  #quase erro (warning)
                  ex_vetor_integer[names(ex_vetor_integer) != c("um","três")]
                  #acerto
                  ex_vetor_integer[!names(ex_vetor_integer) %in% c("um","três")]
                    #perceba que o `%in%` é importante pois a comparação é feita
                    # avaliando cada um dos elementos à esquerda, em cada um 
                    # dos elementos à direita. Enquanto que os simbolos `==` e 
                    # `!=` avaliam par a par
        
    # >>> FATORES -----
        #Fatores são vetores que possuem um número limitado de categorias (níveis), logo 
        #são "armazenados" como inteiros. Na prática fatores são variáveis categóricas, 
        #e são tratadas de forma diferenciada em algumas análises (como nos modelos de regressão)
            ex_fator <- as.factor(LETTERS[1:5])
            ex_fator
            #os fatores são armazenados de acordo com os tipos de objetos discutidos
            typeof(ex_fator)
            #porém possuem uma classe própria
            class(ex_fator)
            #que permite o uso de funções especificas
            levels(ex_fator)
            
        #Os fatores permitem que seus níveis sejam ordenados, de modo que podemos 
        #diferenciar as variáveis categóricas nominais e ordinais, em que:
            
            #- variáveis nominais: possuem categorias sem qualquer tipo de ordenação 
            #Como exemplos podemos citar: cores, marcas ou sexo. 
            var_nominal <- c(rep(0,2), rep(1, 3)); var_nominal
            var_factor <- factor(var_nominal); var_factor
            var_factor <- as.factor(var_nominal); var_factor
            
            #podemos checar os níveis de fator 
            levels(var_factor) 
            
            #e altera-los
            levels(var_factor)[1] <- "masculino"; 
            levels(var_factor)[2] <- "feminino"
            #maneira alternativa: levels(var_factor)  <- c("masculino", "feminino")
            
            #e inclusive adicionar níveis à variável
            levels(var_factor) <- c(levels(var_factor), "prefiro não responder")
            
            #e assim visualizar os resultados da varíavel, mesmo sem observações vinculadas
            table(var_factor)
            
        #- variáveis ordinais: possuem uma ordenação entre as suas categorias, 
        #apesar de não existir uma escala bem definida entre as categorias.
        #ex: classe social, escolaridade ou pesquisas do tipo "de 1 a 5"
            var_ordinal <- factor(c(rep("baixo",2), rep("alto", 3))); var_ordinal
            
            var_ordinal <- ordered(var_ordinal); var_ordinal
            var_ordinal <- as.ordered(var_ordinal); var_ordinal
            
            #podemos fazer a alteração redefinindo os níveis
            levels(var_ordinal) <- c("baixo", "alto"); var_ordinal
                
            
        #Visto ser um caso particular dos vetores a forma de acesso é a mesma. 
        #Podemos utilizar funções como: `is.factor`/`is.ordered` e `as.factor`/`as.ordered`
            
    # >>> DATAS -----  
        #O R possui uma classe própria para objetos que armazenam datas. 
        # para transformar um elemento nesta classe podemos utilizar `as.Date()`
            ex_date <- as.Date(c("1988-03-25", "2019-03-25"))
            typeof(ex_date)
            class(ex_date)
            
            #ou ainda
            as.Date("01/12/2012", format = "%d/%m/%Y")
            
        #Abaixo seguem algumas alternativas de formato - para mais opções consulte `?strptime`:
            # %d: dias numéricos (0-31)
            # %a: dias da semana, abreviados (Mon)
            # %A: dias da semana, não abreviados	(Monday)
            # %m:	meses numéricos (00-12)
            # %b: meses em texto, abreviados (Jan)
            # %B: meses em texto, não abreviados	(January)
            # %y: anos com dois dígitos (19)
            # %Y:	anos com quatro dígitos (2019)
            
        #Desta forma podemos fazer cálculos cabíveis à dados desta natureza, como
            #quantidade de dias entre duas datas:
            ex_date[1] - ex_date[2]

                            
  #> MATRIZES -----
      
      #criando uma matriz a partir da atribuição de dimensões
      x <- 1:8
      dim(x) <- c(2,4); x
      
      #ou definindo uma matriz a partir do número de linhas
      x <- 1:8
      matrix(x, nrow = 2)

      #pelo número de colunas
      matrix(x, ncol = 2)
      
      #ou ainda, ambos
      ex_matriz <- matrix(x, 2, 4); ex_matriz   
      
      #CONSULTA
          #matriz
          ex_matriz[1,1] 
          
          #podemos também consultar informações como a dimensão do objeto 
          dim(ex_matriz)
          
      #CLASSE
          class(ex_matriz)

      #OPERAÇÕES
          #operações entre objetos
          rep(2,4) * ex_matriz
          
          #matriz transposta
          t(ex_matriz)     
          
          #multiplicação matricial
          ex_matriz %*% t(ex_matriz)
          
  #> ARRAYS -----
      
      #criando uma matriz a partir da atribuição de dimensões
      x <- 1:8
      dim(x) <- c(2,2,2); x
      
      #arrays
      x <- 1:8
      ex_array <- array(x, dim = c(2, 2, 2)); ex_array
      
      #CONSULTA
          #array - consulta do valor contido no cruzamento do primeiro elemento das três dimensões
          ex_array[1,1,1]
          #array - consulta do valor contido no primeiro elemento da terceira dimensão
          ex_array[ , ,1]
          
      #CLASSE
      class(ex_array)
      
      #OPERAÇÕES
      #operações entre objetos
      rep(2,4) * ex_array
      
          
  #> DATA FRAMES -----
      #é possível criar data frames diretamente
          data.frame(
            col1 = 1:5, 
            col2 = as.character(c(1:4, "NA")), 
            col3 = LETTERS[1:5]
            )
      
          #com ou sem o nome das colunas
          data.frame(1:5, as.character(1:5), LETTERS[1:5])
          
          
      #ou a partir de objetos existentes
          idade <- c(31,30,25,40)
          classe <- factor(c("D", "C", "C", "B"))
              # no caso de trabalharmos como variável ordinal:
              # classe <- factor(c("D", "C", "C", "B"), ordered = T)
              # classe <- factor(c("D", "C", "C", "B"), levels = c("A", "B", "C", "D", "E"), ordered = T)
          flag <- c(TRUE,TRUE,NA,FALSE)
          ex_df <- data.frame(idade,classe,flag); ex_df
      
          #se quisermos adicionar uma nova coluna
              raça <- c("indígena", "preta" ,"branca", "preta")
              raça <- as.factor(raça)
              # note que faz sentido termos mapeados as raças independentemente 
              # de constarem originalmente no vetor ou não 
              raça <- factor(raça, 
                             levels = c("branca","preta", "amarela", "indígena", "parda"),
                             ordered = FALSE)
              
              ex_df_novo1 <- data.frame(ex_df, raça)
              ex_df_novo2 <- cbind(ex_df, raça)
              

      #CONSULTA
          #por vetores de índice:
          ex_df[2,2]
          ex_df[c(2,4), ]
          ex_df[1,1:2]
          
          #por nomenclatura:
          ex_df$idade
          ex_df[c("idade","classe")]
          
          #por vetores lógicos, e combinando as opções anteriores:
          ex_df[ex_df$idade>30, 1]
          ex_df[ex_df$idade >= 30 & ex_df$classe == "D", ]   
          ex_df[ex_df$idade >= 30 | ex_df$classe == "B", ]   
          
          
          #exemplos
          ex_df[rownames(ex_df)==4, ]
          ex_df[ex_df$flag == T, ]
          ex_df[is.na(ex_df$flag) , ]
          ex_df[ , (colnames(ex_df) %in% c("idade", "flag"))]
          ex_df[ , !(names(ex_df) %in% c("idade", "flag"))]
          
          
      #CLASSE
          class(ex_df)
          class(ex_df$idade)
          
      #OPERAÇÕES
          ex_df$idade + 1
          ex_df$classe == "C"
          
  #> LISTAS -----
      #criando uma lista
      list(4L, "a", TRUE)
      
      #lista recursiva
      ex_list <- list(9:1, ex_df = ex_df, TRUE)
      ex_list
      
      #CONSULTA
          #podemos seguir o padrão dos vetores usando `[`, tendo sempre listas como retorno.
          ex_list[1] ; class(ex_list[1])
          # Ou por meio de `[[` tendo como retorno a classe do elemento consultado
          ex_list[[1]] ; class(ex_list[[1]])
          #ou ainda `$` caso os elementos sejam nomeados
          ex_list$ex_df ; class(ex_list$ex_df)
          
      #CLASSE
          #Listas possuem uma classe própria e permitem que seus elementos mantenham as suas próprias classes
              class(ex_list)
              class(ex_list[[1]])
              class(ex_list$ex_df)
              class(ex_list[[3]])
          
      #OPERAÇÕES
          #Listas seguem a mesma lógica dos vetores e data.frames em relação às operações, com esquema de reciclagem e coerção
              #operação entre elementos da lista
              paste(ex_list[[1]][1:4], ex_list[[3]])
              
              #operação com uma coluna específica do data frame
              ex_list$ex_df$idade + ex_list[[1]]
          
  #Para tirar dúvidas sobre como consultar os diferentes tipos de objetos no R consulte o help `?Extract` ou `?Syntax`            
  


# ::::: hands-on: manuseando dados ----------------------------------------------------------------
    #para os exercícios abaixo, pode ser interessante revisitar a seção `practice`
    # de estatísticas descritivas feita no final do script da aula 1
                
    #1.considerando a base mtcars
        #1.1. exclua as variáveis que estão atrapalhando a visão dos demais boxplots?
        #1.2. como ver o resultado médio de uma variável apenas? #dica: mean()
        #1.3. qual a média das primeiras 10 linhas da base? 
        #1.4. quantas linhas possuem "vs" e "am" igual a 0?
    
    #2.em uma nova base de dados chamada mtcars_new, em que:
        #2.1 a variável "qsec" esteja arredondada considerando  1 casa decimal 
        #2.2 a variável "vs" seja transformada em character
    
    #3. (questão bônus): exporte os resultados em um csv, onde este csv está?


# ::::: Refs -----
                
  # cheatsheet: Data Structures
  # https://intellipaat.com/mediaFiles/2019/02/Data-structure-in-R-Cheat-Sheet-.png