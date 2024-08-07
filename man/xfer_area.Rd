% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xfer_area.R
\name{xfer_area}
\alias{xfer_area}
\title{xfer_area Transfer model to a new area}
\usage{
xfer_area(
  evalOut,
  curModel,
  envs,
  xfExt,
  alg,
  outputType = NULL,
  clamp = NULL,
  logger = NULL,
  spN = NULL
)
}
\arguments{
\item{evalOut}{ENMevaluate output from previous module and using any of the
available algorithms.}

\item{curModel}{If algorithm is maxent, model selected by user as best or
optimal, in terms of feature class and regularization multiplier
(e.g 'L_1'). Else must be 1.}

\item{envs}{environmental layers to be used for transferring the model. They
must match the layers used for generating the model in the model component.}

\item{xfExt}{extent of the area to transfer the model. This is defined by the
user in the map of the GUI and is provided as a SpatialPolygons object.}

\item{alg}{character. modeling algorithm used in the model component. Can
be one of : 'BIOCLIM', 'maxent.jar' or 'maxnet'.}

\item{outputType}{output type to be used when algorithm is maxnet
or maxent.jar.}

\item{clamp}{logical. Whether transfer will be of clamped or unclamped
model.}

\item{logger}{Stores all notification messages to be displayed in the Log
Window of Wallace GUI. Insert the logger reactive list here for running
in shiny, otherwise leave the default NULL.}

\item{spN}{Character used to obtain species name for logger messages}
}
\value{
A list of two elements: xferExt and xferArea. The first is a
  RasterBrick or a RasterStack of the environmental variables cropped to the
  area of transfer. The second element is a raster of the transferred model with
  the specified output type.
}
\description{
Function transfers the model generated in previous components to
  a new user drawn area.
}
\details{
This functions transfers the model created in previous
  components to a new area. The area of transfer is user provided in the map
  of the GUI. The model will be transferred to the new area as long as the
  environmental variables are available for the area. This function returns
  a list including the cropped environmental variables used for transferring
  and the transferred model.
}
\examples{
\dontrun{
envs <- envs_userEnvs(rasPath = list.files(system.file("extdata/wc",
                                           package = "wallace"),
                      pattern = ".tif$", full.names = TRUE),
                      rasName = list.files(system.file("extdata/wc",
                                           package = "wallace"),
                      pattern = ".tif$", full.names = FALSE))
# extent of transfer
longitude <- c(-71.58400, -78.81300, -79.34034, -69.83331,
               -66.47149, -66.71319, -71.11931)
latitude <- c(13.18379, 7.52315, 0.93105,
              -1.70167, 0.98391, 6.09208, 12.74980)
selCoords <- matrix(c(longitude, latitude), byrow = FALSE, ncol = 2)
polyExt <-
  sp::SpatialPolygons(list(sp::Polygons(list(sp::Polygon(selCoords)),
                      ID = 1)))
# load model
m <- readRDS(system.file("extdata/model.RDS",
                         package = "wallace"))
modXfer <- xfer_area(evalOut = m, curModel = 1, envs,
                     outputType = 'cloglog', alg = 'maxent.jar',
                     clamp = TRUE, xfExt = polyExt)
}

}
\seealso{
\code{\link[dismo]{predict}}, \code{\link{xfer_time}}
\code{\link{xfer_userEnvs}}
}
\author{
Jamie Kass <jamie.m.kass@gmail.com>

Andrea Paz <paz.andreita@gmail.com>

Gonzalo E. Pinilla-Buitrago <gepinillab@gmail.com>

Bethany A. Johnson <bjohnso005@citymail.cuny.edu>
}
