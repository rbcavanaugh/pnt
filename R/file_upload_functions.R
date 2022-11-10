

#' Upload previous data
#'
#' @param file_input 
#'
#' @return a dataframe of previous scores, or an empty df if not validated. 
#' @export
uploadData <- function(file_input){

  file <- file_input
  # check upload
  req(file)
  
  # get file extension
  ext <- tools::file_ext(file$name)
  
  # save upload
  dat <- 
    switch(ext,
           csv = read.csv(file$datapath),
           xlsx = readxl::read_excel(file$datapath, na = "NA"),
           validate("Invalid file; Please upload a .csv or .xlsx file")
    )
  
  if(dat$test[1]=="offline"){
    dat = dat[,1:4]
    
        # Check column names are correct
        if(isTruthy(colnames(dat)!=c("item_number", "target", "key", "test"))){
          error = "Error: Column names have changed"
          return(list(
            dat = tibble::tibble(),
            error = error
          ))
        } 
      
    } else {
    
      # Check column names are correct
      if(isFALSE(all(c("item_number", "target", "key", "test") %in% colnames(dat)))){
        error = "Error: Column names have been changed"
        return(list(
          dat = tibble::tibble(),
          error = error
        ))
      }
      
    }
  
  # no error to begin with
  error = NA
  cols = colnames(dat)

  # remove NA rows
  dat = dat[!is.na(dat$key),cols]
        
  
   if (isTruthy(!all(unique(dat$key) == 1 | unique(dat$key) == 2))){
    # only allow 1 and 2 responses
    return(
      list(dat = dat,
           error ="Error: please only enter 1 for correct and 2 for incorrect in the response column")
    )
  } else if (isTruthy(!all(dat$target %in% item_key$target))){
    # target names must match
    return(
      list(dat = dat,
           error = "Error: some item names have changed")
    )
  } else if (isTruthy(nrow(dat)<30)) {
    # must score at least 30 items
    return(
      list(dat = dat,
           error = "Error: Less than 30 items were scored")
    )
  } else {
    # Good job!
    error = NA
    return(
      list(dat = dat,
           error = error)
    )
  }
  

}


