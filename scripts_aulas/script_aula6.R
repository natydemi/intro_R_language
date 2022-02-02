
# Introdução à Programação em R
# Nathália Demetrio


#projetos ------
    #https://chrisvoncsefalvay.com/2018/08/09/structuring-r-projects/
    #https://rstudio.csm.calpoly.edu/intro-to-projects/intro-to-projects.html
    #https://support.rstudio.com/hc/en-us/articles/200526207-Using-RStudio-Projects

#dplyr advanced (across) -----
    iris %>% summarise(across(everything(), mean))
    iris %>% summarise(across(where(is.numeric), mean))
    iris %>% summarise(across(contains("Sepal"), mean))

#data explore libraries -----
    #biblioteca skimr
        #https://cran.r-project.org/web/packages/skimr/vignettes/skimr.html 
        ?skimr::skim() 


    #biblioteca janitor
        #https://cran.r-project.org/web/packages/janitor/vignettes/tabyls.html
    
        ?janitor::tabyl() 
    
        starwars %>%
            as_tibble() %>% 
            clean_names() %>% 
            tabyl(gender) %>% 
            adorn_pct_formatting(digits = 1, affix_sign = TRUE) %>% 
            adorn_totals(where = c("row","col")) %>% 
            adorn_percentages(denominator = "row") %>%
            adorn_pct_formatting(digits = 0) %>% 
            adorn_ns(position = "front")  
        
    #bibliotecas:
        #inspectdf::
            inspectdf::inspect_types(starwars) 
            inspectdf::inspect_num(starwars) 
            
        #naniar::
            naniar::miss_var_table(starwars)
            naniar::gg_miss_upset(starwars)
            
        #visdat::
            visdat::vis_guess(starwars)
            
            
        
#Combinar bases -----

    library(tidyverse)
    band_members
    band_instruments 

    left_join(band_members, band_instruments, by = "name")
    right_join(band_members, band_instruments, by = "name") 
    inner_join(band_members, band_instruments)
    full_join(band_members, band_instruments, by = "name") 

    #investigue o help dessas funções, e a variedade de parametros oferecidas
    
#Programação Funcional -----

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
    

#DataViz -----
    #biblioteca babado
    esquisse::esquisser() 
    
    #Visualizações avançadas
    #https://www.rdocumentation.org/packages/GGally
    
    #lista de pacotes complementares:
    #https://github.com/krzjoa/awesome-r-dataviz
    
    #consulta de geoms vs. parametros possíveis
    #https://www.yihanwu.ca/post/geoms-and-aesthetic-parameters/
    
    #site com educational apps (consulta de scalas, geoms e temas):
    #https://ggplot2tor.com/apps
    
    #cheatsheet de cores:
    # http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
    
    #consulta de gráficos e como fazer no R
    # https://www.data-to-viz.com/
    
    #my favorite extensions
    #https://www.cedricscherer.com/slides/RLadiesTunis-2021-favorite-ggplot-extensions.pdf
    
    
#Dashboards estáticos-----
    #https://rmarkdown.rstudio.com/lesson-1.html?_ga=2.143348149.1497989112.1643665781-1904390254.1633195817
    #templates para o rmarkdown: install.packages("hrbrthemes")
    #Flexdashboard: https://rmarkdown.rstudio.com/flexdashboard/index.html

#Dashboards dinâmicos -----
    #https://shiny.rstudio.com/tutorial/?_ga=2.143348149.1497989112.1643665781-1904390254.1633195817
    #Shiny: https://shiny.rstudio.com/tutorial/
    #R-ladies SP: https://www.youtube.com/watch?v=tk0nUD2Qdd4&t=2868s
    
#Machine Learning -----
    #Tidymodels: https://www.tidymodels.org/start/
    #canal Samuel Macedo: https://www.youtube.com/channel/UCj19IjFlNSmCAOwrlq-Svbg/featured
    #https://www.youtube.com/c/JuliaSilge 
    
#Interoperabilidade R e Python -----
    #Reticulate: https://rstudio.github.io/reticulate/ 
    



#Comunidades -----
    #canal: julie singe, samuel macedo, rladies SP, 
    #twitter: rstats