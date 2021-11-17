

#' gets data for download. 
#'
#' @param dat 
#'
#' @return a dataframe of responses
#' @export
get_data_for_download <- function(values, in_progress){#, current_item, IRT = T
  
  current_item = values$irt_out[[2]]$name
  IRT = values$IRT
  
  tmp <- get_results_data_long(values)
  
dat_out <- tmp %>% dplyr::select(item_number, target, key, resp, response, discrimination, itemDifficulty, slide_num,
                          order, ability, sem, ci_95, 
                          name, date, notes)

if(in_progress == "Assessment" & isTruthy(IRT)){
    dat_out$notes[2] = "Test ended before completed"
    dat_out$notes[3] = "Next item"
    dat_out$notes[4] = current_item
}
return(dat_out)   

}