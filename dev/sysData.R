
# irt_params = list(
#   method = "EAP",
#   parInt = c(10, 90, 33),
#   priorPar = c(50,10),
#   range = c(10, 90)
# )
load("~/shiny-apps/pnt/R/sysdata.rda")

widgets = list(
widget_new = div(class = "widget",
                 shinyWidgets::radioGroupButtons(
                   inputId = "resume_test",
                   label = "Are you starting a new test or continuing an unfinished test?",
                   choices = c("Starting a new test" = "new", "Continuing an unfinished test" = "resume")
                 )),

widget_upload_incomplete = fileInput("file_incomplete", label = NULL),

widget_retest = div(class = "widget",
                    shinyWidgets::radioGroupButtons(
                      inputId = "retest",
                      label = "Is this a new test or a re-test?",
                      choices = c("Initial test" = "1", "Retest" = "2")
                    )),

widget_upload_previous = fileInput("file1", "Upload the previous results", accept = ".csv"),

widget_numitems = div(
  radioButtons(
    inputId = "numitems",
    label = "Select Test Version:",
    choices = c(
      "30-item Computer Adaptive" = "30_cat",
      "175-item Computer Adaptive" = "175_cat",
      "30-item Short form (Walker)" = "30_walker",
      "175-item Standard" = "175_standard"
    ),
    selected = "30_cat",
    inline = F
  ),
  uiOutput("test_description"),
  includeMarkdown(system.file("app/www/esk_footnote.md", package = "pnt"))
),

widget_exclude_previous = checkboxInput("exclude_previous",value = T,
                                        "Do you want to exclude items from the first administration?"),

widget_eskimo = checkboxInput("eskimo", 'Do you want to exclude item "Eskimo"', value = T),

widget_walker = radioButtons("walker", "Which short form do you want to use?", choices = c("A", "B"), selected = "A")
)

usethis::use_data(
  download_df,
  item_key,
  items,
  correct_key_response,
  end_test_key,
  enter,
  incorrect_key_response,
  jsCode,
  response_keys,
  starting_items,
  thetas,
  irt_params,
  widgets,
  internal = T, overwrite = T)
