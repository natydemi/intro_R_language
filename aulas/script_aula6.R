
# Introdução à Programação em R
# Nathália Demetrio


    if(!require(tidyverse)){install.packages("tidyverse")}

# Extras/Dicas ----- 
    
    #Explore -----
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
                adorn_pct_formatting(digits = 0, affix_sign = TRUE) %>% 
                adorn_totals(where = c("row","col")) %>% 
                adorn_percentages(denominator = "row") %>%
                adorn_pct_formatting(digits = 0) %>% 
                adorn_ns(position = "front")  
        
        
    #Combinar bases -----

        library(tidyverse)
        band_members
        band_instruments 

        left_join(band_members, band_instruments, by = "name")
        right_join(band_members, band_instruments, by = "name") 
        inner_join(band_members, band_instruments)
        full_join(band_members, band_instruments, by = "name") 
    
        
    #Programação Funcional -----
    
        #https://purrr.tidyverse.org/
            
        titanic::titanic_train %>% glimpse
        
        starwars %>%
            map(is.na) %>% 
            map(sum) 
        
        starwars %>%
            select_if(is.character) %>% 
            map(unique)
    
        list.files(pattern='*.csv') %>% 
            map(read_csv) %>% 
            walk(glimpse)
        
    #Machine Learning -----
        #Tidymodels: https://www.tidymodels.org/start/
        
    #Dashboards-----
        # templates para o rmarkdown: install.packages("hrbrthemes")
        # flexdashboard: https://rmarkdown.rstudio.com/flexdashboard/index.html
        # shiny: https://shiny.rstudio.com/tutorial/
        
    #DataViz -----
        #biblioteca babado
        esquisse::esquisser() 
    

# :::::::::::: Refs -----
    

    