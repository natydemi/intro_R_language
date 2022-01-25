
# Introdução à Programação em R
# Nathália Demetrio

# Workflow da Ciência de Dados -----
    # https://r4ds.had.co.nz/introduction.html

# o que são dados tidy?  -----
    #https://escoladedados.org/tutoriais/tidy-data-dados-arrumados-e-5-problemas-comuns/

# o que é um tibble?  -----
    #https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html
    
# O que é o operador pipe?  -----
    # https://www.curso-r.com/blog/2018-07-03-tutorial-pipe/

# O universo tidyverse -----
    # https://www.tidyverse.org/ 

# ::::: practice: Rbase vs. tidyverse (base titanic) -----

    install.packages("titanic")
    install.packages("tidyverse")
    library(tidyverse)

    #dataset
        (titanic <- titanic::titanic_train)
    
        #note como na versão tibble o output é mais clean
        tibble(titanic)
        #mas a função que transforma em tibble existe em vários pacotes,
        #inclusive essa mudança pode ser feita de outras formas, p.e.:
        titanic <- as_tibble(titanic)
        # se não tivessemos carregado a biblioteca do tidyverse, ou o dplyr,
        # a função precisaria ser chamada da seguinte forma:
        titanic <- dplyr::as_tibble(titanic)
    

    #Primeiras views
        #View(titanic)
        #view(titanic) # msm coisa, mas com letra minuscula
        titanic %>% view()
        
        #str(titanic)
        titanic %>% glimpse()
       
            
    #atalho para o Pipe: 'ctrl + shift + m'

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
                select(contains("Survived"))
    
        #summarise 
            titanic %>% 
                summarise(
                    n = n(),
                    n_dist_age = n_distinct(Age),
                    min_age = min(Age, na.rm = T), 
                    mean_age = mean(Age, na.rm = T), 
                    median_age = median(Age, na.rm = T),
                    max_age = max(Age, na.rm = T), 
                    sd_age = sd(Age, na.rm = T)
                    )
            
        #group_by 
            titanic %>%
                #filter(!is.na(Age)) %>% 
                group_by(Pclass) %>% 
                summarise(
                    n = n(),
                    n_dist_age = n_distinct(Age),
                    mean_age = mean(Age, na.rm = T), 
                    sd_age = sd(Age, na.rm = T), 
                    mean(Fare, na.rm = T)
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

# ::::: practice: explorando dplyr (base iris) -------------------------------------

    data("iris")
     
    iris %>% colnames()
    iris <- iris %>% as_tibble()    
    
       
   iris_tidy <- iris %>% 
       #arrange(desc(Sepal.Width)) %>% 
       arrange(-Sepal.Width) %>% 
        #filter(Sepal.Length > 5 & Sepal.Width < 4) %>% 
        filter(Sepal.Length > 5 | Sepal.Width < 4) %>%  
        slice(1:5) %>% 
        # select(starts_with("Sepal"))
        # select(contains("."))
        #select(-Petal.Length) 
        #select(Sepal.Length, Petal.Width, Species) %>%
        # select(1:2)
        rename(var_original = Sepal.Length) %>%
        mutate(var_normalizada = scale(var_original)) %>% 
        glimpse()
   
   
   iris_tidy %>% 
        ggplot(aes(var_normalizada)) +
            geom_histogram()
   

# ::::: hands-on: manuseando dados (tidyverse - dplyr) -----
    #No RStudio Learn Primers: #https://rstudio.cloud/learn/primers 
    # faça os exercícios propostos na aba `Work with Data`,
    # priorizando a seção `Derive Information with dplyr`
    # https://rstudio.cloud/learn/primers/2.3
                
# ::::: hands-on: cheatsheet (dplyr) -----
   #replicar os exemplos da cheatsheet do dplyr
   #https://github.com/rstudio/cheatsheets/blob/main/data-transformation.pdf
   
   
# ::::: Refs -----
    #comparação de sintaxe: Rbase vs. tidyverse vs. data.table
        # https://github.com/mayer79/data_preparation_r
                  
    #link cheatsheets no site da rstudio: 
    #note que ao fim da página você encontrará algumas cheatsheets em português
        # https://rstudio.com/resources/cheatsheets/

    #livros
        #(inglês)
        # R for Data Science, by by Garrett Grolemund, Hadley Wickham:
        # https://r4ds.had.co.nz/ 
           
        #(português)
        # Curso-R ~ material em português
        # https://livro.curso-r.com/
       
    
               