
# Introdução à Programação em R
# Nathália Demetrio


# Apresentações  -----
    #apresentações
    #comentar form
    #compartilhar agenda
    #combinar dinamica das aulas

# Contextualização  -----
    # https://www.r-project.org/

# Da Instalação ao `Hello World`  -----
    # https://cloud.r-project.org

# A IDE Rstudio  -----
    # https://www.rstudio.com/

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

# R como calculadora  -----
    #Textos precedidos por # são comentários (note a mudança na cor do texto)

    #Operações
        #soma (o separador decimal no R é o ponto)
        1 + 1.5

        #subtração
        7 - 2 
        
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
        #equação não ok
        (2 * { 2 * [ 2 * (4-3)]})

# :::::::::::: check-point -------------------------------------------------------------
    # @s elun@s devem criar um script, 
    # salva-lo contendo uma mensagem comentada, 
    # fechar o script e abri-lo novamente
        
        
# Operadores lógicos -----
        
    #Podemos também trabalhar com operadores lógicos no R, tendo como saída TRUE ou FALSE.
        #maior/menor
        1 < 0 
        1 > 0 
        #menor/maior ou igual
        1 <= 1 ; 1 >= 1 
        
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

    #Uma função no R é de um conjunto de instruções organizadas visando executar uma tarefa.

    #No R apenas com as funções builtins, podemos fazer desde cálculos aritméticos a gráficos e modelos estatísticos.
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
        
    #link com apanhado de funções organizadas por temas: 
        #http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html
    
            
# Criando objetos  -----

    #Objetos no R são elementos que podem ser armazenados em variáveis, como dados e funções
        
    #Podemos criar objetos utilizando o sinal de <- ou =
    #Objetos podem ser nomeados com letras (case sensitive), números, e os símbolos . e _ 
        #síntaxe: letras minúsculas
        objeto <- 1 #atribuição da direita para a esquerda (RECOMENDADO)
        
        #síntaxe: letras minúsculas com a primeira letra maiúscula
        Objeto =  2 #atribuição da direita para a esquerda
        
        #síntaxe: letras minúsculas, símbolo e número
        3 -> objeto_1 #atribuição da esquerda para a direita
     
    #Atribuição: a recomendação é trabalhar com <- para atribuições de objetos, 
    # e = para a especificação de parâmetros de funções, e evitar o `->`
        
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
   
   #Para inserir o símbolo de atribuição `<-` no RStudio podemos utilizar o atalho 'alt + -'.
       
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

# :::::::::::: hands-on ----------------------------------------------------------------
    # em trios @s alun@s devem criar um objeto chamado c, e outro chamado f, em que:
       # 1) o c irá receber como input uma temperatura em graus celsius, digitado pelo usuário
       # 2) e o f será uma fórmula que tem o c como um dos seus valores
       # 3) ao mudar o valor de c o que acontece com o f? é atualizado? 
       #    Algo precisaria ser feito para ele ser atualizado?
       # 4) substitua o c para que receba a função readline(prompt="Graus Celsios: "), o que acontece?
       # 5) digite novamente a definição do objeto f, avalie a mensagem de erro, e 
       #    investigue o uso das funções class() e as.numeric() para solucionar o problema


# Tipos de Dados  -----
    #No R existem seis tipos de dados, que basicamente indicam como os objetos são armazenados (*low-level*)
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
        
    #Uma característica de armazenamento dos objetos no R, é que eles respeitam a seguinte hierarquia de coerção: 
        #character > complex > numeric > integer > logical > raw
        
    #Ou seja, se tentarmos colocar tipos diferentes de objetos em um mesmo vetor 
    #o R irá modificar o tipo dos objetos de modo que todos passem a pertencer à mesma classe. 
        #Algumas funções inclusive fazem a mudança na classe do objeto de forma automática:
            #coerção da classe lógica para inteira
            class(length(ex_vetor_logical)) #`length()` retorna o tamanho do objeto
            #coerção da classe inteira para numérica
            class(cos(ex_vetor_integer)) #`cos()` retorna o cosseno de um número
            #coerção da classe numérica para a de texto
            class(paste(ex_vetor_numerical)) #`paste()` concatena objetos
        
