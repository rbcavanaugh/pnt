testthat::test_that("PNT-STANDARD 175-retest", {
  
  #########################################################
  # Get app to results page
  #########################################################
  
  app <- ShinyDriver$new(here::here(), seed = 1)
  responses <- c(rep(c(1,2), 81), 1)
  existing_responses <- read.csv(here::here("tests", "testthat", "files",
                                   "resume_pnt175-std_grapesLogged.csv"))$key[1:11]
  
 # prev = read.csv(here::here("tests", "testthat", "files", "test_upload_standard175.csv"))
  
  all_responses = c(existing_responses, responses)
  
  #app$setInputs(welcome_next = "click")
  app$setInputs(administer_test = "click")
  
  app$setInputs(retest = "2")
  app$setInputs(widget_next = "click")
  
  app$uploadFile(file1 = here::here("tests", "testthat", "files", "test_upload_standard175.csv"))
  app$setInputs(widget_next = "click")
  
  app$setInputs(numitems = "175_standard")
  app$setInputs(widget_next = "click")
  
  app$setInputs(resume_question = "resume")
  app$setInputs(widget_next = "click")
  
  app$uploadFile(file_incomplete = here::here("tests", "testthat", "files",
                                              "resume_pnt175-std_grapesLogged.csv"))
  app$setInputs(widget_next = "click")
  
  app$setInputs(widget_next = "click") # eskimo
  
  
  app$setInputs(resume = "click")
  
  app$findElement('button[data-dismiss="modal"]')$click()

  for(i in 1:length(responses)){
    if(responses[i]==1){
      app$executeScript("Mousetrap.trigger('1');")
    } else {
      app$executeScript("Mousetrap.trigger('2');")
    }
    app$executeScript("Mousetrap.trigger('enter');")
  }

  Sys.sleep(5)
  val = app$getAllValues()
  
  #########################################################
  # TESTS
  #########################################################
  
  # are we on the results page?
  testthat::expect_equal(val$export$current_page, "Results")
  
  # are responses tracked accurately? 
  testthat::expect_equal(sum(val$export$results$key=='2', na.rm = T), sum(all_responses==2))
  testthat::expect_equal(sum(val$export$results$key=='1', na.rm = T), sum(all_responses==1))
  # Are the test administration final numbers saved?
  testthat::expect_equal(sum(!is.na(val$export$irt_final)), 4)
  # Make sure 174 items were administered:
  testthat::expect_equal(
    sum(val$export$results$key=='2', na.rm = T)+sum(val$export$results$key=='1', na.rm = T),
    174)
  # can we download data and the results?
  testthat::expect_gt(length(app$snapshotDownload("download_results-results_download")), 100)
  testthat::expect_gt(length(app$snapshotDownload("download_report-report_download")), 100)
})
