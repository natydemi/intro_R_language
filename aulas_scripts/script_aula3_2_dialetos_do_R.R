
# Introdução à Programação em R
# Nathália Demetrio

# Introdução
# Neste script são apresentadas algumas comparações de uso dos três 
# princípais dialetos do R para manipulação de dados, são eles: 
# Rbase, tidyverse e data.table.


# Dialetos para Manipulação de Dados no R -----

  # Existem três importantes opções de sintaxes para manipulação de dados no R:
  
  # Rbase
    #não é necessário instalar ou carregar nenhuma biblioteca
    
      #Refs: a seção de exemplos do help
      ?`[.data.frame`

# tidyverse: 
install.packages("tidyverse")
library(tidyverse)
    
      #Refs.: 
      ?tidyverse::tidyverse	
      ??tidyverse   
  
  # data.table
    install.packages("data.table")
    library(data.table)
  
      #Refs
      ?data.table::datatable-intro	
      ??data.table

    
# Comparando as sintaxes: Rbase, tidyverse e data.table -----

  # A partir daqui serão listados alguns dos comandos mais usuais relacionados
  # a manipulação de dados, considerando a ordem:
  # 1. Rbase
  # 2. tidyverse 
  # 3. data.table
      
  # Importante comentar que mesmo dentro de cada uma destas sintaxes existem
  # outras maneiras de executar a mesma ação e obter o mesmo resultado. 
  # O objetivo aqui não é listar todas as alternativas existentes, mas sim
  # dar visibilidade das principais diferenças.

# Lendo arquivos .csv -----
  #read.csv, read_csv e fread
  
  #read.csv("nome_arquivo_fake.csv")
  #read_csv("nome_arquivo_fake.csv")
  #fread("nome_arquivo_fake.csv")

# Classes de dados compatíveis -----
  #data.frame, tibble (tbl_df) e data.table
  
  (dados_rbase <- data.frame(col1 = c(1,2,3), col2 = c("a","b","a"), col3 = c(10, 20, 30))) 
  class(dados_rbase)
  
  (dados_tidyverse <- tibble(col1 = c(1,2,3), col2 = c("a","b","a"), col3 = c(10, 20, 30)))
  class(dados_tidyverse)
  
  (dados_data_table <- data.table(col1 = c(1,2,3), col2 = c("a","b","a"), col3 = c(10, 20, 30)))
  class(dados_data_table)

    #DICA: note que ao colocar parenteses ao redor do comando de atribuição, 
    # além da atribuição em si (criação do objeto), temos também o retorno
    # do objeto criado.


# O que é um tibble? (vs. data.frame)  -----

  # A estrutura default do R mais usual para análise de dados, e para dados 
  # tidy de maneira geral, são os `data.frames`. Porém, as bibliotecas do 
  # ecossistema tidyverse consideram uma estrutura alternativa, que apesar de
  # na prática ser bastante equivalente, trata-se de uma versão mais moderna, 
  # chamada tibble, ou, por vezes, identificada como tbl_df.
  
  # Tal estrutura é originalmente disponibilizada a partir da biblioteca 
  # com o mesmo nome, tibble, um dos pacotes default do tidyverse. 
  
  # Vamos agora comparar a diferença entre as duas estruturas:

  (teste_DF <- data.frame(x = letters, y = LETTERS))

  #vs.

  library(tibble)
  (teste_T <- tibble(x = letters, y = LETTERS))
  
  # Note que a visualização que temos com o tibble não apenas é mais concisa 
  # (em relação à quantidade de linhas) mas também mais descritiva que a 
  # visualização original, adicionando a informação do tipo de cada coluna. 
  # Adicionalmente, questões como performance e consistência também apresentam 
  # melhorias em comparação aos data.frames.



