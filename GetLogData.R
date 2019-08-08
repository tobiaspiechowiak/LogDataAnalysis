

GetLogData <- function(filename){
  
  
  dist <- 13
  
  library('dplyr')
  
  Numextract <- function(string){
    unlist(regmatches(string,gregexpr("[[:digit:]]+\\.*[[:digit:]]*",string)))
  }
  
  
  linn <- readLines(filename)
  
  len <- length(linn)
  
  nrow <- floor(len / dist)
  
  a <- matrix(ncol = 3, nrow = nrow)  #time stamps
  b <- matrix(ncol = 7, nrow = nrow)   #environmental_classifier
  c <- matrix(ncol = 17, nrow = nrow)  #warppower
  d <- matrix(ncol = 2, nrow = nrow)  #as_mix_bassZeroOrOne
  e <- matrix(ncol = 2, nrow = nrow)  #as_zoom_amount
  f <- matrix(ncol = 1, nrow = nrow)  #as_mie_factor 
  g <- matrix(ncol = 1, nrow = nrow) #speech_detector probability 
  h <- matrix(ncol = 3, nrow = nrow) #speech detecto states
  i <- matrix(ncol = 1, nrow = nrow) #rear_speech_detector
  j <- matrix(ncol = 1, nrow = nrow)   #noise detector probability
  k <- matrix(ncol = 1, nrow = nrow)   #broadband power
  l <- matrix(ncol = 17, nrow = nrow)   #pnr_env_state
  m <- matrix(ncol = 17, nrow = nrow) #pnr_amb_state
  
  
  output <- list(a,b,c,d,e,f,g,h,i,j,k,l,m)
  
  tmp <- list()
  
  for (i in 1:nrow){
    
    #time stamps
    output[[1]][i,] <- linn[3 + i*dist - dist] %>% Numextract()
    
    
    #environmental_classifier
    output[[2]][i,] <- linn[4 + i*dist - dist] %>% Numextract()
    
    
    #warppower
    output[[3]][i,] <- linn[5 + i*dist - dist] %>% Numextract()
    
    
    #as_mix_bassZeroOrOne
    output[[4]][i,] <- linn[6 + i*dist - dist] %>% Numextract()
    
    
    #as_zoom_amount
    output[[5]][i,] <- linn[7 + i*dist - dist] %>% Numextract()
    
    
    #as_mie_factor 
    output[[6]][i,] <- linn[8 + i*dist - dist] %>% Numextract()
    
    
    #speech_detector probability 
    output[[7]][i,] <- linn[9 + i*dist - dist] %>% Numextract()
    
    
    #speech detector states
    output[[8]][i,] <- linn[10 + i*dist - dist] %>% Numextract()
    
    
    #rear speech detector probability
    output[[9]][i,] <- linn[11 + i*dist - dist] %>% Numextract()
    
    
    #noise detector probability
    output[[10]][i,] <- linn[12 + i*dist - dist] %>% Numextract()
    
    
    #broadband power 
    output[[11]][i,] <- linn[13 + i*dist - dist] %>% Numextract()
    
    
    #pnr_env_state
    output[[12]][i,] <- linn[14 + i*dist - dist] %>% Numextract()
    
    #pnr_amb_state
    output[[13]][i,] <- linn[15 + i*dist - dist] %>% Numextract()
    
    
  }
  
  bla <- data.frame(output)
  
  names(bla) <- c('hour','minute','seconds',
                  'quiet','soft_speech','loud_speech','soft_noise_speech','loud_noise_speech','soft_noise','loud_noise',
                  'warp_1','warp_2','warp_3','warp_4','warp_5','warp_6','warp_7','warp_8', 'warp_9','warp_10','warp_11','warp_12','warp_13','warp_14','warp_15','warp_16','warp_17',
                  'as_mix_bassZeroOrOne_1','as_mix_bassZeroOrOne_2',
                  'as_zoom_amount_1','as_zoom_amount_2',
                  'as_mie_factor',
                  'speech_detector_probability',
                  'speech_detector_states_1','speech_detector_states_2','speech_detector_states_3',
                  'rear_speech_detector_probability',
                  'noise_detector_probability',
                  'broadband power',
                  'pnr_env_state_1','pnr_env_state_2','pnr_env_state_3','pnr_env_state_4','pnr_env_state_5','pnr_env_state_6','pnr_env_state_7','pnr_env_state_8', 'pnr_env_state_9','pnr_env_state_10','pnr_env_state_11','pnr_env_state_12','pnr_env_state_13','pnr_env_state_14','pnr_env_state_15','pnr_env_state_16','pnr_env_state_17',
                  'pnr_amb_state_1','pnr_amb_state_2','pnr_amb_state_3','pnr_amb_state_4','pnr_amb_state_5','pnr_amb_state_6','pnr_amb_state_7','pnr_amb_state_8', 'pnr_amb_state_9','pnr_amb_state_10','pnr_amb_state_11','pnr_amb_state_12','pnr_amb_state_13','pnr_amb_state_14','pnr_amb_state_15','pnr_amb_state_16','pnr_amb_state_17')
  
  
return(bla)  
  
  
  
}


















