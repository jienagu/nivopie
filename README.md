# nivopie
An html widget that creates interactive pie chart

## Install from github
Install from GitHub : devtools::install_github("jienagu/nivopie")

## Usage:
Step 1: Create a data frame with two column: id and value

`id=c("A", "B", "C") value=c(12,13,45) df2=data.frame(id,value)`

Step 2: use nivopie function

`library(nivopie) nivopie(df2)` 

Optional: you can change color 

`nivopie(df2, colors = RColorBrewer::brewer.pal(n=9, "Blues"))`

Then you can see the interactive pie chart in your RStudio View.

demo

Acknowledgement
@timelyportfolio (https://github.com/react-R/nivocal) and reactR (Alan Dipert)
