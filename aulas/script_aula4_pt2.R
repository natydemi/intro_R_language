
# Introdução à Programação em R
# Nathália Demetrio

    library(tidyverse)

# Tidying -----
    
    #https://tidyr.tidyverse.org/
  
    
    #case cheatsheet
        table4a %>% 
            gather(`1999`,`2000`, 
                   key = "year", value = "cases") %>% 
        ggplot(aes(x = year, y = cases)) +
            geom_boxplot()
    
    #case1 - who
        who 
        who %>% glimpse
        who %>% View
        
        who %>% 
            gather(-country, - iso2, -iso3, -year, key = "var", value = "cases" ) %>% 
            select(year) %>% 
            max()     

        
        table2 %>% 
            spread(type,count)
        
        who %>% 
            filter(iso3 == "AFG") %>% 
            gather(-(country:year), key = "var", value = "cases" ) %>%
            drop_na(cases) %>%
            spread(var, cases) %>% 
            View()
             
        dados_who <- who %>% 
            gather(-(country:year), key = "var", value = "cases" ) %>%
            drop_na(cases) 

        
    #case2 - world_bank_pop  
        world_bank_pop
        world_bank_pop %>% glimpse
        world_bank_pop %>% View
        
        dados_world_bank_pop <- world_bank_pop %>% 
            gather(-country, -indicator, key = "year", value = "value" ) %>% 
            mutate(value = round(value,0)) %>% 
            spread(indicator, value)

  #hands-on -----
      # replique TODOS os exemplos da cheatsheet do pacote tidyr
      # https://rstudio.cloud/learn/primers/4
# Importação -----

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
            
    #exercicio: consulte o help das funções: col_skip e col_double      
            
# Manipulação -----
            
    #https://dplyr.tidyverse.org/
    #https://lubridate.tidyverse.org/
    #https://forcats.tidyverse.org/
    #https://stringr.tidyverse.org/
            
            
    #case1 - who
        dados_who %>% 
            filter(country %in% c("South Africa", "Brazil")) %>% 
                group_by(country, year) %>% 
                summarise(`numero de linhas` = n(),
                          media_cases = mean(cases))

        #qual grupo com o maior número de casos, por ano
        dados_who %>% 
            filter(country == "South Africa") %>% 
            group_by(year) %>% 
            arrange(desc(cases)) %>% 
            slice(which.max(cases))

        #qual grupo com o maior número de casos, por ano 
        dados_who %>% 
            filter(country == "South Africa") %>% 
            group_by(year) %>% 
            arrange(desc(cases)) %>% 
            slice(1)
            
            
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
            
            
        #substituindo simbolos
            dados_gss_cat %>% 
                mutate(rincome = str_replace_all(rincome,"to","-")) %>% 
                select(rincome) %>% 
                as_vector() %>% 
                fct_count()
        
    #exercício: replique os exemplos das páginas do `dplyr`, `lubridate`, `stringr` e `forcats`
            
            
            
# Visualização -----
       
    #https://ggplot2.tidyverse.org/
    #https://rstudio.cloud/learn/primers/3
    #https://beatrizmilz.github.io/aMostra-IME-2019-DataVis/#33
            
    #ex. cheatsheet
        ggplot(mpg) +
            geom_point(aes(cty, hwy)) +
            geom_point(aes(cty,displ)) +
            geom_label(aes(cty, hwy, label = class))

            ggplot(mpg, aes(cty, hwy)) +
                geom_point() +
                geom_point() +
                geom_label(aes(label = class))
            
            a <- mpg %>% 
                mutate( binario = if_else(hwy <30, TRUE, FALSE)) %>% 
                ggplot(aes(cty, hwy, color = fl, stroke = binario)) +
                geom_point() + 
                facet_grid(.~binario)
                
            plotly::ggplotly(a)
            
    #case4 - diamonds
        diamonds %>% 
            
        set.seed(1)
        diamonds_new <- diamonds %>% sample_frac(0.03) 
        
        diamonds_new %>% 
            skimr::skim()
        
        ggplot(data = diamonds_new, mapping = aes(x = carat, y = price))
        
        
        diamonds_new %>%
            ggplot(aes(x = carat, y = price)) + 
            geom_point() + 
            geom_smooth() + 
            facet_grid(. ~  cut)
        
        
        
        
        
        diamonds_new %>% 
            ggplot(aes(x = cut,  y = price, color = cut)) + 
            geom_boxplot()
            
        diamonds_new %>% 
            ggplot(aes(x = cut, fill = color)) + 
            geom_bar(position = "fill")
            

# Comunicação -----
  # https://github.com/rladies/meetup-presentations_sao-paulo
  # https://rmarkdown.rstudio.com/lesson-1
        
# :::::::::::: Refs -----
        
  #Repo R-Ladies, alguns meetups recomendados: #1, #5 e #6:
    # https://github.com/rladies/meetup-presentations_sao-paulo