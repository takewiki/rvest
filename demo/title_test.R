library(rvest)
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
#节点还是好处理的，就是标记

title <- lego_movie %>%
  html_nodes("h1") %>%
  html_text()

title
