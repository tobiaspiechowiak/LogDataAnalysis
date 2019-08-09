
source('GetLogData.R')

library('dplyr')

names.left <- c('AlgoBrowser3_left_canteen_talker_7dB_SNR.log',
                'AlgoBrowser3_left_canteen.log',
                'AlgoBrowser3_left_traffic.log',
                'AlgoBrowser3_left_car.log',
                'AlgoBrowser3_left_meeting.log',
                'AlgoBrowser3_left_canteen_talker_0dB_SNR.log')


names.right <- c('AlgoBrowser3_left_canteen_talker_7dB_SNR.log',
                 'AlgoBrowser3_left_canteen.log',
                 'AlgoBrowser3_left_traffic.log',
                 'AlgoBrowser3_left_car.log',
                 'AlgoBrowser3_left_meeting.log',
                 'AlgoBrowser3_left_canteen_talker_0dB_SNR.log')


data.left <- data.frame()
data.right <- data.frame()


for (idx in 1:6){
  
  a <- GetLogData(names.left[idx]) %>% mutate(class = idx)
  data.left <- rbind(data.left, a[10:nrow(a),]) #start 10 secs in 
  
  a <- GetLogData(names.right[idx]) %>% mutate(class = idx)  
  data.right <- rbind(data.right, a[10:nrow(a),])
  
}

for (idx in 1:ncol(data.left)){
  
  data.left[[idx]] <- as.numeric(as.character(data.left[[idx]]))
  data.right[[idx]] <- as.numeric(as.character(data.right[[idx]]))
  
}

data.left <- data.left %>% mutate(mean_env = rowMeans(data.left[,40:56]))
data.left <- data.left %>% mutate(mean_amb = rowMeans(data.left[,57:73]))

data.right <- data.right %>% mutate(mean_env = rowMeans(data.right[,40:56]))
data.right <- data.right %>% mutate(mean_amb = rowMeans(data.right[,57:73]))









