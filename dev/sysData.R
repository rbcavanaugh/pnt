
# irt_params = list(
#   method = "EAP",
#   parInt = c(10, 90, 33),
#   priorPar = c(50,10),
#   range = c(10, 90)
# )

version = "0.1.1"

# change DESCRIPTION  and CITATION too for version number


usethis::use_data(
  download_df,
  item_key,
  items,
  irt_params,
  correct_key_response,
  end_test_key,
  enter,
  incorrect_key_response,
  jsCode,
  response_keys,
  starting_items,
  thetas,
  version,
  internal = T, overwrite = T)
