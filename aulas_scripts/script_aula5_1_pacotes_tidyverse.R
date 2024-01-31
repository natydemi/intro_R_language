
# Introdução à Programação em R
# Nathália Demetrio

    library(tidyverse)

# Tidying (library tidyr) -----
    
    #https://tidyr.tidyverse.org/
    
    #Redimensionamento de dados - exemplos da cheatsheet
    #case1 - table4a
    
    table4a %>% 
      pivot_longer(cols = 2:3,
                   names_to = "year",
                   values_to = "cases") 
    
    #note como ao fazer tal redimensionamento, 
    # também conhecido pivotagem, a aplicação de algumas funções
    # passa a ser mais mais fluída.
    # Como neste exemplo de ggplot: 
    table4a %>% 
      pivot_longer(cols = 2:3,
                   names_to = "year",
                   values_to = "cases") %>%
      ggplot(aes(x = year, y = cases)) +
      geom_boxplot()
    
    # OBS: a função pivot_longer chamava gather em versões anteriores
    
    #case2 - who
    who 
    who %>% glimpse
    
    who %>% 
      pivot_longer(cols = contains("new")) %>% 
      glimpse()   
    
    #podemos agora ver qual a linha com maiores valores
    who %>% 
      pivot_longer(cols = contains("new")) %>% 
      slice_max(value)   
    
    
    #case3 - world_bank_pop 
    
    #note como podemos usar a pivotagem para facilitar a 
    #aplicação de calculos de interesse
    world_bank_pop
    world_bank_pop %>% glimpse
    
    dados_world_bank_pop <- world_bank_pop %>%
      pivot_longer(cols = -(1:2), names_to = "year") %>%
      mutate(value = round(value,0)) %>%
      pivot_wider(names_from = year) 
    
    #exercício: replique os exemplos da cheatsheet
    #https://rstudio.github.io/cheatsheets/html/tidyr.html
    
    # Importação (library readr) -----
    
    #https://readr.tidyverse.org/
    
    #case2 - world_bank_pop
    #export
    dados_world_bank_pop %>%
      write_csv("dados_world_bank_pop.csv")
    #ou write_csv(dados_world_bank_pop, "dados_world_bank_pop.csv")
    
    #excluindo dataset
    rm(dados_world_bank_pop)
    dados_world_bank_pop
    
    #import
    dados_world_bank_pop <- read_csv("dados_world_bank_pop.csv", 
                                     col_names = T,
                                     cols(
                                       country = col_character(),
                                       year = col_date(format = "%Y"),
                                       SP.POP.GROW = col_skip(),
                                       SP.POP.TOTL = col_double(),
                                       SP.URB.GROW = col_double(),
                                       SP.URB.TOTL = col_double()
                                     ))
    #ou "dados_world_bank_pop.csv" %>% read_csv(col_names = TRUE)
    
    #hands-on: consulte o help das funções: col_skip e col_double, o que elas fazem? 
    #exercício: replique os exemplos da cheatsheet
    #https://rstudio.github.io/cheatsheets/html/data-import.html      
    
    
    # Manipulação (library dplyr) -----
    
    #https://dplyr.tidyverse.org/
    
    #case1 - who
    dados_who <- who %>% 
      pivot_longer(cols = contains("new"), values_to = "cases") 
    
    dados_who %>%
      filter(country %in% c("South Africa", "Brazil")) %>%
      group_by(country) %>%
      summarise(`numero de linhas` = n(),
                media_cases = mean(cases, na.rm = T))
    
    #qual grupo com o maior número de casos, por ano
    dados_who %>% 
      filter(country == "South Africa") %>% 
      group_by(year) %>% 
            arrange(desc(cases)) %>% 
            slice(which.max(cases))
        

        #qual grupo com o maior número de casos, por ano 
        dados_who %>% 
            filter(country == "Canada") %>% 
            group_by(year) %>% 
            arrange(desc(cases)) %>% 
            slice(1)
            
    #exercício: replique os exemplos da cheatsheet
      #https://rstudio.github.io/cheatsheets/html/data-transformation.html
        
        
  # datas (library lubridate) -----
      
      #https://lubridate.tidyverse.org/
      
      #case2 - world_bank_pop 
          #todos os paises tem dados iniciados e terminados no mesmo ano?
          dados_world_bank_pop %>% 
              mutate(year = as.Date(year, "%Y")) %>% 
              group_by(country) %>% 
              summarise(periodo_min = min(year),
                        periodo_max = max(year)) %>% 
              #mutate(periodo_min = lubridate::year(periodo_min),
              #       periodo_max = lubridate::year(periodo_max))
              mutate_at(vars(matches("periodo_")), lubridate::year) %>% 
              distinct(periodo_max)
  
          
      #exercício: replique os exemplos da cheatsheet
        #https://rstudio.github.io/cheatsheets/html/lubridate.html
        
          
  # fatores (library forcats) -----
    
    #https://forcats.tidyverse.org/
  
      #case3 - gss_cat
          dados_gss_cat <- forcats::gss_cat
          dados_gss_cat %>% glimpse
          
          #count
              dados_gss_cat %>% 
                  group_by(rincome) %>% 
                  summarise(n())
              
              #ou        
              dados_gss_cat$rincome %>% fct_count()
              dados_gss_cat$rincome %>% fct_unique()
  
          #transformando em um vetor ordenado
              is.ordered(dados_gss_cat$rincome)
              
              dados_gss_cat$rincome <- as.ordered(dados_gss_cat$rincome)
          
              is.ordered(dados_gss_cat$rincome)
              
              #invertendo ordem
              dados_gss_cat$rincome %>% fct_count()
              dados_gss_cat$rincome <- fct_rev(dados_gss_cat$rincome)
              dados_gss_cat$rincome %>% fct_count()
              dados_gss_cat$rincome <- dados_gss_cat$rincome %>% fct_shift()
              dados_gss_cat$rincome %>% fct_count()
              
      #exercício: replique os exemplos da cheatsheet
        #https://rstudio.github.io/cheatsheets/html/factors.html     
              
  # characters (library stringr) -----
      
      #https://stringr.tidyverse.org/
              
      #substituindo simbolos
          dados_gss_cat %>% 
              mutate(rincome = str_replace_all(rincome,"to","-")) %>% 
              select(rincome) %>% 
              as_vector() %>% 
              fct_count()
          
      #exercício: replique os exemplos da cheatsheet    
        #https://rstudio.github.io/cheatsheets/html/strings.html  
              
              
