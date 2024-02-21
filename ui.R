library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Services and Manufacturing MSME Registration Till 19Th Feb 2024",titleWidth = 650,
                  tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/vivek-chandra-813aa9160/", icon("linkedin"),"Creator Profile",target="_blank")),
                  tags$li(class="dropdown",tags$a(href="https://data.gov.in/catalog/udyam-registration-msme-registration","Data Source",target="_blank"))),
  dashboardSidebar(
    #sidebarmenu
    sidebarMenu(
      id = "sidebar",
      
      #first menuitem
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "visualization", tabName = "viz", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the Variable", choices = c1, selected ="Msme_Service"))
  ),
  dashboardBody(
    tabItems(
      # first tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id="tl",width = 12,
                     tabPanel("About", icon = icon("address-card"), fluidRow(
                       column (width = 8, tags$img(src="MSME_day_2022.jpg", width = 600, height = 300),
                               tags$br(),
                               tags$a("Indian States MSME Registration Scenaraio"),align = "center"),
                       column(width = 4,tags$br(),
                              tags$p("The dataset provides comprehensive information on Micro, Small, and Medium Enterprises (MSME) registrations across various districts within a certain region. It includes detailed data on the number of registrations for each category of enterprise (micro, small, medium) classified by services and manufacturing sectors in each district. Additionally, the dataset encompasses key attributes such as state name, district name, and district code."
                              ))),
                     tabPanel(title = "Data", icon = icon("address-card"), dataTableOutput("dataT")),
                     tabPanel(title = "Structure", icon = icon("address-card"), verbatimTextOutput("structure")),
                     tabPanel(title = "Summary Stats", icon = icon("address-card"), verbatimTextOutput("summary"))
      ))
      ),
    #second tab item of landing page
    tabItem(tabName = "viz",
            tabBox(id="t2", width=12,
            tabPanel(title = "Registration Trends by State", value = "trends",h4("tabpanel-1 placeholder UI")),
            tabPanel(title = "Distribution", value = "distro",h4("tabpanel-2 placeholder UI")),
            tabPanel(title = "Correlation Matrix",h4("tabpanel-3 placeholder UI")),
            tabPanel(title = "Relationship among total MSME Registration and Cardinal Direction", value = "trends",h4("tabpanel-4 placeholder UI"))
            ))
    )))