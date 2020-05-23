
# Set the wd to the folders with photos

files <- list.files(pattern = "*.jpg")#get a list of files .jpg in wd

library(exifr)
dat <- read_exif(files) #read
dat <- as.data.frame(dat)
#create a data.frame with the columms of interest 
library(dplyr)
#names used as MBON.Pole to Pole source in CoralNet
dat2<- dplyr::select (dat,Name=SourceFile,Date=CreateDate,habitat= CreatorRegion,country=CreatorCountry,locality=CreatorCity,site=CreatorAddress,strata=ObjectName,Height_cm=CreatorPostalCode,Latitude=GPSLatitude,Longitude=GPSLongitude,Camera=Model, Photographer=Creator,Water_quality=ImageDescription, Strobes=LightSource, Framing_gear_used=CreatorWorkTelephone, White_balance_card=WhiteBalance, Comments=Source)

dat2$Date <- as.Date(dat2$Date,"%Y:%m:%d %H:%M:%S")
dat2$Date <- format(as.Date(dat2$Date),'%m/%d/%Y')

#Modify columns names in order to be identical to CoralNet
names(dat2)<-c("Name","Date","habitat","country","locality","site","strata","Height (cm)","Latitude","Longitude","Camera","Photographer","Water quality","Strobes","Framing gear used","White balance card","Comments")


#Created a csv to be imported to CoralNet
write.csv(dat2, 'intertidalargentina.csv',row.names = F)