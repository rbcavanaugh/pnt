#' This is the user interface for the intro pages bfore testing
#'
#' It looks a little crazy, but is relatively straightforward.
#'
#'
#' @export
intro_tab_div2 <- function() {
  fluidRow(column(style = "padding: 1%;",
                  width = 12,
                  tabsetPanel(
                    type = "hidden",
                    id = "glide",
                    # PAGE 1 #########################################################
                    tabPanelBody(value = "welcome_page", 
                                 fluidRow(
                                   column(align = "center",width = 12,
                                          div(
                                            HTML("<h4>Welcome to the computer adaptive version of the <br> Philadelphia Naming Test</h4>")
                                          )
                                   )), br(),
                                 fluidRow(class = "justify-content-center",
                                          column(width = 9,
                                                 div(
                                                   includeMarkdown(system.file("app/www/new_intro.md",
                                                                               package = "pnt"))
                                                 ),
                                                 br(),
                                                 div(align = "center",
                                                     actionButton("administer_test", "Administer Test"),
                                                     #actionButton("administer_resume", "Resume incomplete test"),
                                                     actionButton("score_test", "Rescore PNT / Score offline test")),
                                                 #actionButton("welcome_next", "Get Started")),
                                                 br(), #br(),
                                                 div(id = "funding",
                                                     includeMarkdown(system.file("app/www/funding.md",
                                                                                 package = "pnt"))
                                                 )
                                          )
                                 )),
                    # PAGE 2 ############################################################################
                    tabPanelBody(value = "new_pnt_page", 
                                 column(width = 8, offset = 2,
                                 div( class = "widgetParent",
                                      div(class = "widget",
                                          div(id = "widget_resume_question",  align = "center",
                                              tags$h5(HTML("Would you like to start a new test <br> or resume an unfinished test?")),
                                              shinyWidgets::radioGroupButtons(
                                                inputId = "resume_question",
                                                label = NULL,
                                                width = "100%",
                                                justified = TRUE,
                                                choices = c("New test" = "new", "Resume test" = "resume")
                                              )),
                                          div(id = "widget_resume_upload", align = "center",
                                              fileInput("file_incomplete", label = "Upload in-progress .csv file:")#,
                                              # div(align = "center",
                                              #     shinyjs::disabled(actionButton("resume", "Continue Test"))
                                              # )
                                              ),
                                           div(id = "widget_retest",  align = "center",
                                                              tags$h5("Is this the first or second administration?", class = "fixh5"),
                                                               shinyWidgets::radioGroupButtons(
                                                                 inputId = "retest",
                                                                 label = NULL,
                                                                 #justified = TRUE,
                                                                 width = "100%",
                                                                 justified = TRUE,
                                                                 choices = c("First" = "1", "Second" = "2")
                                                               )),
                                           
                                           div(id = "widget_upload_previous", align = "center",
                                               tags$h5("Upload the previous test results"),
                                               fileInput("file1", label = NULL, accept = ".csv")),
                                           
                                           div(id = "widget_numitems",
                                             fluidRow(column(width = 4, 
                                                  div(style = "display: flex;height:425px;",
                                                      div(style="margin: auto auto;",
                                                    tags$h5("Select Test Version:"),
                                                    shinyWidgets::radioGroupButtons(
                                                       inputId = "numitems",
                                                       label = NULL,
                                                       choices = c(
                                                         "30-item Adaptive Test" = "30_cat",
                                                         "175-item Adaptive Test" = "175_cat",
                                                         "30-item Static Test" = "30_walker",
                                                         "175-item Standard Test " = "175_standard"
                                                       ),
                                                       direction = "vertical",
                                                       selected = "30_cat",
                                                     )))
                                                  ),
                                             column(width = 8,
                                                    div(style = "display: flex;height:425px;",
                                                        div(style="margin: auto auto;",
                                                    uiOutput("test_description"), br(),
                                                    includeMarkdown(system.file("app/www/esk_footnote.md", package = "pnt"))
                                                        ))
                                             
                                             )
                                             )
                                           ),
                                           
                                           div(id = "widget_exclude_previous",
                                               tags$h5(HTML("Do you want to exclude items from <br> the first administration?")),
                                               shinyWidgets::radioGroupButtons(
                                                              "exclude_previous",
                                                              choices = c(
                                                                "Yes", "No"
                                                              ),
                                                              label = NULL,
                                                              width = "100%",
                                                              justified = TRUE,
                                                             )),
                                           
                                           div(id = "widget_eskimo",
                                               tags$h5('Do you want to exclude item "Eskimo"?', class = "fixh5"),
                                               shinyWidgets::radioGroupButtons(
                                                 "eskimo",
                                                 choices = c(
                                                   "Yes", "No"
                                                 ),
                                                 label = NULL,
                                                 width = "100%",
                                                 justified = TRUE,
                                               )),
                                           div(id = "widget_walker",
                                               tags$h5('Which short form do you want to use?', class = "fixh5"),
                                               shinyWidgets::radioGroupButtons(
                                                 "walker",
                                                 choices = c(
                                                   "Form A" = "A", 
                                                   "Form B" = "B"
                                                 ),
                                                 label = NULL,
                                                 width = "100%",
                                                 justified = TRUE,
                                               )),
                                           div(id = "widget_nav_buttons", align = "center",
                                               actionButton("widget_back", "Back"),
                                               actionButton("widget_next", "Next")
                                           )
                                      )
                    ))),
                    # PAGE 4 #########################################################
                    # tabPanelBody(value = "resume_incomplete_page",
                    #              fluidRow(class = "justify-content-around",
                    #                column(width = 4, align = "center",
                    #                div(class = "widget",
                    #                    fileInput("file_incomplete", label = "Upload in-progress .csv file:"),
                    #                    div(align = "center",
                    #                        shinyjs::disabled(actionButton("resume", "Continue Test"))
                    #                    ))
                    #                ))
                    # ),
                    # PAGE 5 #########################################################
                    tabPanelBody(value = "score_offline_page",
                                 fluidRow(class = "justify-content-around",
                                          column(width = 4,
                                                 div(
                                                   h5("Scoring an offline or completed test"),
                                                   fileInput("file2", "Upload offline or re-scored data", accept = ".csv"),
                                                   shinyjs::hidden(div(id = "input_file_warning", uiOutput("upload_error"))),
                                                   div(
                                                     align = "center",
                                                     actionButton("back_offline", "Back"),
                                                     shinyjs::disabled(actionButton("score_uploaded_data", "OK"))
                                                   )
                                                 )
                                          ),
                                          column(width = 7, class = "testinfo",
                                                 h5("How to upload a file", style = "margin-top:0;margin-bottom:1.25rem;"),
                                                 includeMarkdown(system.file("app/www/rescore_pnt_notes1.md", package = "pnt")),
                                                 downloadButton("downloadEmpty", "Download Blank Spreadsheet"),
                                                 br(), br(),
                                                 includeMarkdown(system.file("app/www/rescore_pnt_notes2.md", package = "pnt"))
                                          )
                                 )),
                    # PAGE 6 #########################################################
                    tabPanelBody(value = "instructions_page",
                                 fluidRow(class = "justify-content-center",
                                          column(style = "padding-right:2%;",
                                                 width = 4,
                                                 h4("Administration Instructions", align = "center"),hr(),
                                                 includeMarkdown(system.file("app/www/instructions.md",
                                                                             package = "pnt")),
                                                 div(
                                                   align = "center",
                                                   actionButton("back_to_test_or_retest", "Back"),
                                                   shinyjs::hidden(
                                                      actionButton("start_practice","Start Practice")
                                                   ),
                                                   shinyjs::hidden(
                                                     actionButton("resume","Resume Test")
                                                   )
                                                 ),br()#,
                                                 # div(
                                                 #   h5("Resume incomplete test"),
                                                 #   p("To resume an incomplete test, upload file with in-progress
                                                 #     data then select continue test below."),
                                                 #   fileInput("file_incomplete", label = NULL),
                                                 #     div( align = "center",
                                                 #       shinyjs::disabled(actionButton("resume", "Continue Test"))
                                                 #     )
                                                 #   )
                                          ),
                                          column(width = 7,
                                                 class = "testinfo",
                                                 h5("Test Administration FAQ", style = "margin-top:0;margin-bottom:1.25rem;"),
                                                 accordion_faq()
                                          )
                                 ))
                  )
                  
  ))
}
