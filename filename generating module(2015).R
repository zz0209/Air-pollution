# generating a vector of filenames in "城市_20150102-20151231"
year <- 2015
month <- 1:12
date <- list()

## generating a list of numeric vectors

### generating dates
a <- c(1:31)
b <- c(1:29)
c <- c(1:28)
d <- c(1:30)

### listing the dates
for (i in (1:length(month))){                                 
  if (month[i] == 1| month[i] == 3| month[i] == 5| month[i] == 7| month[i] == 8| month[i] == 10| month[i] == 12){                            
    date[i] <- list(a, b, c, d)[1]
  } else if (month[i] == 4 && year %% 4 == 0){
    date[i] <- list(a, b, c, d)[2]
  } else if (month[i] == 4){
    date[i] <- list(a, b, c, d)[3]
  } else {
    date[i] <- list(a, b, c, d)[4]
  }
}
date

## pasting to generating a vector of filenames

###generating the date number
name_num <- date

for (i in (1:length(month))){
  for (j in (1:length(date[[i]]))){
    if (month[i] < 10 && date[[i]][[j]] < 10){
      name_num[[i]][[j]] <- paste(year, 0, month[i], 0, date[[i]][[j]], sep = "") 
    } else if (month[i] < 10){
      name_num[[i]][[j]] <- paste(year, 0, month[i], date[[i]][[j]], sep = "") 
    } else if (date[[i]][[j]] < 10){
      name_num[[i]][[j]] <- paste(year, month[i], 0, date[[i]][[j]], sep = "") 
    } else {
      name_num[[i]][[j]] <- paste(year, month[i], date[[i]][[j]], sep = "") 
    }
  }
}

###forming the vector
name_num_vec <- vector()

for (i in (1:length(name_num))){
  name_num_vec <- c(name_num_vec, name_num[[i]])
}

name_num_vec

###genetating strings
name_str <- vector()

for (i in (1:length(name_num_vec))){
  name_str[i] <- paste("china_cities_", name_num_vec[i], ".csv", sep = "")
}

name_str

name_str <- name_str[-1]

name_str

#


