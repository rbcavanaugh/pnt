test_that("resume PNT-CAT last response logged", {

  #########################################################
  # Get app to results page
  #########################################################

  app <- ShinyDriver$new(here::here(), seed = 1)
  app$setInputs(administer_test = "click")
  
  app$setInputs(resume_question = "resume")
  
  app$uploadFile(file_incomplete = here::here("tests", "testthat", "files", "resume_pntcat175_keyLogged.csv"))
  app$setInputs(widget_next = "click")
  
  #app$setInputs(retest = "1")
  app$setInputs(widget_next = "click")
  
  app$setInputs(widget_next = "click")
  
  app$setInputs(resume = "click")
  
  app$findElement('button[data-dismiss="modal"]')$click()
  
  val = app$getAllValues()

  #########################################################
  # TESTS
  #########################################################
  # the slide shown when resuming should be the cat which is slide 122
  testthat::expect_true(grepl('src="slides/Slide122.jpeg"', val$output$slides_tab$html))
  # also test that the number of items is correct later on. 
})
