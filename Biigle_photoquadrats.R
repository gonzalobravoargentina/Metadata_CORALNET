# Set the working directory to the folder containing the photos 
# (You can do this manually in RStudio: Session -> Set Working Directory -> Choose Directory)
files <- list.files(pattern = ".jpg|.JPG|.png") # Get a list of .jpg or .png files in the current directory

# Load necessary libraries
library(exifr) # For extracting EXIF metadata from image files
library(dplyr) # For data manipulation

# Read metadata from the photos
fotos <- read_exif(files) # Extract metadata from the files
fotos <- as.data.frame(fotos) # Convert the extracted metadata to a dataframe

# Filter and rename columns to match BIIGLE's required format
fotos <- fotos %>%
  select(
    filename = SourceFile,         # File name
    taken_at = DateTimeOriginal,   # Date and time when the photo was taken
    lng = GPSLongitude,            # Longitude coordinate
    lat = GPSLatitude,             # Latitude coordinate
    gps_altitude = GPSAltitude     # Altitude of the camera when the photo was taken
  )

# Add missing columns with default or calculated values
fotos <- fotos %>%
  mutate(
    distance_to_ground = 0.45, # Assign a default distance to the ground (adjust as needed)
    area = 0.0625, # Default area shown in the image (adjust if specific information is available)
    taken_at = ifelse(is.na(taken_at), as.character(Sys.time()), taken_at), # Use current date/time if missing
    lng = as.numeric(lng), # Ensure longitude is numeric
    lat = as.numeric(lat), # Ensure latitude is numeric
    gps_altitude = as.numeric(gps_altitude) # Ensure altitude is numeric
  )

# Export the processed metadata as a CSV file for BIIGLE
write.csv(fotos, "metadata_biigle_cuadrats.csv") # Save the final dataset to a CSV file
