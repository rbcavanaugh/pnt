  
#' Text summary for the top of the results page above the plot
#'
#' @param acc acc
#' @param ability ability
#' @param ci_95 ci95
#' @param last_ability last abil
#' @param last_ci_95 last ci95
#' @param first_ability last first
#' @param first_ci_95 first ci
#' @param num_previous num prev
#' @export
get_text_summary <- function(
  ability,
  sem,
  last_ability,
  last_sem,
  num_previous,
  n_items,
  html_p = T
){
  
  
    summary =  paste(
        "The final naming ability estimate is ",
        round(ability, 2),
        " [95% CI: ", round(ability - sem*1.96,2), ", ", round(ability + sem*1.96,2), "]. ",
        "This naming ability estimate is in the ",
        round(pnorm(ability, 50, 10)*100,1), " percentile of naming ability relative to a large sample of persons with aphasia due to left-hemisphere stroke. "
        ,sep = "")
    
    if(num_previous >= 1){
      summary = 
        paste(
          summary,
          "Last assessment, the final naming ability estimate was ",
          round(last_ability,2),
          " [95% CI: ", round(ability - last_sem*1.96,2), ", ", round(ability + last_sem*1.96,2), "]. ",
          "The naming ability estimate was in the ",
          round(pnorm(last_ability, 50, 10)*100,1), " percentile. "
          ,sep = "")
    }
    
    
    if(isTruthy(html_p)){
      out = p(summary)
    } else {
      out = summary
    }
    return(out)
      
}
