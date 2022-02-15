
# 1 -----------------------------------------------------------------------

# quiz 3.1 ultimo exercicio

# para usar a setinha de atribuição: alt + -

# visualizando a base de dados completa
View(esoph)

# visualizando as 6 primeiras linhas da base
head(esoph)

# carregando o pacote dplyr
library(dplyr)


esoph %>% # base de nosso interesse
  filter(ncases!=0) %>% # filtrando linhas que ncases é dif de zero
  group_by(agegp) %>% # agrupando dados pela idade
  summarise(total_ncontrols = sum(ncontrols)) # somando a variável ncontrols
  #                                              para cada grupo de idade
  
# note que no código acima nós nao salvamos o resultado

x <- esoph %>% # base de nosso interesse
  filter(ncases!=0) %>% # filtrando linhas que ncases é dif de zero
  group_by(agegp) %>% # agrupando dados pela idade
  summarise(total_ncontrols = sum(ncontrols)) %>% # somando a variável ncontrols
  #                                              para cada grupo de idade
  filter(total_ncontrols == min(total_ncontrols)) 
  # filtrano apenas colunas que tem o valor mínimo

# note que agora nós salvamos o resultado no objeto x


# 2 -----------------------------------------------------------------------

#1.4. quantas linhas possuem vs e am igual a 0?

# visualizando a base mtcars
mtcars

# selecionando as linhas que vs = 0 e am = 0
mtcars[mtcars$vs == 0 & mtcars$am == 0, ]

# contando quantas linhas tem no data frame filtrado
length(mtcars[mtcars$vs == 0 & mtcars$am == 0, ])

# outra maneira de contar a quantidade de linhas num data frame
nrow(mtcars[mtcars$vs == 0 & mtcars$am == 0,])

# resolvendo o exercicio pelo dplyr

mtcars %>% # base mt cars
  filter(vs == 0 & am == 0) %>% # filtrando linhas que tem vs = 0 e am = 0
  length() # contando o numero de linhas

# podemos substituir o & pela virgula nesse caso

mtcars %>% 
  filter(vs == 0, am == 0) %>% # a vírgula funciona como & dentro do filter
  length()


# 3 -----------------------------------------------------------------------

# criando objetos 
idade <- c(31,30,25,40)
classe <- factor(c("D", "C", "C", "B"))
flag <- c(TRUE,TRUE,NA,FALSE)
ex_df <- data.frame(idade,classe,flag)

# criando uma lista sem atribuir nomes
ex_list1 <- list(9:1, ex_df, TRUE)
ex_list1

# criando uma lista atribuindo nomes
ex_list2 <- list(numeros = 9:1, dataframe = ex_df, booleano = TRUE)
ex_list2

# para acessar os objetos:

ex_list1[[1]]

ex_list2[[1]]
# ou
ex_list2$numeros

# ou seja, quando nomeamos os objetos da lista, podemos acessar os elementos
# pelo nome



# atalho para usar o pipe: ctrl + shift + m

install.packages("")


# 4 -----------------------------------------------------------------------

# ex 1.3 hands-on 2

# nao funciona
mean(mtcars)

# pelo dplyr
mtcars %>% 
  summarise(across(.col = everything(),
                   .fns = mean))

# já faz direto
colMeans(mtcars[1:10,])

# primeiras 10 linhas

head(mtcars, 10)

# ultimas 10 linhas

tail(mtcars, 10)






