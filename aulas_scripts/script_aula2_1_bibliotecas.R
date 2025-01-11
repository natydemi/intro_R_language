
# Introdução à Programação em R
# Nathália Demetrio


# Bibliotecas -----
  #Bibliotecas tratam-se de uma coleção de funções, dados e códigos compilados
  #A instalação destas bibliotecas/pacotes, pode ser feita pelo comando 
  #`install.packages("nome_do_pacote")`
  #Após a instalação é necessário apenas carregar os pacotes desejados, 
  #por meio do comando `library(nome_do_pacote)`

  install.packages("praise")
  library(praise)
  #require(praise)
  
  praise::praise()

    
  #Tais bibliotecas se encontram disponíveis pela rede de distribuição 
  # oficial do R, o CRAN. Mas existem também bibliotecas disponibilizadas 
  # via repositórios como o Bioconductor, GitHub, ou mesmo via .zip
  
  #exemplo
    #instalação do pacote a partir do CRAN
    install.packages("dplyr")
    
    #instalação a partir do git (versão mais recente da biblioteca)
    devtools::install_github("tidyverse/dplyr")
    
    #instalação a partir de um arquivo .zip
    install.packages("C:/Users/dplyr.zip", repos = NULL)
  
  #Uma vez que a biblioteca esteja instalada, não é necessário carregar 
  # toda a biblioteca sendo suficiente utilizar o nome da biblioteca, 
  # seguido por `::` e a função desejada, no caso:
    #nome_da_biblioteta::função_de_interesse()
  
  #exemplo
    dplyr::band_members
  
  #Para checar quais bibliotecas estão instaladas: aba `Packages` do RStudio, 
  # ou `installed.packages()`. As atualizações das bibliotecas podem ser 
  # feitas para todas as bibliotecas com `update.packages()`
  # ou reinstalando o pacote de interesse - para consultar quais estão 
  # desatualizadas temos `old.packages()`.
  
# ::::: Refs ----- 
  #link bibliotecas: https://cran.r-project.org/web/views/
  #link para consultar bibliotecas: https://r-universe.dev/