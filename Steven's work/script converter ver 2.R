library(magick)
#https://levelup.gitconnected.com/batch-editing-images-with-r-3d4aef08bc62
#credits to the above website for inspiration
#change directory names as you see fit
#takes around 30 or more minutes to convert all the files
func <- function(x) {
  paste0("C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\images\\", x)
}
fun <- function(x) {
  lapply(list.files(x), pastefun, x = x)
}

pastefun <- function(x, y){
  paste0(x, "\\", y)
}
#this is the main function that takes an input directory for a file and
#reads it in, scales it, and writes it to a specified folder
readscalewrite <- function(x){
  print(x)
  name <- basename(x)
  splicedname <- sub(".jpg.*","",  name)
  a <- image_read(x)
  b <- image_scale(a, "256x256!")
  image_write(b, path = paste0("C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\result images 256x256\\", splicedname, ".png"), format = "png")
}


#this section gets the file directories for each individual photo
#this line gets the folder names
folders <- list.files(path="C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\images")

# this line turns the folder names into directories
folderdir <- lapply(folders, func)

# this line gets the filenames and appends them to the folder directories
all <- lapply(folderdir, fun)

#this line converts it all into one list
allcombined <- unlist(all)


#this line applies the main function to every directory name in the list
lapply(allcombined, readscalewrite)





#this is just test code
x <- "C:\\Users\\drago\\OneDrive\\Documents\\HackRU dataset\\images\\apple_pie\\134.jpg"
# this is only for a singular photo
print(image_scale(x,"128x128!"))
image_write()

