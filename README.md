# Metadata_CORALNET
R script to read metadata from photoquadrats and and create a .csv to be imported into CORALNET.

## CORALNET METADATA FILE
Depeending on your source you will have a list of Recognized column names. CORALNET provide several standard metadata fields 
for your images such as Date, Camera, Photographer, Water quality, Strobes, Framing gear used, White balance card and Comments.  
In your source you can add 5 auxiliary metadata fields. In this example those are: habitat, country, locality, site and strata. 
We complete the metadata of the photos using lightroom classic.

### Lightroom -> CORALNET 
We selected metadata fields to add information into the photoquadrats depending if they are from intertidal or subtidal.

## INTERTIDAL PHOTOS
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

## SUBTIDAL PHOTOS
- SourceFile = Name 
- DateCreated = Date
- CreatorCountry = Region
- CreatorRegion= site
- Sub-location = reef_name
- ImageDescription = reef_area
- CreatorAddress =understory
- CreatorPostalCode = Height_cm
- GPSLatitude = Latitude
- GPSLongitude = Longitude
- Title=Depth
- Model = Camera
- Creator = Photographer


