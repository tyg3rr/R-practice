library(tidyverse)

df <- read_csv('full_export.csv')

text <- paste(unlist(df),collapse=" ")
freqs <- data.frame(table(str_split(text,' ')))

n = 15

top_words <- slice_max(freqs, order_by = freqs[2], n=n)

top_words <- rename(top_words, 'Word'='Var1')

top_words <- top_words[top_words['Word'] != "NA",]

head(top_words)['Word']

ggplot(data = top_words) + geom_col(mapping = aes(Word, Freq))


