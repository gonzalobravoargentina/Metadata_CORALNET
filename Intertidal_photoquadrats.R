# Set working directory to the folder with the photos (in r Studio= session/Set Working directory /Choose directory)
files <- list.files(pattern = ".jpg|.JPG|.png")#get a list of files .jpg in wd

library(exifr)
dat <- read_exif(files) #read metadata 
dat <- as.data.frame(dat)# create a dataframe

#create a short data.frame with the columms of interest 
library(dplyr)

#names used as MBON_AMP.AR source in CoralNet
#https://coralnet.ucsd.edu/source/2897/
dat2<- dplyr::select (dat,Name=SourceFile,Date=DateCreated,
                      country=Country,
                      state=State,
                      strata=Title,
                      locality=City,
                      site=Location,
                      Latitude=GPSLatitude,Longitude=GPSLongitude,
                      Camera=Model, 
                      Photographer=Creator)


dat2$Date <- as.Date(dat2$Date,"%Y:%m:%d %H:%M:%S")

#In case we need to change the dates 
#library(lubridate)
# replace the month number with a new month number
#dat2$Date  <- update(dat2$Date , month = 4)
#dat2$habitat <- "Rocky Shore"
dat2$Height_cm <- 42
dat2$Comments <- "AMP5"
dat2$Strobes <- "no"
dat2$Framinggearused <- "25x25cm"

#Modify columns names in order to be identical to CoralNet
names(dat2)<-c("Name","Date","country","state","strata","locality","site","Latitude","Longitude","Camera","Photographer","Height (cm)","Comments","Strobes","Framing gear used")   

#Created a csv to be imported to CoralNet
write.csv(dat2, 'metadata.csv',row.names = F)
