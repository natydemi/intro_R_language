
# Introdução à Programação em R
# Nathália Demetrio


# ::::: practice: manuseando dados (bases state) -----
    state.abb
    state.area
    state.center
    state.division
    state.name
    state.region
    state.x77
    
        #qual dos datasets acima é uma matriz?
          is.matrix(state.x77)
          class(state.x77)
        #o que são os nomes à esquerda? como acessa-los?
          rownames(state.x77)
        #retorne as linhas de "Virginia" e "Colorado"
          state.x77[rownames(state.x77) %in% c("Virginia", "Colorado"),]
        #retorne as colunas de "Population" e "Income"
          state.x77[,colnames(state.x77) %in% c("Population", "Income")]
          
        #transforme todos os datasets em um data frame chamado state
        state <- data.frame(state.abb, state.area, state.division, 
                     state.name, state.region, state.x77, state.center)
        
        #se tivessemos transformado em matrix, qual seria o problema?
          cbind(state.abb, state.area) #viraria matriz
            #no caso de querer combinar empilhar por linhas 
            rbind(state.abb, state.area)
        
        #acesse a coluna x da base state.center das três formas abaixo, qual a diferença entre elas? 
           # state.center$x
            class(state.center$x)
           # state.center[["x"]]
            class(state.center[["x"]])
           # state.center["x"]
            class(state.center["x"])
          
        #voltando aos dados state, exclua as colunas "repetidas", i.e. colunas que contenham as mesmas informações
        #quantos estados possuem em cada região?
          state <- state[,!(colnames(state) %in% c("Area", "state.name" ))]
          
        #qual state.division possui a maior renda (`Income`)? E a menor?
          state[state$Income == 6315,"state.division"]
          state[state$Income == max(state$Income), ]
          state[state$Income == max(state$Income), c("state.division","state.name")]
          state[state$Income == max(state$Income),"state.division"]
          as.character(state[state$Income == max(state$Income),"state.division"])

        #as variáveis `Illiteracy` e `Murder` são correlacionadas?
          cor(state$Illiteracy, state$Murder)
          
        #considerando todas as colunas numéricas, qual é a mais correlacionada com a variável `Murder`?
          cor(state)
          cor(state[,!(colnames(state) %in% c("state.region","state.abb", "state.name", "state.division"))])
          
        #adicione uma coluna que tenha a contagem dos estados
          state <- data.frame(state, contagem = 1:nrow(state))
          
        #Visualize a versão final do dataset criado
          View(state)
          
# ::::: hands-on: exportação de base de dados -----
          
        #exporte os dados em um arquivo .csv
          write.csv(state, "base_exportada.csv")
          write.csv(state, "C:\\Users\\natyd\\Desktop\\base_exportada.csv")
        
        #em qual diretório o arquivo se encontra?
          getwd()
        
        #qual a função que altera o diretório
        #C:\\Users\\natyd\\Desktop
        setwd("C:/Users/natyd/Desktop")
        setwd()
        
        
        #delete o objeto state e releia o arquivo
        rm(state)
        state
        state <- read.csv("base_exportada.csv")
        state
        
# Importação/exportação -----
    #Com a função `write.table()`, tendo como parametros o nome do objeto a ser
    # exportado e o path desejado o arquivo é criado no diretório de trabalho. 
    #Para saber qual o diretório de trabalho corrente, utilizamos o comando 
        #`getwd()` (*get working directory*)
    #Enquanto que para alterar o diretório de trabalho temos a função 
        #`setwd()` (*set working directory*)
    
    #Alternativamente podemos especificar o destino do arquivo de interesse, 
    # precedendo o nome do arquivo com o diretório desejado, 
    # p.e.: `write.table(mtcars, file = "C:/Users/mtcars.txt")` 
    #note que para especificação de diretórios trabalhamos com:
      # barras simples `/` 
      # ou barra dupla `\\` 

    
    #para a leitura de arquivos: `read.table`
    #Tanto a função `write.table()` quanto a `read.table()`possuem uma série de parâmetros, 
    #permitindo especificações de separadores, títulos e comentários, 
    #além de variações de extenção
    #para consultar funções relacionadas pesquise os tópicos `??read` e `??write`.


# Projeto: arquivo .Rproj -----
    #Existe ainda uma terceira alternativa: trabalhar com a opção de projetos do RStudio (`.RProj`). 
    #Nesta, o diretório em que o arquivo `.RProj` estiver salvo, passa a ser a pasta raiz da análise. 
    #Para criar um projeto no RStudio, é necessário clicar no ícone superior à direita:
    
    #dica: use o pacote usethis::create_project()
        
# ::::: hands-on: criação de projetos -----
    # 1) crie um projeto em um novo repositório, 
    # 2) salve um script chamado "aula_2_hands_on.R" neste repo
    # 3) no script escreva um programa que tire uma amostra aleatória de tamanho 50 da base de dados iris, 
    #   considerando para tal a set.seed(1), visando garantir a reprodutibilidade dos resultados
    # 4) salve este novo data.frame em um arquivo .csv e o exclua do seu environment
    # 5) leia o arquivo .csv em um novo objeto, chamado iris_amostra
    # 6) rode uma análise estatística da base iris original e da base que vc criou
    #   você observou alguma mudança significativa?
    
        
# ::::: hands-on: importação de base de dados -----
  # zip o repositório criado e dê unzip em outra pasta
  # você deve conseguir rodar toda a sua análise sem necessitar alterar o código 
        
        
# ::::: Refs -----
            
  #	Point-and-click - Rbase
    # precisa instalar várias bibliotecas
    # install.packages("Rcmdr")
    # library(Rcmdr)

  # Na IDE do Rstudio investigue a aba `Tutorial` (precisa ter o RStudio mais recente)
    # (usualmente acima, à direita, próximo a aba `Environment`)
    #Note que ao iniciar algum dos tutoriais a aba `Jobs`, 
    # usualmente próxima a aba `Console`, ficará ocupada 
    # até que você feche o treinamento - clicando
    # no botão `stop`, da aba `Tutorial` ou `Jobs`
    #Note também que no fim do tutorial há um link
    # para a página de Tutorials da RStudio
    # Investigando está página, você encontrará o 
    # RStudio primers, que com vários tutoriais interativos
    
    # https://rstudio.cloud/learn/primers
            