# Estruturas de Dados -----
    
    #como os objetos podem ser organizados em termos de estrutura
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
            ex_vetor_character <- c("laranja", "roxo", "verde") 
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
          
        # >>> FATORES -----
            #Fatores são vetores que possuem um número limitado de categorias (níveis), logo 
            #são "armazenados" como inteiros. Na prática fatores são variáveis categóricas, 
            #e são tratadas de forma diferenciada em algumas análises (como nos modelos de regressão)
                ex_fator <- factor(LETTERS[1:5])
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
                
                #podemos checar os níveis de fator 
                levels(var_factor) 
                
                #e altera-los
                levels(var_factor)[1] <- "masculino"; 
                levels(var_factor)[2] <- "feminino"
                
                #e inclusive adicionar níveis à variável
                levels(var_factor) <- c(levels(var_factor), "prefiro não responder")
                
                #e assim visualizar os resultados da varíavel, mesmo sem observações vinculadas
                table(var_factor)
                
            #- variáveis ordinais: possuem uma ordenação entre as suas categorias, 
            #apesar de não existir uma escala bem definida entre as categorias.
            #ex: classe social, escolaridade ou pesquisas do tipo "de 1 a 5"
                var_ordinal <- factor(c(rep("baixo",2), rep("alto", 3))); var_ordinal
                
                var_ordinal <- ordered(var_ordinal); var_ordinal
                
                #podemos fazer a alteração redefinindo os níveis
                levels(var_ordinal) <- c("baixo", "alto"); var_ordinal
                    
                
            #Visto ser um caso particular dos vetores a forma de acesso é a mesma. 
            #Podemos utilizar funções como: `is.factor`/`is.ordered` e `as.factor`/`as.ordered`
                
        #>>> DATAS -----  
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

                                
    #> MATRIZES / ARRAYS -----
        x <- 1:8
        
        #criando uma matriz a partir da atribuição de dimensões
        dim(x) <- c(2,4); x
        
        #ou definindo uma matriz a partir do número de linhas
        matrix(x, nrow = 2)

        #pelo número de colunas
        matrix(x, ncol = 2)
        
        #ou ainda, ambos
        ex_matriz <- matrix(x, 2, 4); ex_matriz   
        
        #arrays
        ex_array <- array(x, dim = c(2, 2, 2)); ex_array
        
        #CONSULTA
            #matriz
            ex_matriz[1,1] 
            #array - consulta do valor contido no cruzamento do primeiro elemento das três dimensões
            ex_array[1,1,1]
            #array - consulta do valor contido no primeiro elemento da terceira dimensão
            ex_array[ , ,1]
            
            #podemos também consultar informações como a dimensão do objeto 
            dim(ex_array)
            
        #CLASSE
            class(ex_matriz)
            class(ex_array)
            
        #OPERAÇÕES
            #operações entre objetos
            rep(2,4) * ex_array
            
            #matriz transposta
            t(ex_matriz)     
            
            #multiplicação matricial
            ex_matriz %*% t(ex_matriz)
            
            
    #> DATA FRAMES -----
        #é possível criar data frames diretamente
            data.frame(col1 = 1:5, col2 = as.character(c(1:4, "NA")), col3 = LETTERS[1:5])
            #com ou sem o nome das colunas
            data.frame(1:5, as.character(1:5), LETTERS[1:5])
            
            
        #ou a partir de objetos existentes
            idade <- c(31,30,25,40)
            #classe <- factor(c("D", "C", "C", "B"))
                 classe <- factor(c("D", "C", "C", "B"), ordered = T)
                # classe <- factor(c("D", "C", "C", "B"), ordered = T)
                # classe <- factor(c("D", "C", "C", "B"), levels = c("A", "B", "C", "D", "E"), ordered = T)
            flag <- c(TRUE,TRUE,NA,FALSE)
            ex_df <- data.frame(idade,classe,flag); ex_df
        
            #exemplo
                teste <- c("indio", "preto" ,"branco", "preto")
                teste <- as.factor(teste)
                teste <- factor(c("indio", "preto" ,"branco", "preto"), 
                                levels = c("branco","preto", "indio"), ordered = T)

        #CONSULTA
            #vetores de índice:
            ex_df[2,2]
            ex_df[c(2,4),]
            ex_df[1,1:2]
            
            #nomenclatura:
            ex_df$idade
            ex_df[c("idade","classe")]
            
            #vetores lógicos, e combinando as opções anteriores:
            ex_df[ex_df$idade>30, 1]
            
            #ex_df[rownames(ex_df)==4, ]
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
    
# Analises Básicas  -----

    #base para exemplo
    mtcars
                
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

        #regressão
            fit <- lm(qsec ~ ., data = mtcars)  
            summary(fit)
            plot(fit)


# :::::::::::: hands-on ----------------------------------------------------------------
    #considerando a base mtcars
        #? exclua as variáveis que estão atrapalhando a visão dos demais boxplots?
        #? como ver o resultado médio de uma variável apenas?
        #? qual a média das primeiras 10 linhas da base? 
        #? quantas linhas possuem vs e am igual a 0?
    
        #em uma nova base de dados chamada mtcars_new:
            #? arredonde a variável qsec para 1 casa decimal
            #? transforme a variável vs em character
            #? exporte os resultados em um csv
            #? onde esse csv está?

    #para consultar mais estatísticas: help(package=stats) 

