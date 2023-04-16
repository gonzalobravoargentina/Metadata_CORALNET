# Metadata_CORALNET
R script to read metadata from .jpg photos and and create a .csv to be imported into CORALNET.

## CORALNET METADATA FILE
Depeending on your source you will have a list of Recognized column names. CORALNET provide several standard metadata fields 
for your images such as Date, Camera, Photographer, Water quality, Strobes, Framing gear used, White balance card and Comments.  
In your source you can add 5 auxiliary metadata fields. In this example those are: habitat, country, locality, site and strata. 
We used metadata fiels to add the the info to the photos using lightroom classic.

### Lightroom -> CORALNET
- SourceFile = Name 
- DateCreated = Date
- Title = strata
- Country= country
- City = locality
- Location = site
- GPSLatitude = Latitude
- GPSLongitude = Longitude
- Model = Camera
- Creator = Photographer

This script was built for MBON Pole to Pole Source [CoralNet Source](https://coralnet.ucsd.edu/source/1895/)