# Visualização (ggplot2) -----

  #https://ggplot2.tidyverse.org/
  
   #para trabalhar via point and click
   #instalar a biblioteca esquisser, e carregar a janela
      esquisse::esquisser()
        
        #ex de código copiado a partir do exercício de demonstração  
        # da ferramenta feito em sala de aula 
        library(dplyr)
        library(ggplot2)
        
        dplyr::starwars %>%
          filter(!is.na(height)) %>%
          filter(!is.na(mass)) %>%
          filter(!is.na(hair_color)) %>%
          ggplot() +
          aes(x = mass, y = height, colour = eye_color) +
          geom_point(shape = "square", 
                     size = 1.5) +
          scale_color_hue(direction = 1) +
          labs(caption = "gráfico aleatório feio") +
          ggthemes::theme_excel() +
          facet_wrap(vars(gender))
        
    #exercício: faça os exercícios da seção "Visualize Data"
      # https://posit.cloud/learn/recipes 
        
        
# Comunicação (Rmarkdown) -----
        
  #R Markdown é script com formato (.Rmd) que nos possibilita trabalhar 
  #com códigos, assim como um script usual .R. Contudo aqui temos a 
  #possibilidade de adicionar textos e visualizar os outputs dos códigos, 
  #de maneira mais interativa. Permitindo uma maior praticidade durante a análise. 
  #Além disso o Rmarkdown pode ser compilado, de modo que o produto final seja 
  #salvo como um arquivo HTML , PDFs, Word, slides, entre outros. 
        
  #E como criar? Dentro do RStudio, clique no menu:
        #`Arquivo -> Novo Arquivo -> R Markdown...`
        
  #Uma janela pop-up será aberta , dê um 'Título' ao documento e insira as 
  # informações do 'Autor' (seu nome) e selecione a saíde de interesse 
  # (o HTML é a saída padrão) – você poderá  mudar tudo isso mais tarde, 
  # então não se preocupe.
        

  #exercício: explore a aba "Get Start" do site:
        #https://rmarkdown.rstudio.com/

          
#  ::::: Refs -----
        
  #Repo R-Ladies, alguns meetups recomendados: 
    # https://github.com/rladies/meetup-presentations_sao-paulo
        
      #6 - MeetUp da R-Ladies São Paulo - Oficina de R - Intermediário
      # aqui tem um review de muito do que discutimos no curso:
        #https://beatrizmilz.github.io/2019-02-R-Interm-R-LadiesSP/#1
          #ggplot: https://beatrizmilz.github.io/2019-02-R-Interm-R-LadiesSP/#51
          #rmarkdown: https://beatrizmilz.github.io/2019-02-R-Interm-R-LadiesSP/#83 
        