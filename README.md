# Metadata_CORALNET
R script to read metadata from .jpg photos and and create a .csv to be imported into CORALNET.

## CORALNET METADATA FILE
Depeending on your source you will have a list of Recognized column names. CORALNET provide several standard metadata fields 
for your images such as Date, Camera, Photographer, Water quality, Strobes, Framing gear used, White balance card and Comments.  
In your source you can add 5 auxiliary metadata fields. In this example those are: habitat, country, locality, site and strata. 
We used metadata fiels to add the the info to the photos using lightroom classic.

### Lightroom -> CORALNET
- SourceFile = Name 
- CreateDate = Date
- CreatorRegion = habitat
- CreatorCountry= country
- CreatorCity = locality
- CreatorAddress = site
- ObjectName = strata
- CreatorPostalCode = Height (cm)
- GPSLatitude = Latitude
- GPSLongitude = Longitude
- Model = Camera
- Creator = Photographer
- ImageDescription = Water quality
- LightSource = Strobes
- CreatorWorkTelephone = Framing gear used 
- WhiteBalance = White balance card
- Source = Comments

