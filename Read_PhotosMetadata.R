
# Set working directory to the folder with the photos (in r Studio= session/Set Working directory /Choose directory)
#For this example use photos folder as wd
files <- list.files(pattern = "*.jpg")#get a list of files .jpg in wd

library(exifr)
dat <- read_exif(files) #read metadata 
dat <- as.data.frame(dat)# create a dataframe
#create a short data.frame with the columms of interest 
library(dplyr)
#names used as MBON.Pole to Pole source in CoralNet
#https://coralnet.ucsd.edu/source/1972/
dat2<- dplyr::select (dat,Name=SourceFile,Date=CreateDate,habitat= CreatorRegion,country=CreatorCountry,locality=CreatorCity,site=CreatorAddress,strata=ObjectName,Height_cm=CreatorPostalCode,Latitude=GPSLatitude,Longitude=GPSLongitude,Camera=Model, Photographer=Creator,Water_quality=ImageDescription, Strobes=LightSource, Framing_gear_used=CreatorWorkTelephone, White_balance_card=WhiteBalance, Comments=Source)

dat2$Date <- as.Date(dat2$Date,"%Y:%m:%d %H:%M:%S")
dat2$Date <- format(as.Date(dat2$Date),'%m/%d/%Y')


#Modify columns names in order to be identical to CoralNet
names(dat2)<-c("Name","Date","habitat","country","locality","site","strata","Height (cm)","Latitude","Longitude","Camera","Photographer","Water quality","Strobes","Framing gear used","White balance card","Comments")

#Height (cm) column only numbers allowed
dat2$`Height (cm)` <- 60

#to add info to some column 
#dat2$Strobes <- "alleviate"

#Created a csv to be imported to CoralNet
write.csv(dat2, 'metadata.csv',row.names = F)
