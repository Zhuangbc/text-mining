
devtools::install_github("truenumbers/tnum/tnum")

library(tnum)
tnum.authorize()

test <- tnum.getDatabasePhraseList("subject", levels = 3)
test

# Count word count in this book
num1 <- tnum.query("*pride* has count:word")
num1

# Get sentences with word "rich" in it, save it to a dataframe
rich <- tnum.query("*pride* has text = REGEXP(\"rich\")", max =100)
richdf <- tnum.objectsToDf(rich)

married <- tnum.query("*pride* has text = REGEXP(\"married\") ", max = 100 )
marriedDf <- tnum.objectsToDf(married)

# Plot a relation graph of where "rich" words are in this book
picRich <- tnum.makePhraseGraphFromPathList(richdf$subject)
tnum.plotGraph(picRich)

picMarried <- tnum.makePhraseGraphFromPathList(marriedDf$subject)
tnum.plotGraph(picMarried)

# tag sentences with "rich"
tnum.tagByQuery("*pride* has text = REGEXP(\"rich\")", "reference:rich")
