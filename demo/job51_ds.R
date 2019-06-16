library(rvest);
url <-"https://search.51job.com/list/020000,000000,0000,00,9,99,%25E6%2595%25B0%25E6%258D%25AE%25E7%25A7%2591%25E5%25AD%25A6,2,1.html?lang=c&stype=1&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=99&companysize=99&lonlat=0%2C0&radius=-1&ord_field=0&confirmdate=9&fromType=4&dibiaoid=0&address=&line=&specialarea=00&from=&welfare=";

job_page <- read_html(url);

job_des <- job_page %>% html_nodes(".el")

#获取抬头
job_title_header <- job_des %>% html_nodes(".t1") %>% html_text();
job_title_header <- job_title_header[1];
#job_title_header;
job_title_body <-job_des %>% html_nodes(".t1 a") %>% html_attr("title");
job_title <-c(job_title_header,job_title_body);

job_url_body <-job_des %>% html_nodes(".t1 a") %>% html_attr("href");
job_url_head <-"网址";
job_url <- c(job_url_head,job_url_body);

job_count <- job_title %>% length();
#公司名称
job_company <- job_des %>% html_nodes(".t2") %>%html_text();
# job_company;
#公司地点
job_location <- job_des %>% html_nodes(".t3") %>% html_text();
# job_location;
#公司薪水
job_salary  <- job_des %>% html_nodes(".t4") %>% html_text();

job_salary;

#发布时间
job_issueDate  <- job_des %>% html_nodes(".t5") %>% html_text();

res <- data.frame(job_title,job_salary,job_location,job_company,job_issueDate,job_url,stringsAsFactors = F);
View(res);

