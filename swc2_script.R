# R Novice Tutuorial U of M WiSE

surveys <- read.csv("surveys.csv")
View(surveys)
?read.csv

surveys <- read.csv("surveys.csv", header = TRUE)

weights<-c(50, 60, 65, 82)
length(weights)
str(weights)
weights<-c(weights, 90)
length(weights)
str(weights)
weights<-c(30, weights)
length(weights)
str(weights)

animals<-c("mouse", "rat", "dog")
length(animals)
str(animals)

example_data<-data.frame(animal=c("dog","cat", "hippo", "sea cucumber"), feel=c("furry", "furry", "slimy", "squishy"), weight=c(45, 8, 4000, 1))
str(example_data)
dim(example_data)
nrow(example_data)
summary(example_data)

animals<-c("mouse", "rat", "dog", "cat")
animals[2]
animals[c(2,3)]
animals[2:4]

#R indexes starting at 1!

surveys[1,1]
surveys[1,6]

#analyzing patient data
dat<-read.csv(file="inflammation-02.csv", header=FALSE)
head(dat)
min(dat[,7])
mean(dat[,7])

#Margin = 1 (across rows); Margin = 2 (across columns)

#Compute average inflammation for each day across all patients
avg_patient_inflammation <- apply(dat, MARGIN=2, mean)
plot(avg_patient_inflammation)

#Compute minimum inflammation for each day across all patients
min_patient_inflammation <- apply(dat, MARGIN=2, min)
plot(min_patient_inflammation)

#Compute maximum inflammation for each day across all patients
max_patient_inflammation <- apply(dat, MARGIN=2, max)
plot(max_patient_inflammation)

#Compute standard deviation inflammation for each day across all patients
sd_patient_inflammation <- apply(dat, MARGIN=2, sd)
plot(sd_patient_inflammation)

#Defining a simple function
fahr_to_kelvin <- function(temp){
  kelvin<-((temp-32)*(5/9))+273.15
  return(kelvin)
}
fahr_to_kelvin(12)

kelvin_to_c <- function(temp){
  c <- temp-273.15
  return(c)
}
kelvin_to_c(262.04)

fahr_to_c <- function(temp){
  tempK <- fahr_to_kelvin(temp)
  tempC <- kelvin_to_c(tempK)
  return(tempC)
}

fahr_to_c(12)

#Function to analyze patient data

analyze <- function(filename){
  dat <- read.csv(file = filename, header=FALSE)
  avg <- apply(dat, MARGIN=2, mean)
  min <- apply(dat, MARGIN=2, min)
  max <- apply(dat, MARGIN=2, max)
  sd <- apply(dat, MARGIN=2, sd)
  plot(avg, main=filename)
  plot(min, main=filename)
  plot(max, main=filename)
  plot(sd, main=filename)
}

analyze("inflammation-02.csv")

#For loop for analyzing all inflammation data

list.files(pattern=".csv")
list.files(pattern="inflammation")

#use a for loop!
filelist<-list.files(pattern="inflammation")

for(f in filelist){
  print(f)
  analyze(f)
}

#Use a function and a for loop!
analyze_all <- function(name){
  filelist <-list.files(pattern=name)
  for(f in filelist){
    print(f)
    analyze(f)
  }
}
analyze_all("inflammation")

#adding comment to demo git in rstudio
