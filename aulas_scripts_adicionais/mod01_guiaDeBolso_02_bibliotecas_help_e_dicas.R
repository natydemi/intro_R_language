
# Guia de Bolso - Bibliotecas, Helps e Fontes de Pesquisa no R

# Introdução
# Este script apresenta uma revisão sobre bibliotecas e dicas 
# sobre como fazer pesquisas relacionadas à linguagem R. 

# ----- Bibliotecas -----

# O que são? -----
  #Bibliotecas são uma coleção de: funções, dados e códigos compilados.
  
  #Dado que uma função é um conjunto de instruções organizadas, visando
  # a execução de uma tarefa, podemos fazer uma analogia das bibliotecas 
  # com o papel que os livros assumem na nossa vida. Isto porque os livros  
  # nos permitem acessar conhecimentos relacionados a um tópico de interesse.
  
  #É por meio das bibliotecas que ganhamos poder de fogo no R! Em 2022, apenas
  # no repositório oficial da linguagem (CRAN), existem + de 18K bibliotecas!!!


# Como consultar, instalar e acessar -----

  #No RStudio podemos consultar as nossas bibliotecas na aba `Packages`.
  
  #Para instalar uma biblioteca, também chamado de pacote, 
  # utilizamos o comando: `install.packages("nome_do_pacote")`
  install.packages("praise")  
  
  #Após a instalação, precisamos acessar o pacote desejado, 
  # por meio do comando `library(nome_do_pacote)`
  
  library(praise)
  
  #DICA: para instalar precisamos das aspas, para carregar, não
  # é possível também carregar uma biblioteca com a função require().

# Mais sobre o uso -----

  #Uma vez que a biblioteca esteja instalada, não é necessário carregar todas 
  # as funções da biblioteca, sendo suficiente utilizar o seu nome, seguido 
  # por `::` e a função desejada, ou seja, algo como: 
    # nome_da_biblioteca::função_de_interesse()
  
    dplyr::band_members
  
  #Inclusive está é uma boa prática em termos de programação, por evitar
  # problemas com funções homônimas, ou seja, funções que compartilham o mesmo 
  # nome, mas possuem comportamentos distintos (e são provenientes de 
  # bibliotecas diferentes).
  
  #DICA: com `nome_da_biblioteca::` podemos consultar as funções da biblioteca

# Mais sobre a instalação -----

  #Nos seus códigos, uma prática comum é manter um comando para instalar
  # as bibliotecas utilizadas no seu script, no caso destas ainda não 
  # terem sido instaladas
  
  if(!require("dplyr")) install.packages("dplyr")
  
  
  #A rede de distribuição oficial de bibliotecas do R se chama CRAN, 
  # mas existem também bibliotecas disponibilizadas via repositórios como 
  # o Bioconductor, o GitHub, ou mesmo via .zip
  
  #exemplos
    #instalação do pacote a partir do CRAN
    install.packages("dplyr")
    
    #instalação a partir do git (versão mais recente da biblioteca)
    devtools::install_github("tidyverse/dplyr")
      #é comum que as versões mais recentes das bibliotecas oficiais (ou seja,
      # disponíveis no CRAN), mas ainda estão em fase de testes, ou que (ainda)  
      # não tenham passado por todos os prerequisitos para entrar no CRAN (os 
      # testes são bem rigorosos!), sejam disponibilizadas via github.
    
    #instalação a partir de um arquivo .zip
    install.packages("C:/Users/dplyr.zip", repos = NULL)


  #Quanto às atualizações das bibliotecas, algo que faz parte da constante
  # evolução da linguagem, podemos utilizar o código: `update.packages()`, 
  # ou reinstalar os pacotes que temos interesse em atualizar. 
  #Para consultar quais pacotes estão desatualizados: `old.packages()`.
  
  #DICA: para checar quais bibliotecas estão instaladas: além da aba `Packages`
  # do RStudio, podemos também utilizar o comando: `installed.packages()`.            

  #ATENÇÃO: Ao atualizar o R, por default, você irá “perder” as bibliotecas 
  # já instaladas no seu computador, sendo necessário fazer as instalações 
  # novamente. Isto porque não há garantia que as bibliotecas funcionem com 
  # a nova versão do R – um comportamento usual em qualquer linguagem de 
  # programação. Para consultar a versão dos seus pacotes: sessionInfo()
  

# ----- Helps, como pedir Socorro!  -----     

# Como pesquisar funções -----

  #Uma maneira de fazer pesquisas é por meio da função: `help()` ou `?`
  # ou ainda via point-and-click, no painel `Help` do RStudio: 
  help("praise")
  ?praise
  
  #Apenas funções de bibliotecas carregadas estarão disponíveis 
  # para busca, como alternativa use:
  ?praise::praise()
  
  #DICA: posicione o cursor na função que você tem interesse em 
  # pesquisar a respeito, e digite F1 para abrir a aba `Help`.
  
  #No caso de consultas que envolvam objetos com caracteres especiais, 
  # é necessário que o texto esteja entre crases.
  ?`?`
  
  #Podemos também pesquisar por tópicos de modo mais geral, para além das
  # funções, por meio de: `help.search()` ou `??`.
  ??median

  # DICA: em relação aos erros que casualmente você irá encontrar, não se 
  # assuste! É comum que algo dê errado (seja você iniciante ou usuário de 
  # longa data). Ao receber uma mensagem de erro procure ler esta com atenção, 
  # abstraindo possíveis termos que você não conheça. Mesmo não se prendendo 
  # aos detalhes, você poderá ter uma indicação sobre qual a fonte do problema,
  # seja para corrigi-lo diretamente, seja para buscar ajuda :)
    
  #Para pesquisas externas de forma geral (erros, bibliotecas, etc), 
  # é importante que você: escreva a letra `R` antecedendo as palavras-chave 
  # da busca, e evite frases muito elaboradas. E, a partir dos resultados 
  # obtidos, você pode refinar a sua pesquisa original, adicionando ou
  # excluindo palavras. Se você puder fazer a pesquisa em inglês, encontrará mais materiais!
  
  #Na página do tidyverse, você encontrará materiais sobre como criar exemplos 
  # reprodutíveis para facilitar o compartilhamento da sua dúvida, seguido
  # de algumas sugestões de onde encontrar ajuda: https://www.tidyverse.org/help/#reprex 
    

# ----- > MÃO NA MASSA -----
    
  #Para aumentar o seu leque de bibliotecas e funções: vá na página de 
  # cheatsheets do RStudio, lá você encontrará uma excelente curadoria!
    # https://posit.co/resources/cheatsheets/ 
  #Ah, algumas das cheatsheets podem ser encontradas pela IDE da RStudio
  #na opção `Help` da barra de tarefas do menu superior.
  
  #Para praticar: investigue a aba `Tutorial` na IDE do RStudio
    # Note que ao iniciar algum dos tutoriais a aba `Jobs`ficará ocupada,
    # até que você feche o treinamento. Para isso você precisa clicar no botão 
    # vermelho `stop`, da aba `Tutorial` ou `Jobs`. Note também que no fim do
    # tutorial há um link para a página de Tutoriais da RStudio, nesta página
    # você encontrará o RStudio primers, com vários tutoriais interativos: 
    # https://posit.cloud/learn/recipes
    
  #Existe um conceito muito bacana no R, são os addins: 
  # leia mais sobre neste post : 
    #https://leticiaraposo.netlify.app/post/addin/
  #mas melhor que isso, instale a seguinte biblioteca: 
    # install.packages("packagefinder")
  # e então consulte os resultados no Menu `Addins`.
