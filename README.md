# getwikipic
#R function that saves the main image associated with any Wikipedia page

#Takes 3 inputs
  #titles= vector of species name(s)
  #res= desired width in pixels (220 px thumbnail by default)
  #savedest= save destination (w terminal '/'); wd by default

#You only have to provide titles (as a concatenated vector or just a single "title" )

#usage:

getwikipic("MLK")

dest<-("pics/")#if you wanna save to a directory one level up from the working directory

getwikipic(c("Tursiops truncatus","Homo habilis","Myrmecobius fasciatus"),1024,dest)
#save 3 higher quality jpegs in the <working directory path>/pics directory
