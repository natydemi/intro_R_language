
# Introdução à Programação em R
# Nathália Demetrio

# Introdução à Programação em R
# XLIX Programa De Verão (2021)
# Nathália Demetrio, Geovana Lopes e Alex Kushima

# link repo curso: https://docs.google.com/document/d/1VO-UO-Zt996Q-0RW9U0HADnWUlTuuKPVEOxAmUPHzCg/edit?usp=sharing



# --- Hands-on

# Via point-and-click um Rmarkdown com o título "Exercício Aula" e o seu nome como autor
#Salve no seu diretório de trabalho como "ex_rmarkdown" 
#DICA: lembre-se de consultar a 'Cheat Sheet' e o atalho 'Help > Markdown Quick Reference'
#Faça um capítulo chamado "Leitura" (uma '#'), e nele:
#crie um chunk que carregue a biblioteca tidyverse (omita as mensagens e warnings)
#em outro chunk carregue a base de dados `txhousing`, do pacote ggplot2, apresente um print
#escreva uma frase (fora do chunk) comentando sobre esta basse
#em outro chunk apresente o glimpse dos dados sem mostrar o comando do R (i.e. echo=FALSE))
#Crie um segundo capítulo chamado "Explorando", e nele:
#escreva um parágrafo com a descrição da base de dados (consultar description do help)
#ao fim do parágrafo acima adicione o número de linhas do banco (no próprio texto),
#bem como o período da base (ano-mês inicial e final da base)
#crie uma copia da base, chamada txhousing_clean, excluindo os dados faltantes da variável sales
#Então crie um subcapítulo ('##') com:
#um ggplot que apresente o boxplot das vendas (sales) por cidade (city)
#Crie um terceiro e último capítulo, chamado "Conclusão"
#escreva em bullets o que foi feito nos capítulos anteriores
#exporte a nova base de dados no seu diretorio como um .csv
#para garantir que está tudo ok:
#exclua o arquivo txhousing_clean
#leia o arquivo ´txhousing_clean´novamente, a partir do arquivo exportado
#Rode o arquivo (aperte 'Knitr' ou 'ctrl+alt+k'), e veja o nome que foi salvo como .html
# FIM!

#Bônus: coloque o nome desse .html no comando abaixo 
#no lugar de "ex_rmarkdown", caso vc tenha salvado o .Rmd com um nome diferente
#o que aconteceu? Apareceu algum arquivo no diretório raiz?
install.packages("pagedown")
pagedown::chrome_print("ex_rmarkdown.html")

#É isso aí! Parabéns!
