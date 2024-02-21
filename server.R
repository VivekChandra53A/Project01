library(DT)
function(input, output, session){
  
  #structure
  output$structure <-renderPrint(
    #structure of data
    my_data %>%
      str() 
    )
    
    #summary
    output$summary <-renderPrint(
      my_data %>%
        summary()
  )
  
  #datatable
  output$dataT <-renderDataTable(my_data
                                 )
}
