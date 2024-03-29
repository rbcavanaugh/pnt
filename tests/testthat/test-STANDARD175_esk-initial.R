test_that("PNT-STANDARD 175 eskimo initial", {
  
  #########################################################
  # Get app to results page
  #########################################################
  
  app <- ShinyDriver$new(here::here(), seed = 1)
  responses <- c(rep(c(1,2), 174/2),1)
  
  #app$setInputs(welcome_next = "click")
  app$setInputs(administer_test = "click")
  
  app$setInputs(widget_next = "click")
  
  app$setInputs(widget_next = "click")
  
  app$setInputs(numitems = "175_standard")
  app$setInputs(widget_next = "click")
  
  app$setInputs(widget_next = "click")
  
  app$setInputs(widget_next = "click") # resume?
  
  app$setInputs(eskimo = "No")
  app$setInputs(widget_next = "click") # eskimo
  
  
  app$setInputs(start_practice = "click")

  app$executeScript("Mousetrap.trigger('enter');")
  app$executeScript("Mousetrap.trigger('enter');")
  
  for(i in 1:9){
    app$executeScript("Mousetrap.trigger('1');")
    app$executeScript("Mousetrap.trigger('enter');")
  }
  
  Sys.sleep(0.5)
  app$setInputs(start = "click")
  
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
  

  # are responses tracked accurately? 
  testthat::expect_equal(sum(val$export$results$key=='2', na.rm = T), sum(responses==2))
  testthat::expect_equal(sum(val$export$results$key=='1', na.rm = T), sum(responses==1))
  # Are the test administration final numbers saved?
  testthat::expect_equal(sum(!is.na(val$export$irt_final)), 2)
  # Make sure 175 items were administered:
  testthat::expect_equal(sum(val$export$results$key=='2')+sum(val$export$results$key=='1'), 175)
  # can we download data and the results?
  testthat::expect_gt(length(app$snapshotDownload("download_results-results_download")), 100)
  testthat::expect_gt(length(app$snapshotDownload("download_report-report_download")), 100)
  # are we on the results page?
  testthat::expect_equal(val$export$current_page, "Results")
})
