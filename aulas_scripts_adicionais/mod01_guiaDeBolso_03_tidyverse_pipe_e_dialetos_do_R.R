
# Guia de Bolso - tidyverse, Dados Tidy, Pipe (%>%) e Dialetos do R

# Introdução
# Neste script falaremos sobre o universo tidyverse, contextualizando conceitos 
# importantes, como: dados tidy, operador pipe e o ciclo de análise da Ciência
# de Dados. De maneira complementar (e opcional), são apresentadas algumas 
# comparações de uso dos três princípais dialetos do R para manipulação de dados,
# são eles: Rbase, tidyverse e data.table.


# ----- O tidyverse? -----

  # O tidyverse é um conjunto de bibliotecas que compartilham a 
  # mesma gramática, design e filosofia. No caso, o conceito de "dados tidy". 
  # De modo a garantir recursos para as mais diferentes tarefas que envolvem 
  # o Ciclo de Ciência de Dados. 

  # Para saber mais: https://www.tidyverse.org/


# O que são dados tidy?  -----
    
  # A filosofia tidy, é uma forma de vincular a estrutura de um  
  # conjunto de dados (seu layout físico) com sua semântica (seu significado).  
  # Para tal, temos que, independente da origem, características, problemas e 
  # layout dos dados, estes precisam ser organizados garantindo que:
    
    # cada variável/informação tenha a sua própria coluna;
    # cada observação/unidade de análise tenha a sua própria linha; e
    # que cada valor tenha a sua própria célula.
    
  # Apesar da simplicidade das premissas, respeitá-las permite um grande ganho 
  # em termos de produtividade de análise. Contudo, nem sempre é trivial obter  
  # esta estrutura. Ponto este, que o próprio ecossistema de pacotes do tidyverse   
  # nos auxilia, oferecendo uma série de recursos para a obtenção e manutenção 
  # de uma estrutura tidy. 

  # E para tangibilizar um pouco melhor estas ideias, seguem a lista de cinco 
  # problemas comuns encontrados em dados que não seguem os princípios tidy,
  # os ditos "messy-tidy" (dados bagunçados):
  
    # 1. O cabeçalho contém valores, e não o nome das variáveis;
    # 2. Diversas variáveis estão armazenadas na mesma coluna;
    # 3. Variáveis são armazenadas tanto em linhas, quanto em colunas;
    # 4. Diferentes tipos de unidades observacionais estão armazenadas em uma mesma tabela;
    # 5. Uma única unidade observacional está armazenada em diferentes tabelas.

    #material de referência: 
    #https://escoladedados.org/tutoriais/tidy-data-dados-arrumados-e-5-problemas-comuns/


  # Para mais informações no tema, recomendo a apresentação:
  # https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html
  # Já para um maior aprofundamento, recomendo a leitura do artigo escrito
  # pelo Hadley Wickham, idealizador do conceito de tidy e de tantos 
  # outros conceitos e ferramentas importantes da comunidade R: 
  # http://vita.had.co.nz/papers/tidy-data.pdf


# O que é o operador pipe? (%>%)  -----
  
  #O pipe é uma função com uma sintaxe um pouco diferente, no caso, 
  # o simbolo: %>%. Que permite o encadeamento de funções, de modo que o output, 
  # ou seja a saída de uma função, seja o input, a entrada, da função seguinte. 

  # Deste modo passamos a ter uma alternativa à leitura default do R, em que 
  # a sequência de operações lógicas são aplicadas de dentro para fora:
    # funçãoN(...(função2(função1(dados, args1), args2)...)argsN)

  # Com o pipe passamos a ter a aplicação de operações em sequência, ou seja:
    # dados %>% 
    #   função1(args1) %>% 
    #   função2(args2) %>% 
    #   ...
    #   funçãoN(argsN)

  # Muito mais legível, né?
  
  #Para trabalhar com o pipe, precisamos carregar um das bibliotecas que  
  # possuam esta função, no caso, o pipe foi originalmente introduzido no R 
  # por meio da biblioteca `magrittr`. Mas, atualmente, diversas bibliotecas 
  # garantem que o pipe seja utilizado.
  
    #exemplo 1 - uso simples
    library(magrittr)
    "olá, tudo bem" %>% print()
    
    
    #exemplo 2 - comparando resultados
    #criando base de exemplos 
    x <- 1:5

  # sem o pipe, isto é, seguindo a leitura default do R, de dentro para fora:
  floor(sqrt(sum(x)))
  
  # com o pipe, ou seja, a partir de uma leitura sequencial:
  x %>% 
    sum() %>% 
    sqrt() %>% 
    floor()
  
  #Assim, para além do claro ganho em termos de leitura, passamos a ter uma
  # análise mais modular, sendo possível alterar, remover ou inserir funções  
  # de maneira muito mais prática:
  
  x %>% 
    #sum() %>% 
    sqrt() %>% 
    floor() %>% 
    log()

  # DICA: o pipe ganhou tamanha importância no R, que passou a ser uma função  
  # nativa do R para versões mais recentes. Tendo como diferença mais marcante 
  # a sua alteração de layout: |> ao invés de %>%
  # Mas para utilizar tal recurso built-in no RStudio, é necessário indicar o 
  # interesse nas configurações da IDE (ao menos na versão que estou utilizando
  # hoje, que é a RStudio 2022.07)
  # Para tal acesse: `Tools > Global Options > Code` e dê o check na opção
  # `use native pipe operator |>`, note que para tal é necessário que você 
  # esteja utilizando o R na versão 4.1 ou maior.
  
  # Contudo, conforme comentado, diversos pacotes, inclusive, o tidyverse, 
  # abraçaram o uso do pipe. Se o pacote tiver qualquer referência ao universo 
  # tidy, é quase certo que terá o pipe "raiz" (%>%) automaticamente importado. 
  # De modo que juntamente com o conceito de `dados tidy`, temos os pilares 
  # que formam o universo tidyverse!



