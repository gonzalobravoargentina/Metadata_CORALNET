# Set working directory to the folder with the photos (in r Studio= session/Set Working directory /Choose directory)
files <- list.files(pattern = ".jpg|.JPG|.png")#get a list of files .jpg in wd

library(exifr)
dat <- read_exif(files) #read metadata 
dat <- as.data.frame(dat)# create a dataframe

#create a short data.frame with the columms of interest 
library(dplyr)
#names used as Pardelas Benthic Survey in CoralNet
#https://coralnet.ucsd.edu/source/1933/
dat2<- dplyr::select (dat,Name=SourceFile,Date=CreateDate,
                      region=CreatorCountry,
                      site=CreatorRegion,
                      reef_name=`Sub-location`,
                      reef_area=ImageDescription,
                      understory=CreatorAddress,
                      Height_cm=CreatorPostalCode,
                      Latitude=GPSLatitude,Longitude=GPSLongitude,
                      Depth=Title,
                      Camera=Model, 
                      Photographer=Creator)

#set date format
dat2$Date <- as.Date(dat2$Date,"%Y:%m:%d %H:%M:%S")
dat2$Date <- format(as.Date(dat2$Date),'%m/%d/%Y')

#add some standar columns 
dat2$Water_quality <- "good"
dat2$Strobes <- "two"
dat2$Framing_gear_used <- "25x25cm"
dat2$White_balance_card <- "yes"
dat2$Comments <- "Capitulo 4"
dat2$Photographer <- "Gonzalo Bravo"
dat2$understory <- "no"

library(dplyr)
dat2 <- dat2 %>% 
  relocate("Name","Date","region","site","reef_name","reef_area","understory","Height_cm","Latitude","Longitude","Depth","Camera","Photographer","Water_quality","Strobes","Framing_gear_used","White_balance_card","Comments")


#Modify columns names in order to be identical to CoralNet
names(dat2)<-c("Name","Date","region","site","reef name","reef area","understory","Height (cm)","Latitude","Longitude","Depth","Camera","Photographer","Water quality","Strobes","Framing gear used","White balance card","Comments")

#Height (cm) column only numbers allowed
dat2$`Height (cm)` <- 45

#in case we need to reeplace some text in the columns replace
#library(dplyr)
#dat2 <- dat2 %>%
  #mutate(site = ifelse(site == "Tierra del Fuego", "Ushuaia", site))

#dat2 <- dat2 %>%
#  mutate(region = ifelse(region == "GolfoNuevo", "Golfo Nuevo", region))


#Created a csv to be imported to CoralNet
write.csv(dat2, 'metadata.csv',row.names = F)



