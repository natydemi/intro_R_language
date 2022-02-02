library(tidyverse)


# AULA 1 ::::: hands-on: criação de objetos -----
# @s alun@s devem criar um objeto chamado c, e outro chamado f, em que:
# 1) o c irá receber como input uma temperatura em graus celsius, digitado pelo usuário
# 2) e o f será uma fórmula que tem o c como um dos seus valores
# 3) ao mudar o valor de c o que acontece com o f? é atualizado?
#    Algo precisaria ser feito para ele ser atualizado?
# 4) substitua o c para que receba a função readline(prompt="Graus Celsios: "), o que acontece?
# 5) digite novamente a definição do objeto f, avalie a mensagem de erro, e
#    investigue o uso das funções class() e as.numeric() para solucionar o problema


c <- 30
f <- 32+c

c <- readline(prompt = "Graus Celsius: ")

f <- 32+c

class(f) ; class(c)
f <- 32+c
as.numeric(f)


d <- 40

e <- (d * (9/5)) + 32

d <- readline(prompt = "Graus Celsius: ")

class(e) ; class(d)

as.numeric(e)


# QUIZ AULA 1 - https://docs.google.com/forms/d/e/1FAIpQLSfXZyhTy6JIOSxlq5lPubdURc0FLS03LxW2R0B7SfVsJA3-Rw/formResponse?pli=1

# 1.1 Qual o resultado da equação: 1.5 * 3 * (10 - (5 + 1)) *
# A) 41
# B) 18
# C) 39

# 1.2 Qual o resultado da equação: x <- -1; abs(x) == 1 *
# Dica: consulte o help da função `abs()` com o comando `?abs`
# TRUE
# FALSE

# 1.3 Qual das opções abaixo NÃO atribui o valor 5 ao objeto "x" *
# x <- 5
# x = 5
# 5 -> x
# NDA (nenhuma das anteriores)


# 1.4 Qual das funções abaixo retorna a lista de funções disponíveis no Rbase? *
# data()
# builtins()


# 1.5 O que o atalho 'ctrl + shift + c' faz? *
# Adiciona comentários ('#')
# Roda o código selecionado
# Adiciona o simbolo de atribuição ('<-')
# Adiciona uma seção no código ('# nome seção -----' )


# AULA 2 ::::: hands-on: manuseando dados ----------------------------------------------------------------
# para os exercícios abaixo, pode ser interessante revisitar a seção `practice`
# de estatísticas descritivas feita no final do script da aula 1

#1.considerando a base mtcars
#1.1. exclua as variáveis que estão atrapalhando a visão dos demais boxplots?

boxplot(mtcars)

mtcars_limpo <- mtcars %>%
  select(-c("disp", "hp"))

boxplot(mtcars_limpo)

#1.2. como ver o resultado médio de uma variável apenas? #dica: mean()
mean(mtcars$disp)
#Resposta: 230.7219

#1.3. qual a média das primeiras 10 linhas da base?
mean(mtcars$disp, 10)
#Resposta: 196.3

#Outro jeito de fazer
mtcars_head <- head(mtcars, 10)

mean(mtcars_head$disp)
#Resposta: 208.61


#1.4. quantas linhas possuem vs e am igual a 0?
mtcars_raw <- mtcars

analise_mtcars_vs_nulo <- mtcars_raw %>%
  filter(vs == 0)

analise_mtcars_am_nulo <- mtcars_raw %>%
  filter(am == 0)

analise_mtcars_am_vs_nulo <- mtcars_raw %>%
  filter(vs == 0 & am == 0)
#RESPOSTA: 12

analise_mtcars_am_OU_vs_nulo <- mtcars_raw %>%
  filter(vs == 0 | am == 0)

#2.em uma nova base de dados chamada mtcars_new:

#2.1 arredonde a variável qsec para 1 casa decimal

#2.2 transforme a variável vs em character

mtcars_new <- mtcars

round(mtcars_new$qsec, 1)

as.character(mtcars_new$vs)

class(mtcars_new$vs)

mtcars_new <- as.character(mtcars$vs)