# Selecionando colunas (por nome) -----
  #[ , ...], select()	e [ , .(...) , ]
  
  dados_rbase[ , c("col1", "col3")]
  
  dados_tidyverse %>% select(col1, col3)
  
  dados_data_table[ , .(col1, col3)]
  
  #ATENÇÃO: no data.table, quando não utilizamos os últimos campos, os 
  # campos à direita, não é necessário adicionar a vírgula. A vírgula é 
  # obrigatória apenas para os campos à esquerda. 


# Selecionando colunas (por posição da coluna) -----
  #[ , ...], select()	e [ , ... , ]
  
  dados_rbase[ , c(1,3)]
  
  dados_tidyverse %>% select(1, 3)
  
  dados_data_table[ , c(1, 3)]


# Selecionando linhas (por posição) -----
  #[... , ], slice() e	[... , , ]
  
  dados_rbase[c(1,3), ]
  
  dados_tidyverse %>% slice(1,3)
  
  dados_data_table[c(1,3)]


# Selecionando linhas (pelo valor das colunas) -----
  #[... , ], filter() e	[... , , ]
  
  dados_rbase[dados_rbase$col3 >= 20, ]
  
  dados_tidyverse %>% filter(col3 >= 20)
  
  dados_data_table[col3 >= 20]


# Criando novas colunas -----
  #df$y = ..., mutate(tb, y = ...) e [ , y := ..., ]
  
  dados_rbase$col4 <- dados_rbase$col3 / 5 
  dados_rbase
  
  dados_tidyverse <- dados_tidyverse %>% mutate(col4 = col3 / 5)
  dados_tidyverse
  
  dados_data_table[ , col4 := col3 / 5]
  dados_data_table


# Excluindo colunas -----
  #df$y = NULL, select(tb, -y) e [ , y := NULL]
  
  dados_rbase$col4 <- NULL
  dados_rbase
  
  dados_tidyverse <- dados_tidyverse %>% select(-col4)
  dados_tidyverse
  
  dados_data_table[ , col4 := NULL]
  dados_data_table


# Criando sumarizações -----
  #apply(df[ , y], 2, ...), summarise()	e [ , ...(y), ]
  
  apply(dados_rbase[ , c("col1","col3")], 2, max)
  
  dados_tidyverse %>% summarise(max_col1 = max(col1), max_col3 = max(col3))
  
  dados_data_table[ , .(max_col1 = max(col1), 
                        max_col3 = max(col3))]


# Criando sumarizações por grupo -----
  #aggregate(), group_by() e	[ , , by = ...]
  
  aggregate(dados_rbase[,'col1'], by = list(dados_rbase$col2), sum) 
  
  dados_tidyverse %>% group_by(col2) %>% summarise(col5 = sum(col1))
  
  dados_data_table[ , .(col5 = sum(col1)), by = col2 ] 



# Pivotagem (de colunas para linhas) -----
  #reshape(), pivot_longer() e	melt()

# Pivotagem (de linhas para colunas) -----
  #reshape(), pivot_wider() e dcast()

# Combinando tabelas -----
  #merge(), left_join() e DT1[ DT2, on = ...]

# disclaimer sobre as opções apresentadas -----
  # Como dito inicialmente, esta lista não contempla todas as diferentes 
  # maneiras de escrever cada uma das ações acima. A proposta aqui se limita
  # a compartilhar uma visão inicial sobre cada uma das sintaxes.


# ::::: MÃO NA MASSA! -----

  # No repositório abaixo temos a comparação entre os dialetos:
  # https://github.com/mayer79/data_preparation_r
  # que tal passar lá e dar uma revisada? 
  
  
  # data.table + tidyverse (dplyr)
  # existe um pacote chamado dtplyr que fornece um backend data.table para
  # o pacote tidyverse — mais especificamente para o pacote dplyr do tidyverse.  
  # Deste modo podemos escrever um código dplyr e este será traduzido para  
  # o código data.table. Garantindo os ganhos de legibilidade 
  # do dplyr, com a superioridade de performance do data.table. 
  # A tarefa aqui é: baixar este pacote e rodar alguns dos exemplos do link
  # https://dtplyr.tidyverse.org/
  
