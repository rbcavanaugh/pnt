observeEvent(values$widget_counter,{
  hideMultiple(widgets_chr)
  enableMultiple(widgets_chr)
  #### PAGE 1
  if(values$widget_counter == 0){
    shinyjs::show("widget_resume_question")
    values$widget
  }
  
  #### Page 2
  if(values$widget_counter == 1){
    shinyjs::show("start_over")
    if(input$resume_question=="resume"){
      shinyjs::show("widget_resume_upload")
      shinyjs::show("resume")
      shinyjs::hide("start_practice")
    } else if (input$resume_question=="new") {
      shinyjs::show("widget_retest")
      shinyjs::show("start_practice")
      shinyjs::hide("resume")
    }
  }
  
  #### PAGE 3
  if (values$widget_counter == 2){
    if(input$resume_question == "resume"){
      shinyjs::show("widget_retest")
    } else if (input$resume_question=="new") {
      if(input$retest == "1"){
        shinyjs::show("widget_numitems")
      } else if(input$retest == "2"){
        shinyjs::show("widget_upload_previous")
      }
    }
  }
  
  if (values$widget_counter == 3){
    
    if(input$resume_question == "resume"){
      if(input$retest == "1"){
        shinyjs::show("widget_numitems")
      } else if(input$retest == "2"){
        shinyjs::show("widget_upload_previous")
      }
    } else if(input$resume_question == "new") {
      if(input$retest == "1"){
        if(input$numitems=="30_walker"){
          shinyjs::show("widget_walker")
        } else if (input$numitems == "175_standard") {
          shinyjs::show("widget_eskimo")
        } else {
          changeIntroPage("instructions_page")
        }
      } else if(input$retest == "2"){
        shinyjs::show("widget_numitems")
      }
    }
    
  }
  
  if(values$widget_counter == 4){
    
    if(input$resume_question == "resume"){
      if(input$retest == "1"){
        if(input$numitems=="30_walker"){
          shinyjs::show("widget_walker")
        } else if (input$numitems == "175_standard") {
          shinyjs::show("widget_eskimo")
        } else {
          changeIntroPage("instructions_page")
        }
      } else if(input$retest == "2"){
        if(input$numitems=="30_walker"){
          shinyjs::show("widget_walker")
        } else if (input$numitems == "175_standard") {
          shinyjs::show("widget_eskimo")
        } else {
          changeIntroPage("instructions_page")
        }
      }
    } else if(input$resume_question == "new") {
      if(input$retest == "1"){
        if(input$numitems=="30_walker"){
          changeIntroPage("instructions_page")
        } else if (input$numitems == "175_standard") {
          changeIntroPage("instructions_page")
        } 
      } else if(input$retest == "2"){
        if(input$numitems=="30_walker"){
          shinyjs::show("widget_walker")
        } else if (input$numitems == "175_standard") {
          shinyjs::show("widget_eskimo")
        } else if(input$numitems == "30_cat" | input$numitems == "SEM"){
          shinyjs::show("widget_exclude_previous")
        } else {
          changeIntroPage("instructions_page")
        }
      }
    }
    
  }
  
  if (values$widget_counter == 5){
    
    if(input$resume_question == "resume"){
      if(input$retest == "1"){
        if(input$numitems=="30_walker"){
          changeIntroPage("instructions_page")
        } else if (input$numitems == "175_standard") {
          changeIntroPage("instructions_page")
        } else {
          changeIntroPage("instructions_page")
        }
      } else if(input$retest == "2"){
        if(input$numitems=="30_walker"){
          changeIntroPage("instructions_page")
        } else if (input$numitems == "175_standard") {
          changeIntroPage("instructions_page")
        } 
      }
    } else if(input$resume_question == "new") {
      if(input$retest == "1"){
        
      } else if(input$retest == "2"){
        changeIntroPage("instructions_page")
      }
    }
    
    
  }
  
  if (values$widget_counter == 6){
    changeIntroPage("instructions_page")
  } 
  
  print(values$widget_counter)
})