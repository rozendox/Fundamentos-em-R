library(dplyr)

head(mtcars, 5) # Retorna as 5 primeiras linhas da tabela "mtcars"


##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2



#quereremos filtrar os da tabela mtcars cujo valor da variável carb seja superior a 2

mtcars %>% filter(carb > 2)

##     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## 3  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## 4  19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
## 5  17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
## 6  16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
## 7  17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
## 8  15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
## 9  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
## 10 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
## 11 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
## 12 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
## 13 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
## 14 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
## 15 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8


# média e o desvio-padrão da variável hp das observações agrupados pelo seu valor da variável gear.

mtcars %>% group_by(gear) %>% summarise(media = mean(hp), desvio = sd(hp))

## # A tibble: 3 × 3
##    gear    media    desvio
##   <dbl>    <dbl>     <dbl>
## 1     3 176.1333  47.68927
## 2     4  89.5000  25.89314
## 3     5 195.6000 102.83385

#tabela apenas com as variaveis carb, wt e price (select), onde price é uma variável criada pela fórmula price=gear∗3000+hp∗10, 
#com as observações que tenham o valor da variável Carb maior que 1 e wt menor que 3.

mtcars %>% filter(carb > 1, wt < 3) %>% mutate(price = gear*3000 +hp*10) %>% select(carb, wt, price)

##   carb    wt price
## 1    4 2.620 13100
## 2    4 2.875 13100
## 3    2 1.615 12520
## 4    2 2.140 15910
## 5    2 1.513 16130
## 6    6 2.770 16750
## 7    2 2.780 13090
