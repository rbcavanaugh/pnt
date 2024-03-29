test_that("score uploaded test 35 csv", { 

  #########################################################
  # Get app to results page # updated for new flow
  #########################################################

  app <- ShinyDriver$new(here::here(), seed = 1)
  app$setInputs(score_test = "click")
  app$uploadFile(file2 = here::here("tests", "testthat", "files", "pnt-cat-35.csv"))
  app$setInputs(score_uploaded_data = "click")
  Sys.sleep(3)
  val = app$getAllValues()

  #########################################################
  # TESTS
  #########################################################
  uploaded_file = read.csv(here::here("tests", "testthat", "files", "pnt-cat-35.csv"))
  
  
  # are we on the results page?
  testthat::expect_equal(val$export$current_page, "Results")
  # are responses tracked accurately? 
  testthat::expect_equal(sum(val$export$results$key==2, na.rm = T),
                         sum(uploaded_file$key==2, na.rm = T))
  # response 1 = correct, 0 = incorrect
  # key 1 = incorrect, 2 = correct
  testthat::expect_equal(sum(val$export$results$response==1, na.rm = T),
                         sum(uploaded_file$key==2, na.rm = T))
  
  testthat::expect_equal(sum(val$export$results$key==1, na.rm = T),
                         sum(uploaded_file$key==1, na.rm = T))
  
  testthat::expect_equal(sum(val$export$results$response==0, na.rm = T),
                         sum(uploaded_file$key==1, na.rm = T))
  
  # Are the test administration final numbers saved?
  testthat::expect_equal(sum(!is.na(val$export$irt_final)), 2)
  # Make sure 30 items were administered:
  testthat::expect_equal(
    sum(val$export$results$key=='2', na.rm = T)+sum(val$export$results$key=='1', na.rm = T),
    35)
  # can we download data and the results?
  testthat::expect_gt(length(app$snapshotDownload("download_results-results_download")), 100)
  testthat::expect_gt(length(app$snapshotDownload("download_report-report_download")), 100)


})
