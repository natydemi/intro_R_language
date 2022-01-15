
# Introdução à Programação em R
# Nathália Demetrio


# Reviews/Tips -----
    #review

# Workflow da Ciência de Dados -----
    # https://r4ds.had.co.nz/introduction.html

# Dados tidy  -----
    #o que são dados tidy?
        #https://escoladedados.org/tutoriais/tidy-data-dados-arrumados-e-5-problemas-comuns/
    #tibble?
        #https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html
    
# A gramática Pipe e o tidyverse -----
    # o operador pipe: https://www.curso-r.com/blog/2018-07-03-tutorial-pipe/
    # tidyverse: https://www.tidyverse.org/ 

# Trabalhando com os dados do titanic
    
    install.packages("titanic")
    install.packages("tidyverse")
    library(tidyverse)

    #dataset
        titanic <- titanic::titanic_train
        titanic <- dplyr::as_tibble(titanic)
    

# Manipulação -----
    #Visualizar
        #View(titanic)
        #view(titanic)
        titanic %>% view()
        
        #str(titanic)
        titanic %>% glimpse()
       
            
    #atalho para o Pipe 'ctrl + shift + m'

        #select
            #titanic[ ,c("Sex", "Age")]

            titanic %>% 
                #select(Age, Sex)
                #select(Sex, Age)
                #select(-Sex)
                select(1:5)
            
         #filter
            #titanic[titanic$Sex == "male",]
            #titanic[(titanic$Sex == "male") & (titanic$Age > 30),]
            
            titanic %>% 
                #filter(Sex == "male")
                filter(Sex == "male", Age > 30 | is.na(Age))  


        #arrange
            #sort(titanic$Sex) ; order(titanic$Sex)
            #titanic[order(titanic$Sex), ] 
            
            titanic %>% 
                #arrange(Sex, PassengerId) %>% 
                arrange(Sex, -PassengerId) %>% 
                arrange(Sex, desc(PassengerId)) %>% 
                #arrange(desc(Sex)) #com -Sex dá erro, pois ñ faz sentido multiplicar um character por -1
                filter(Sex == "male")

            #primeiras 5 linhas
            titanic %>% arrange(-Age) %>% slice(1:5)
                #top_n e o slice_max
            
        #mutate 
            #titanic$new_col <- titanic$Age * titanic$Survived 
            
            titanic %>% 
                #mutate(Survived = Survived +1 )
                #mutate(new_col = Age * Survived )
                mutate(Survived_2 = ifelse(Survived == 1, "sobreviveu", "morreu")) %>% 
                select(contains("Survi"))
    
        #summarise 
            titanic %>% 
                summarise(
                    n = n(),
                    n_dist = n_distinct(Age),
                    mean_age = mean(Age, na.rm = T), 
                    sd_age = sd(Age, na.rm = T)
                    )
            
        #group_by 
            titanic %>% 
                group_by(Pclass) %>% 
                summarise(
                    n = n(),
                    n_dist = n_distinct(Age),
                    mean_age = mean(Age, na.rm = T), 
                    sd_age = sd(Age, na.rm = T)
                )
               

            #exemplo com tudo: adicionando porcentagem
                titanic %>% 
                    #group_by(Survived, Pclass, Sex) %>%
                    group_by(Survived) %>%
                    count() %>% 
                    # summarise(n = n()) %>% 
                    ungroup() %>% 
                    mutate(p = n/sum(n))
                
                titanic %>% 
                    group_by(Survived, Pclass) %>%
                    count() %>% 
                    # summarise(n = n()) %>% 
                    group_by(Survived) %>% 
                    mutate(p = n/sum(n))
               
    # se eu quiser reescrever o objeto com as alterações feitas, 
    # basta colocar `titanic <- `no início da sequência de comandos
            

# :::::::::::: Refs -----
               
    # Link cheatsheets: 
       # https://rstudio.com/resources/cheatsheets/
           
    #R for Data Science, by by Garrett Grolemund, Hadley Wickham:
       # https://r4ds.had.co.nz/ 
           
    #Curso-R ~ material em português
       # https://material.curso-r.com/pipe/ 
       
    
               