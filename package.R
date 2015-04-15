# update R

  #uninstall old version
  #install new version
  #copy old version library to new's fold
  #then run
  update.packages(checkBuilt=TRUE, ask=FALSE)


# check which packages are currently loaded

path.package() # .path.package() is obselete

# load a package from hard drive

library(MASS)

# download a package from a web

# automatically
  install.packages("mvtnorm", "C:/Program Files/R/R-3.1.2/library/")
  #必须以管理员身份启动Rstudio
  install.packages("mvtnorm")# this add library to win-library under
  #home directory
  
  .libPaths()# tells the lib passes

#manually  
  # see the nuances from the textbook
  
  

