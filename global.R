library(dplyr)
library(plotly)
library(ggplot2)
library(ggtext)
function(input, output, session) {


#create data object
my_data<- read.csv('msme_data.csv')

c1 <- my_data %>%
  select(-State) %>%
  names()

#structure of the data
my_data %>%
  str()

#summary

my_data %>%
  summary()

#first few observations
my_data %>%
  head()

str(my_data)

#Second menu item visualization
#Creating histogram and boxplot for distribution tabpanel

p1 = my_data %>%
  plot_ly() %>%
  add_histogram(~get(input$var1)) %>%
  layout(xaxis = list(title = input$var1))

# box plot
p2 = my_data %>%
  plot_ly() %>%
  add_boxplot(~get(input$var1)) %>%
  layout(yaxis=list(showticklabels = F))

# stacking plots
subplot(p2,p1,nrows = 2) %>% 
  hide_legend() %>%
  layout(title = "Distribution chart - Histogram and Boxplot",
         yaxis = list(title="Frequency"))

#Choices for select Input - Without States Column
c1 = my_data %>%
  select(-State) %>%
  names()
}
