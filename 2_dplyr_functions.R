#install package
install.packages('dplyr')

#load library
library(dplyr)

#load flight dataset
flights <- read.csv('./flights.csv',stringsAsFactors = TRUE)

#View dataset
View(flights)

#view top 6 records
head(flights)

#view top 10 records
head(flights,10)

#view last 6 records
tail(flights)

#convert to data frame
flights <- data.frame(flights)

#overview of data
glimpse(flights)

#select required rows and columns
select(flights, dep_time, arr_time, flight)

#filter : keep row matching criteria (, comma)=> AND OPERATION
filter(flights, month==1, day==1, origin=="EWR")

#filter : keep row matching criteria (| pipe )=> OR OPERATION
filter(flights, carrier=='UA' | carrier=='AA')

#pipelining or chaining ( %>% )
flights %>%
  select(carrier, dep_delay) %>%
  filter(dep_delay > 60)

#arrange method (ascending / descending order)
flights %>%
  select(carrier, dep_delay) %>%
  arrange(dep_delay)

#arrange in descending
arrange(flights, desc(dep_delay))

#create or mutate new column using existing columns
flights <- flights %>% mutate(speed= distance/air_time)

#groupby function and summarize:REDUCE VARIABLES TO VALUE
flights %>%
  group_by(dest) %>%
  summarise(mean_dep_delay = mean(dep_delay, na.rm=TRUE))

flights %>%
  group_by(dest) %>%
  summarise(avg_delay = mean(arr_delay, na.rm=TRUE))

flights %>%
  group_by(month, day) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))
  

#LOAD EXCEL FILE

#install read excel package
install.packages('readxl')

#load library to import excel fle
library(readxl)

#load excel file
