
# Introdução à Programação em R
# Nathália Demetrio

# Workflow da Ciência de Dados -----
    # https://r4ds.had.co.nz/introduction.html

# o que são dados tidy?  -----
    #https://escoladedados.org/tutoriais/tidy-data-dados-arrumados-e-5-problemas-comuns/

# o que é um tibble? (vs. data.frame)  -----
    #https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html
    
# O que é o operador pipe?  -----
    # https://www.curso-r.com/blog/2018-07-03-tutorial-pipe/

# As bibliotecas do tidyverse -----
    # https://www.tidyverse.org/ 

# ::::: practice: Rbase vs. tidyverse (base titanic) -----

install.packages("titanic")
install.packages("tidyverse")
library(tidyverse)

# base de dados ------  
(titanic <- titanic::titanic_train)

#note como na versão tibble o output é mais clean
tibble(titanic)
#mas a função que transforma em tibble existe em vários pacotes,
#inclusive essa mudança pode ser feita de outras formas, p.e.:
(titanic <- as_tibble(titanic))
# se não tivessemos carregado a biblioteca do tidyverse, ou o dplyr,
# a função precisaria ser chamada da seguinte forma:
titanic <- dplyr::as_tibble(titanic)


# view / glimpse ------ 
#View(titanic)
#view(titanic) # msm coisa, mas com letra minuscula
titanic %>% view()

#str(titanic)
titanic %>% glimpse()


#atalho para o Pipe: 'ctrl + shift + m'

# select ------ 
#titanic[ ,c("Sex", "Age")]

titanic %>% 
  #select(Age, Sex)
  #select(Sex, Age)
  #select(-Sex)
  select(1:5)

# filter ------ 
#titanic[titanic$Sex == "male",]
#titanic[(titanic$Sex == "male") & (titanic$Age > 30),]

titanic %>% 
  #filter(Sex == "male")
  #filter(is.na(Age))
  filter(Sex == "male", Age > 30 | is.na(Age))  


# arrange ------ 
#sort(titanic$Sex) ; order(titanic$Sex)
#titanic[order(titanic$Sex), ] 

titanic %>% 
  #arrange(Sex, PassengerId) %>% 
  #arrange(Sex, -PassengerId) %>% 
  #arrange(Sex, desc(PassengerId)) %>% 
  arrange(desc(Age ), Name) %>% 
  #arrange(desc(Sex)) #com -Sex dá erro, pois ñ faz sentido multiplicar um character por -1
  filter(Sex == "male")

#primeiras 5 linhas
titanic %>% arrange(-Age) %>% slice(1:5)
#top_n e o slice_max

# mutate  ------ 
#titanic$new_col <- titanic$Age * titanic$Survived 

titanic %>% 
  #mutate(Survived = Survived +1 )
  mutate(Survived * Age) %>%  glimpse()
#mutate(new_col = Age * Survived )
mutate(Survived_2 = ifelse(Survived == 1, "sobreviveu", "morreu")) %>% 
  select(contains("Survived"))

# summarise ------  
titanic %>% 
  summarise(
    n = n(),
    n_dist_age = n_distinct(Age),
    min_age = min(Age, na.rm = T), 
    mean_age = mean(Age, na.rm = T), 
    median_age = median(Age, na.rm = T),
    max_age = max(Age, na.rm = T), 
    sd_age = sd(Age, na.rm = T),
    IQR_age = IQR(Age, na.rm = T) 
  )

#este aqui dá errado! 
titanic %>% 
  summarise(n = n()) %>% 
  summarise(n_dist_age = n_distinct(Age))

# group_by ------ 
titanic %>%
  filter(!is.na(Age)) %>% 
  #group_by(Pclass) %>% 
  summarise(
    n = n(),
    n_dist_Pclass = n_distinct(Pclass),
    n_dist_age = n_distinct(Age),
    mean_age = mean(Age, na.rm = T), 
    sd_age = sd(Age, na.rm = T), 
    mean(Fare, na.rm = T)
  )


  # exemplo com tudo junto ------ 
    # adicionando porcentagem
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
         

# ::::: hands-on: manuseando dados (Posit Recipes) -----
    #No Posit Recipes: #https://posit.cloud/learn/recipes  
    # faça os exercícios propostos na coluna `Transform Tables`,
   
                
# ::::: hands-on: cheatsheet (dplyr) -----
   #replicar os exemplos da cheatsheet do dplyr
   #https://github.com/rstudio/cheatsheets/blob/main/data-transformation.pdf
   
   
# ::::: Refs -----
    #comparação de sintaxe: Rbase vs. tidyverse vs. data.table
        # https://github.com/mayer79/data_preparation_r
                  
    #livros
        #(inglês)
        # R for Data Science, by by Garrett Grolemund, Hadley Wickham:
        # https://r4ds.had.co.nz/ 
           
        #(português)
        # Curso-R ~ material em português
        # https://livro.curso-r.com/
       
    
               