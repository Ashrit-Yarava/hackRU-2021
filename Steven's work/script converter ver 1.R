library(magick)
#https://levelup.gitconnected.com/batch-editing-images-with-r-3d4aef08bc62
#credits to the above website for inspiration
#change directory names as you see fit
func <- function(x) {
  paste0("C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\images\\", x)
}
fun <- function(x) {
  lapply(list.files(x), pastefun, x = x)
}

pastefun <- function(x, y){
  paste0(x, "\\", y)
}

readscalewrite <- function(x){
  print(x)
  name <- basename(x)
  splicedname <- sub(".jpg.*","",  name)
  a <- image_read(x)
  b <- image_scale(a, "128x128!")
  image_write(b, path = paste0("C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\result images 128x128\\", splicedname, ".png"), format = "png")
}

folders <- list.files(path="C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\images")
folderdir <- lapply(folders, func)
all <- lapply(folderdir, fun)

allcombined <- unlist(all)
lapply(allcombined, readscalewrite)



x <- "C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\images\\apple_pie\\134.jpg"
# this is only for a singular photo
print(image_scale(x,"128x128!"))
image_write()

