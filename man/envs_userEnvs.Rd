% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/envs_userEnvs.R
\name{envs_userEnvs}
\alias{envs_userEnvs}
\title{envs_userEnvs}
\usage{
envs_userEnvs(rasPath, rasName, doBrick = FALSE, logger = NULL)
}
\arguments{
\item{rasPath}{character. Path to rasters, must be the full path including
file name and extension}

\item{rasName}{character. Vector of raster names to be assigned to
loaded rasters}

\item{doBrick}{logical. Converts downloaded rasters to brick for faster
processing}

\item{logger}{Stores all notification messages to be displayed in the Log
Window of Wallace GUI. Insert the logger reactive list here for running in
shiny, otherwise leave the default NULL}
}
\value{
A rasterStack or a rasterBrick (if doBrick = TRUE) of user
  provided rasters
}
\description{
Load user provided rasters
}
\details{
This function is called by the module envs to load user provided raster
  variables for use in further analyses. It returns either a rasterStack or
  rasterBrick of loaded variables with appropriate names for further analyses.
}
\examples{
\dontrun{
pathRast <- list.files(system.file("extdata/wc", package = "wallace"),
                       pattern = ".tif$", full.names = TRUE)
nameRast <- list.files(system.file("extdata/wc", package = "wallace"),
                       pattern = ".tif$", full.names = FALSE)
userEnvs <- envs_userEnvs(rasPath = pathRast, rasName = nameRast)
}

}
\author{
Jamie Kass <jamie.m.kass@gmail.com >

Gonzalo E. Pinilla-Buitrago <gepinillab@gmail.com>
}