# Quais bibliotecas que compõem o tidyverse? -----

  #O tidyverse é um meta pacote, ou seja, é um pacote que contém pacotes. 
  # Assim, ao instalar o tidyverse você estará também instalando uma série 
  # de outras bibliotecas, como: lubridate para trabalhar com datas, ou ainda 
  # readxl, httr, ou xml2 para importar tipos específicos de dados. 
  
  #Para conhecer as bibliotecas instaladas junto ao tidyverse:
  
  install.packages("tidyverse")
  tidyverse::tidyverse_packages()
  
  #Para saber um pouco mais sobre algum dos pacotes, você pode pesquisar
  # diretamente no navegador, ou por meio do help:
  ?haven
  
  #Contudo, ao carregar o meta-pacote tidyverse, você observará na mensagem que 
  # apenas algumas das bibliotecas são carregadas, as bibliotecas core:
  
  library(tidyverse)
  
  #Isto porque as demais bibliotecas, apesar de instaladas, só serão carregadas
  # caso você o faça manualmente, no caso, as `non-core packages`. Para ter 
  # uma visão geral dos pacotes, podemos consultar: 
  
  tidyverse::tidyverse_sitrep()
  
  #Para aprender mais sobre o universo do tidyverse, existem muitas referências 
  # e materiais interessantes disponíveis na página oficial do pacote:
  # https://www.tidyverse.org/ 



# tidyverse e o Ciclo de Análise da Ciência de Dados -----

  # As bibliotecas que compõem o tidyverse podem ser organizadas ao redor das  
  # etapas que compõem o Ciclo de Análises da Ciência de Dados, proposto por
  # Hadley em seu livro `R for Data Science`: 
  # https://r4ds.had.co.nz/explore-intro.html
  
  # No caso, temos as ações: ler e arrumar os dados (isto é, deixá-lo em uma
  # estrutura tidy), e então entramos em um circuito de transformar, visualizar 
  # e modelar os dados, considerando a quantidade de repetições necessárias,  
  # e, por fim, o ato de comunicar os resultados obtidos.
  
  # Note que aspectos como deploy e manutenção de modelos não estão sendo 
  # considerados neste flow. Isto porque, apesar da incontextável importância, 
  # tais fases tendem a priorizar outros aspectos como: performance, 
  # monitoramento, códigos gerenciáveis, infra, integrações com sistemas, enfim,
  # habilidades que não necessariamente garantem uma boa análise de dados. 
  # Enquanto que para o ciclo pontuado acima, temos o entendimento do dado, 
  # bem como a modelagem do problema como objetivos centrais. Mas perceba: 
  # não se trata de uma competição: AMBAS as abordagens são importantes! Você
  # pode, e deve, procurar evoluir em outros campos de habilidades, OU procurar 
  # trabalhar em times multidisciplinares, em que com a soma das habilidades, 
  # sejam garantidas entregas à lá UNICÓRNIO :)
  
  #Voltando ao tidyverse, temos a implementação deste ciclo de ações por meio
  # da coleção de pacotes do tidyverse:
  # readr: leitura dos dados
  # tibble: opções para tratar estruturas de dados tidy
  # tidyr: reformulação de layout dos dados
  # dplyr: manipulação/transformação de dados
  # ggplot2: criação de gráficos
  # purrr: programação funcional
  # forcats: operações com variáveis categoricas
  # stringr: operações com strings
  
  #Adicionalmente, existem algumas bibliotecas que, apesar de não serem  
  # carregadas juntamente com os pacotes listados acima, são instaladas, estando 
  # à disposição para uso:
  
  # readxl: leitura e escrita de arquivos .xls e .xlsx
  # haven: leitura e escrita de arquivos SPSS, Stata, e SAS
  # lubridate: operações para trabalhar com datas
  # reza a lenda que este pacote passará para a primeira lista
  # até a versão 1.3.2 do tidyverse isto não ocorreu, mas cada nova 
  # versão, uma nova esperança! (sim, eu adoro esse pacote ;p)
  # broom: resume informações de modelagem de forma estruturada
  # knitr: relatórios dinâmicos
  
  # Lembrando que para utilizar as funções de tais bibliotecas é necessário 
  # carregar o pacote individualmente. Ou, alternativamente, chamar a função 
  # de interesse especificamente, por meio de comandos como: 
  
  #readxl::readxl_example() 
  #ou 
  #lubridate::date()    
  
  #Observação: você pode ter sentido falta de pacotes relacionados à etapa de
  # modelagem, e existem algumas razões para isso, mas vou focar em uma: 
  # existe um pacote chamado tidymodels que super resolve isso, falaremos 
  # dele mais à frente no curso :)


# ----- Dialetos para Manipulação de Dados no R -----

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



# Por que seguiremos com o tidyverse? -----
# Tanto pela legibilidade dos códigos quanto pela comunidade madura, que 
# atualmente é a maior do R. Assim, independente da introdução que será 
# feita neste curso, você poderá contar com um farto menu de conteúdos à 
# disposição para poder seguir evoluindo na linguagem R :)


# ----- > TÓPICOS AVANÇADO -----
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


# ----- > MÃO NA MASSA! -----

  # Uma das difereças ao se trabalhar com o universo tidyverse é que temos o  
  # tibble como alternativa ao data.frame. Vamos entender um pouco mais sobre 
  # os ganhos? 
    #link: https://livro.curso-r.com/7-1-tibbles.html 
  # Aproveita e salva essa referência! A galera da curso-R constrói
  # materiais incríveis, vale muito a pena mante-los no radar ;)
  
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
  
