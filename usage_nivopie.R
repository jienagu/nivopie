
library(nivopie)

id=c("A", "B", "C", "D", "e", "f", "g")
value=c(12,13,45, 90,250,300,500)
label=c("a", "b", "c", "d", "e", "f", "g")
df2=data.frame(id,value, label)
df2$id=as.factor(df2$id)

nivopie(df2, innerRadius=0.5, cornerRadius=5, fit=T,sortByValue=T,
        colors='nivo', enableRadialLabels=T, radialLabelsLinkDiagonalLength=1,
        radialLabelsLinkHorizontalLength=8,
        enableSlicesLabels=T, sliceLabel='value',isInteractive=T)
