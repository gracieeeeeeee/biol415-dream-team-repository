## demo

Brady <-"was today years old"

print(Brady)

summy<-"it is sunny"

myspecies <- c("Danaus plexippus")

# download GBIF occurrence data for this species; this takes time if there are many data points!
gbif_dt <- occ_data(scientificName = myspecies, hasCoordinate = TRUE, limit = 1000)

# take a look at the downloaded data:
gbif_dt
head(gbif_dt)

# check how the data are organized:
names(gbif_dt)
names(gbif_dt$meta)
names(gbif_dt$data)

# get the columns that matter for mapping and cleaning the occurrence data:
myspecies_dat <- gbif_dt$data[ , c("decimalLongitude", "decimalLatitude", "individualCount", 
                                   "occurrenceStatus", "coordinateUncertaintyInMeters", "institutionCode", "references")]
head(myspecies_dat)

# map the occurrence data:
map("world", xlim = range(myspecies_dat$decimalLongitude), ylim = range(myspecies_dat$decimalLatitude))  
points(myspecies_dat[ , c("decimalLongitude", "decimalLatitude")], pch = 20, cex = 1, col = "red3")