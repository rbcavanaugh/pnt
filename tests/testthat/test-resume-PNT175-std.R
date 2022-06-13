test_that("resume standard PNT 175", {

  #########################################################
  # Get app to results page
  #########################################################

  app <- ShinyDriver$new(here::here(), seed = 1)
  #app$setInputs(welcome_next = "click")
  app$setInputs(administer_test = "click")
  app$setInputs(numitems = "175_standard")
  app$setInputs(next_test = "click")
  app$uploadFile(file_incomplete = here::here("tests", "testthat", "files",
                                              "resume_pnt175-std_grapes.csv"))
  app$setInputs(resume = "click")
  val = app$getAllValues()

  #########################################################
  # TESTS
  #########################################################
  # slide 24 is grapes should be shown next when uploading this file since grapes not logged
  testthat::expect_true(grepl('src="slides/Slide24.jpeg"', val$output$slides_tab$html))
  
})