mtcars_news <- mtcars %>%
  mutate(
    vs = as.character(vs)
  )

class(mtcars_news$vs)

#3. (questão bônus): exporte os resultados em um csv, onde este csv está?



mtcars

View(mtcars)

boxplot(mtcars)

mean(mtcars$disp)


#`head()` - que retorna as primeiras linhas da base de dados, ou similarmente a função `tail()` que contempla as últimas linhas:
head(mtcars)



# AULA 3 ::::: hands-on: exportação de base de dados -----

#exporte os dados em um arquivo .csv
write.csv(state, "base_exportada.csv")

#em qual diretório o arquivo se encontra?
getwd()

#qual a função que altera o diretório
#C:\\Users\\natyd\\Desktop
#setwd("C:/Users/natyd/Desktop")
setwd()


#delete o objeto state e releia o arquivo
rm(state)
state
state <- read.csv("base_exportada.csv")
state



# QUIZ 3.1 DA AULA 3
# https://docs.google.com/forms/d/e/1FAIpQLSdnl0TjDZnL2TDvfi79GIYaqkWczV0YBGFfNorEsyGCXWkCow/formResponse?pli=1

# 3.1.1. O vetor `islands` apresenta o número de superficieis continentais para diferentes regiões do mundo. Considerando medidas de posição, qual das funções abaixo que retorna o valor que melhor representa o que observamos nos dados? *
# mean(islands)
# median(islands)

# 3.1.2. Considerando a base de dados `PlantGrowth`, qual grupo (variável group) obteve a maior média de altura? *
# ctrl
# trt1
# trt2

# 3.1.3. Para a base de dados `sleep`, considerando apenas o grupo 2 (coluna 'group'), qual a mediana da coluna `extra` ? *
# 0.95
# 0.35
# 2.33
# 1.75

# 3.1.4 Considerando a base de dados `iris`, crie uma coluna que seja o produto (multiplicação) das colunas `Sepal.Length` e `Sepal.Width`. Qual a média desta coluna? (considere duas casas decimais, sem arredondamentos) *
# 5.79
# 17.82
# 23.22
# 8.90

# 3.1.5 Para a base `esoph`, excluindo as linhas que tiveram `nccases` igual a zero, qual grupo de idade possui o menor número total de controles? (`agegp` com menor soma de `ncontrols`) *
# 25-34
# 35-44
# 45-54
# 55-64
# 65-74
# 75+

# QUIZ 3.2 DA AULA 3
# https://docs.google.com/forms/d/e/1FAIpQLSeNZ9ufoNlnMBZvIMKhocCyGe8-BfREb9sIcwXkXU8YPty3xw/formResponse?pli=1

# 3.2.1 Todas as funções abaixo possuem relação com o caminho (path) de arquivos, mas apenas uma nos permite alterar o diretório padrão de uma sessão de trabalho no R, qual é esta função?
# setwd()
# file.path()
# getwd()
# path.expand()

# 3.2.2. Crie um projeto no R ( segundo icone superior à esquerda, ou ainda o único ícone superior à direita). Qual a extensão do arquivo gerado? *
# .R
# .Rmd
# .Rproj
# NDA (nenhuma das anteriores)

# 3.2.3. Qual das linhas abaixo retorna a mensagem "não" *
# ifelse(1<2, "sim", "não")
# ifelse(1<=2, "sim", "não")
# ifelse(1==2, "sim", "não")
# ifelse(1!=2, "sim", "não")

# 3.2.4. Considerando o comando: `teste <- function(a){a^2}`. Qual das afirmações abaixo é FALSA? *
# o nome do objeto é "teste"
# o argumento da função é "a"
# o corpo da função é "a^2"
# NDA (nenhuma das anteriores)

# 3.2.5. Após Instalar e carregar a biblioteca swirl, digite a função swirl() no Console - você será iniciado em um curso interativo. Após algumas introduções, você chegará na listagem de alguns cursos, escolha "1: R Programming: The basics of programming in R" e posteriormente "1: R Programming". Quantas lições são listadas? (dica: aproveite para conhecer algumas das lições ☺) *
# 10
# 15
# 18
# 20




