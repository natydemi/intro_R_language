
# Introdução à Programação em R
# Nathália Demetrio

    library(tidyverse)

# Tidying -----
    
    #https://tidyr.tidyverse.org/
    
    
    #case cheatsheet 
        table4a %>% 
            pivot_longer(cols = 2:3,
                         names_to = "year",
                         values_to = "cases") 
      
        #note como ao fazer tal pivotagem, passamos a 
        #poder utilizar o ggplot de forma mais fluída
        table4a %>% 
        pivot_longer(cols = 2:3,
                     names_to = "year",
                     values_to = "cases") %>%
        ggplot(aes(x = year, y = cases)) +
            geom_boxplot()
        
        # OBS: a função pivot_longer chamava gather em versões anteriores
    
    #case1 - who
        who 
        who %>% glimpse

        who %>% 
            pivot_longer(cols = contains("new")) %>% 
            glimpse()   
        
        #podemos agora ver qual a linha com maiores valores
        who %>% 
          pivot_longer(cols = contains("new")) %>% 
          slice_max(value)   
        
        
    #case2 - world_bank_pop 
    
      #note como podemos usar a pivotagem para facilitar a 
      #aplicação de calculos de interesse
        world_bank_pop
        world_bank_pop %>% glimpse

        dados_world_bank_pop <- world_bank_pop %>%
          pivot_longer(cols = -(1:2), names_to = "year") %>%
          mutate(value = round(value,0)) %>%
          pivot_wider(names_from = year) 

  #hands-on
      # faça os exercícios sobre tidy do RStudio Learn
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
            
  #hands-on: consulte o help das funções: col_skip e col_double, o que elas fazem? 
            
            
            
# Manipulação (dplyr) -----
            
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
        
  # datas (lubridate) -----
      
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
          
  # fatores (forcats) -----
    
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
              
              
  # characters (stringr) -----
      
      #https://stringr.tidyverse.org/
              
          #substituindo simbolos
              dados_gss_cat %>% 
                  mutate(rincome = str_replace_all(rincome,"to","-")) %>% 
                  select(rincome) %>% 
                  as_vector() %>% 
                  fct_count()
          
      #exercício: replique os exemplos da cheatsheet    
              
              
# Visualização (ggplot2) -----

  #https://ggplot2.tidyverse.org/
  #https://beatrizmilz.github.io/aMostra-IME-2019-DataVis/#33
              
  #livros/blogs
    #excelente onboarding em portugues
      #https://jonnyphillips.github.io/Ciencia_de_Dados/Graficos.html
    #referencia oficial do pacote
      #https://ggplot2-book.org/index.html
    #foco nos comandos mais essenciais do ggplot2
      #http://www.cookbook-r.com/Graphs/
    #onboarding não apenas no ggplot mas em princípios de dataviz e no próprio R
      #https://socviz.co/index.html#preface
    #como organizar as ideias em torno de objetivos de análise + comandos ggplot
      #https://clauswilke.com/dataviz/
  
                     
    #escrita completa    
      ggplot(data = starwars, mapping = aes(x = mass)) +
          geom_histogram()
            
    #escrita compacta
      starwars %>% 
        ggplot(aes(mass)) +
         geom_histogram()
      
    #exemplo com mais camadas
      p1 <- starwars %>% 
        ggplot(aes(mass, color = sex, fill = sex)) +
        geom_histogram() + 
        facet_grid(gender ~ .)
        
      plotly::ggplotly(p1)
            
    # ex: case mpg
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
                
            #transformando o ggplot em um gráfico interativo
            #(é necessário ter o pacote plotly instalado)
            plotly::ggplotly(a)
          
              
    #ex: diamonds

        set.seed(1)
        diamonds_new <- diamonds %>% sample_frac(0.03) 
        
        ggplot(data = diamonds_new, 
               mapping = aes(x = carat, y = price))
        
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
        
        
    #ggplot + forcats
        #https://wilkelab.org/SDS375/slides/getting-things-in-order.html#1
        
   #hands-on: https://rstudio.cloud/learn/primers/3
        

# Comunicação (Rmarkdown) -----
  #https://rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf  
  #https://github.com/rladies/meetup-presentations_sao-paulo
        
  #hands-on: https://rmarkdown.rstudio.com/lesson-1.html
  
  
        
# extra: skimr (useful summary statistics) -----
    
    library(skimr)
    
    starwars %>% glimpse()

    starwars %>% skimr()
    
    # um parenteses para falar de group_by e summarise
      
      # aqui contamos o total da tabela
        starwars %>% count()
        starwars %>% summarise(n())
        
      #aqui contamos o total para os grupos especificados
        starwars %>% 
          group_by(gender, sex) %>% 
          count()
        
        starwars %>% 
          count(gender, sex)
        
        #group_by + summarise
        starwars %>% 
          group_by(gender, sex) %>% 
          summarise(mean_height = mean(height, na.rm = T),
                    n_distinct_homeworld = n_distinct(homeworld)) %>% 
          ungroup()
        

        #exemplo de seleção de coluna de modo que possamos aplicar a função média  
        starwars %>% 
          filter(!is.na(mass)) %>%  
          pull(mass) %>% 
          mean()
        
      #views 
        starwars %>% 
          filter(mass < max(starwars$mass, na.rm =T)) %>% 
          ggplot(aes(mass)) +
          geom_boxplot() +
          coord_flip()
        
        starwars %>% 
          filter(mass < max(starwars$mass, na.rm =T)) %>% 
          ggplot(aes(mass)) +
          geom_freqpoly()
        
  # voltando ao skimr, podemos combina-lo com o group_by
      starwars %>% 
        group_by(gender) %>% 
        skim()
    
    
# :::::::::::: Refs -----
        
  #Repo R-Ladies, alguns meetups recomendados: #1, #5 e #6:
    # https://github.com/rladies/meetup-presentations_sao-paulo