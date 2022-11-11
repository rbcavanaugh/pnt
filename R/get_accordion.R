#' Generates faq for accordions
#'
#' @export
get_test_description <- function(selected_test){
  
  if(selected_test == "30_cat"){
   div_out = div(
      tags$h5("30-item Computer Adaptive PNT (Fergadiotis et al., 2019):", style = "margin-top:0;margin-bottom:1.25rem;"),
      tags$p("This test adaptively administers 30 items,* beginning with an item targeting average naming ability.
             Items are selected to provide the maximum reduction in the standard error of measurement based
             on the cumulative responses collected. Score estimates from the PNT-CAT30 correlated 0.95 with scores
             from the full PNT and are suitable for estimating the overall severity of anomia in persons with aphasia.
             Change in naming ability can be assessed using a subsequent 30-item adaptive PNT or a Variable Length PNT."),
      tags$em("Average administration time: 8-9 Minutes.")
    )
  } else if(selected_test == "175_cat"){
    div_out = div(
      tags$h5("Full Computer Adaptive PNT (Fergadiotis et al., 2019):", style = "margin-top:0;margin-bottom:1.25rem;"),
      tags$p("This test administers up to 174 items* in adaptive order, beginning with an item targeting
             average naming ability, and proceeding as described above for the PNT-CAT30. This test should be used
             when a more, or maximally precise score estimate is required relative to the PNT-CAT30. Users can
             stop this test at any point during administration, provided that at least 30 items were administered. 
             This test should have psychometric properties similar to or better than those reported for the PNT-CAT30.
             This option is available for an initial test only."),
      tags$em("Average administration time: up to 20-40 minutes.")
    )
  } else if(selected_test == "30_walker"){
    div_out = div(
      tags$h5("30-item Static Short Forms Test (Walker & Schwartz, 2012):", style = "margin-top:0;margin-bottom:1.25rem;"),
      tags$p("These are two static 30-item* PNT short forms with non-overlapping items.
                 The two short forms correlated highly with each other (0.93), and with the full PNT
                 (0.93 and 0.98). This application provides T-score estimates for these short forms on
                 the same scale as the other test versions. Change in naming ability can be assessed
                 using the alternate form."),
      tags$em("Average administration time: similar to PNT-CAT30.")
    )
  } else if(selected_test == "175_standard"){
    div_out = div(
      tags$h5("Full Standard PNT  (Roach et al., 1996)", style = "margin-top:0;margin-bottom:1.25rem;"),
      tags$p("This option provides administration of all 175 items* in standard PNT administration order.
             Although this test can also be stopped at any point during administration and will provide 
             a theoretically valid score estimate and standard error, this is not recommended because 
             we have not collected evidence regarding the validity of short form score estimates
             obtained in this way."),
      tags$em("Average administration time: 20-40 minutes."), br(), br(),
      tags$b("Select next for the option to resume an incomplete test")
    )
  } else if(selected_test == "SEM"){
    div_out = div(
      tags$h5("Variable-length Computer Adaptive Test (Hula et al., 2020):", style = "margin-top:0;margin-bottom:1.25rem;"),
      tags$p("This test adaptively administers items until the standard error of the score estimate
             is as precise as it was for a previously administered PNT-CAT30. It also excludes the
             items given in the previous PNT-CAT30 (required). Score estimates from the PNT-CATVL
             correlated 0.89 with independent estimates from the PNT-CAT30. Although the PNT-CATVL
             administers up to 100 items, the median number of items administered by Hula et al.
             (2020) was 43.5 and the minimum number was 21. This option is available for retest only.
             Average administration time: 9-10 minutes."),
      tags$em("Required upload: A previous PNT-CAT30.")
    )
  }
  
  return(div_out)
  
}



#' Generates faq for accordions
#'
#' @export
accordion_faq <- function(){
  
  bs_accordion(
    id = "accordion_faq",
    items = tagList(
      bs_accordion_item(
        title = "How long should I wait for a response?",
        tags$p("While the standard and short-form PNT administration rules (Roach et al., 1996) allow examinees up to 30 seconds to respond to each item, studies for the PNT-CAT short forms (Fergadiotis et al., 2019; Hula et al., 2020; Walker and Schwartz 2012) allowed only 10 seconds."),
        active = TRUE
      ),
      bs_accordion_item(
        title = "When can I download the data?",
        tags$p("You can download results after the first (non-practice) item has been scored in case you need to end the test early. ")
      ),
      bs_accordion_item(
        title = "I entered the wrong response. Can I go back and fix it?",
        tags$p("While you cannot go back to a previous item, you can download the results at the end of the test, revise the scoring for any items, and re-upload the file under the offline testing function to re-estimate the final score. "),
      ),
      bs_accordion_item(
        title = "What if I need to take a break? / Can I resume an incomplete test?",
        tags$p("For the Standard 175-item PNT, examinees are often allowed a break between items #88 (tractor”) and #89 (queen) if necessary. If running the app locally, the app can be left running. However, if you are using the web/browser-based version of the app, it will time-out after 10 minutes of non-use. Therefore, for the free online version, it is best to end the test and download data. When you are ready to continue, you can upload the downloaded file (unmodified!) on this page to continue the test. Make sure to make the same test administration selections. This option is only available for the 175-item standard test. See https://rbcavanaugh.github.io/pnt/articles/articles/pnt.html for instructions on running the app locally. In general, we recommend this option for administrations of the 175-item PNT and for reserach studies."),
      ),
      bs_accordion_item(
        title = "Should I audio record the test?",
        tags$p("It is generally recommended that examiners audio record testing sessions to preserve responses for later review, as was recommended in the standard PNT instructions."),
      ),
      bs_accordion_item(
        title = "Should I give feedback after a response?",
        tags$p("The standard PNT instructions suggest giving the examinee feedback after a response. However, giving feedback after each response may lead to undesired item learning if repeated administrations of the same items are anticipated (e.g. re-administering the standard PNT175). Studies for the PNT-CAT did not provide feedback. However, for situations where items will not be re-adminsitered (e.g. PNT-CAT30 and PNT-CAT VL), whether to give feedback is up to the discretion of the clinician.")
      ),
      bs_accordion_item(
        title = "How can I use the app on an iPad or other tablet device?",
        tags$p("On a tablet, tap on the center image to advance to the next item (equivalent to pressing enter). Just like on a computer, you must record a resposne for any naming trials. To record a response, tap the far right or far left edge of the screen (either side is fine). Tap once for incorrect (equivalent to pressing 1) and again for correct (equivalent to pressing 2). You can continue to tap on the edge of the screen to toggle between these responses. The same response feedback will be available in the top right of the screen.")
      ),
      bs_accordion_item(
        title = "Where can I find the original PNT Instructions?",
        div(
          tags$p("These instructions have been adapted from the original PNT instructions. They can be found at mrri.org:"), tags$a("https://mrri.org/wp-content/uploads/2016/01/PNT-Admin-Instructions.pdf")
        )
      )
    )
  )
  
}