# AULA 4 ::::: hands-on: manuseando dados (tidyverse - dplyr) -----
#No RStudio Learn Primers: #https://rstudio.cloud/learn/primers
# faça os exercícios propostos na aba `Work with Data`,
# priorizando a seção `Derive Information with dplyr`
# https://rstudio.cloud/learn/primers/2.3

# ::::: hands-on: cheatsheet (dplyr) -----
#replicar os exemplos da cheatsheet do dplyr
#https://github.com/rstudio/cheatsheets/blob/main/data-transformation.pdf


# QUIZ AULA 4 -
# https://docs.google.com/forms/d/e/1FAIpQLSfQzQ-Sd_unJbsUybgZ-6ek7PiJxd63yJBsTVsGpvt4MUYhYw/formResponse

# 4.1. A frase "Ao instalar a biblioteca tidyverse, uma série de bibliotecas são instaladas. Contudo, ao carregar o tidyverse, algumas destas bibliotecas não são carregadas" é: *
# VERDADEIRA
# FALSA

# 4.2. Qual das bibliotecas do tidyverse listadas abaixo tem como foco manipulação de dados? *
# ggplot2
# dplyr
# magrittr
# readr

# 4.3. Após instalar e carregar a biblioteca `tidyverse`, você terá acesso ao dataset `starwars`. O primeiro passo será carrega-la no environment, como podemos fazer isto? *
# starwars
# data(starwars)
# data("starwars")
# dplyr::starwar

# 4.4. Em relação ao dataset `starwars`. Quantas linhas esta base possui? *
# 43
# 65
# 73
# 87

# 4.5. Um dos comandos abaixo NÃO retorna as colunas `hair_color,` `skin_color ` e `eye_color` da base `starwars`. Qual é este comando? *
# starwars %>% select(4:6)
# starwars %>% select(contains("_color"))
# starwars %>% select(ends_with("_color"))
# starwars %>% select(-hair_color, -skin_color, -eye_color)

# 4.6. Qual das opções abaixo retorna todas as linhas da base `starwars` referentes aos personagens `Human` e `Droid`? *
# starwars %>% filter(species == "Human", species == "Droid")
# starwars %>% filter(species == c("Human", "Droid"))
# starwars %>% filter(species %in% c("Human", "Droid"))

# 4.7. Com o código `star <- starwars %>% mutate(teste = sum(mass, na.rm = T))` criamos uma nova base de dados, contendo uma nova coluna chamada `teste`. Qual das afirmações abaixo está INCORRETA em relação ao resultado deste código? *
# para cada linha da base de dados a função mutate faz o cálculo da soma da coluna `mass`
# a função sum() faz a soma de todos os valores da coluna mass
# todas as linhas da nova coluna possuem o mesmo valor
# sempre que utilizamos a função mutate() sem a função group_by(), o resultado é o mesmo para todas as linhas

# 4.8 Qual dos códigos abaixo retorna a quantidade de `species` únicas existentes para cada uma das opções de `gender`? *
# starwars %>% count(gender,species)
# starwars %>% group_by(gender) %>% distinct(species)
# starwars %>% group_by(gender,species) %>% summarise(n())
# starwars %>% group_by(gender) %>% summarise(n_distinct(species))

# 4.9. Ainda com a base `starwars`, quantas observações são referentes à espécie (`species`) humana (`Human`) ? E quantas são referentes ao sexo (`sex`) feminino (`female`) da espécie humana? *
# 35 humanos, 9 mulheres
# 35 humanos, 19 mulheres
# 44 humanos, 19 mulheres
# 44 humanos, 26 mulheres

# 4.10. Apenas um dos comandos abaixo NÃO retorna a linha correspondente ao personagem mais velho da base de dados `dplyr::starwars`, qual é? *
# starwars %>% top_n(1, birth_year)
# starwars %>% arrange(birth_year) %>% slice(1)
# starwars %>% filter(birth_year == max(birth_year, na.rm=T))
# starwars %>% slice(which.max(birth_year))
