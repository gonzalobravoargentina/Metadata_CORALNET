# Metadata_CORALNET

## Description
This R script is designed to read metadata from photoquadrats and generate a .csv file that can be easily imported into CORALNET.

## CORALNET Metadata File
When working with CORALNET, you will have a list of recognized column names. CORALNET provides several standard metadata fields for your images, including Date, Camera, Photographer, Water quality, Strobes, Framing gear used, White balance card, and Comments. In addition to these standard fields, you can include five auxiliary metadata fields. In this example, we've used habitat, country, locality, site, and strata as auxiliary fields. We complete the metadata of the photos using Lightroom Classic.

## Lightroom to CORALNET
We have selected specific metadata fields to add information to the photoquadrats in Lightroom. The information varies depending on whether the images are from the intertidal or subtidal zones.

### Example of Metadata Fields:

# Intertidal:
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

# Subtidal
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


