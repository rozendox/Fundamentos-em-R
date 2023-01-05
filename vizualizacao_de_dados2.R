library(ggplot2)

mtcars %>% ggplot(aes(x = hp, y = mpg, size = carb)) + geom_point(col = "darkgreen") 
