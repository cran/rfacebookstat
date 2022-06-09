## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  eval=FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
#  library(rfacebookstat)

## -----------------------------------------------------------------------------
#  library(rfacebookstat)
#  library(googleAnalyticsR)
#  
#  # fb options
#  options(rfacebookstat.username = 'your_facebook_username')
#  
#  # auth
#  fbAuth()
#  ga_auth(email = "google_analytics@gmail.com")
#  
#  # read data from facebook
#  cost_data <- fbGetCostData(accounts_id = 1111111,
#                             date_start  = '2020-03-01',
#                             date_stop   = '2020-03-10',
#                             utm_source  = 'fb',
#                             utm_medium  = 'cpc')
#  
#  # upload into GA source
#  ga_custom_upload_file(accountId          = 2222222,
#                        webPropertyId      = "UA-2222222-1",
#                        customDataSourceId = 'M_XXXXX_Qudk-8g',
#                        cost_data)

