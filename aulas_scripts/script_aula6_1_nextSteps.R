
# Introdução à Programação em R
# Nathália Demetrio


#ex. de projetos ------
    #portfólio R-ladies São Paulo: https://github.com/rladies/meetup-presentations_sao-paulo

    #dica: investigue outros capítulos do BR e do mundo! :)
    #https://rladies.org/

#tidyverse advanced ----- 
    #dplyr:: função across ----- 
    library(tidyverse)
      iris %>% summarise(across(everything(), mean))
      iris %>% summarise(across(where(is.numeric), mean))
      iris %>% summarise(across(contains("Sepal"), mean))
    
    
    #dplyr:: combinar bases com joins ----- 
      band_members
      band_instruments 
      
      left_join(band_members, band_instruments, by = "name")
      right_join(band_members, band_instruments, by = "name") 
      inner_join(band_members, band_instruments)
      full_join(band_members, band_instruments, by = "name") 
      
      #investigue o help dessas funções, e a variedade de parametros oferecidas

    
    #purrr:: programação funcional -----
      
      #https://purrr.tidyverse.org/
      
      titanic::titanic_train %>% glimpse
      
      starwars %>%
        purrr::map(is.na) %>% 
        purrr::map(sum) 
      
      starwars %>%
        select(where(is.character)) %>% 
        map(unique)
      
      list.files(path = "aulas/", pattern='*.csv') %>% 
        map(read_csv) %>% 
        walk(glimpse)
    
    
#EDA/data explore libraries -----
    #biblioteca skimr -----
        #https://cran.r-project.org/web/packages/skimr/vignettes/skimr.html 
        ?skimr::skim() 
  
      library(skimr)
      
      starwars %>% glimpse()
      starwars %>% skim()
    
      # podemos combinar o skimr com o group_by
      starwars %>% 
        group_by(gender) %>% 
        skim()
    

    #biblioteca janitor -----
        #https://cran.r-project.org/web/packages/janitor/vignettes/tabyls.html
      
        library(janitor)
      
        ?janitor::tabyl() 
        
        starwars %>%
          as_tibble() %>% 
          janitor::clean_names() %>% 
          janitor::tabyl(gender) %>% 
          janitor::adorn_pct_formatting(digits = 1, affix_sign = TRUE) %>% 
          janitor::adorn_totals(where = c("row","col")) %>% 
          janitor::adorn_percentages(denominator = "row") %>%
          janitor::adorn_pct_formatting(digits = 0) %>% 
          janitor::adorn_ns(position = "front")  
        
    #biblioteca inspectdf -----
      inspectdf::inspect_types(starwars) 
      inspectdf::inspect_num(starwars) 
            
    #biblioteca naniar -----
      naniar::miss_var_table(starwars)
      naniar::gg_miss_upset(starwars)
            
    #biblioteca visdat -----
      visdat::vis_guess(starwars)


#GGplot2/DataViz -----
    #biblioteca pont-and-click
    esquisse::esquisser() 

    # introdução em português
      #https://jonnyphillips.github.io/Ciencia_de_Dados/Graficos.html
  
    #consulta de gráficos e como fazer no R
      # https://www.data-to-viz.com/
      
    #lista de pacotes complementares:
      #https://github.com/krzjoa/awesome-r-dataviz
    
#Dashboards estáticos-----
    #Rmarkdown
      #https://rmarkdown.rstudio.com/lesson-1.html
      
    #Flexdashboard
      #https://rmarkdown.rstudio.com/flexdashboard
      
    #Quarto
      #https://quarto.org/

#Dashboards dinâmicos -----
    #Shiny
      #https://shiny.rstudio.com/tutorial/
      
      
#Machine Learning -----
  #Tidymodels
    #https://www.tidymodels.org/start/
#Inference  -----
  #Infer
    #https://infer.netlify.app/

#Interoperabilidade R e Python -----
    #Reticulate
      #https://rstudio.github.io/reticulate/ 
      #https://rstudio.github.io/cheatsheets/html/reticulate
    
      #para um passo-a-passo assista esta live da curso-r:
        #https://www.youtube.com/live/FnpKTXkmBRo?si=tjNVyzkd9VBc8iuE
#Comunidades -----
    #redes sociais 
      # procure pela hashtag #rstats
      # grupo telegram R-Brasil: https://t.me/rbrasiloficial
      # r-ladies: https://rladies-sp.org/
    
    