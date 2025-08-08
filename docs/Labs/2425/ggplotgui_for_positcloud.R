## R code for launching ggplotgui on own device
## To run code use `ctrl` + `enter` on pc at the start or end of the code line. For MAC, use `command` + `return`. Alternativley, click the "Run" button at the top right of this script at each line of code.


## 1) Install and loading the package
pacman::p_load(ggplotgui)
pacman::p_load(ggpubr)
### Note - if above step does not work, try running this line of code below first (delete the hashtag infront before running the code)

#install.packages("pacman")


## 2) Launch the ggplot graphic user interface 
ggplot_shiny()
