% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_maxent.R
\name{model_maxent}
\alias{model_maxent}
\title{model_maxent Generate maxent.jar or maxnet model}
\usage{
model_maxent(
  occs,
  bg,
  user.grp,
  bgMsk,
  rms,
  rmsStep,
  fcs,
  clampSel,
  algMaxent,
  catEnvs = NULL,
  parallel = FALSE,
  numCores = NULL,
  logger = NULL,
  spN = NULL
)
}
\arguments{
\item{occs}{data frame of cleaned or processed occurrences obtained from
components occs: Obtain occurrence data or, poccs: Process occurrence data.}

\item{bg}{coordinates of background points to be used for modeling.}

\item{user.grp}{a list of two vectors containing group assignments for
occurrences (occs.grp) and background points (bg.grp).}

\item{bgMsk}{a RasterStack or a RasterBrick of environmental layers cropped
and masked to match the provided background extent.}

\item{rms}{vector of range of regularization multipliers to be used in the
ENMeval run.}

\item{rmsStep}{step to be used when defining regularization multipliers to
be used from the provided range.}

\item{fcs}{feature classes to be tested in the ENMeval run.}

\item{clampSel}{Boolean use of clamping in the model.}

\item{algMaxent}{character. algorithm to be used in modeling. A selection
of "maxnet" or "maxent.jar".}

\item{catEnvs}{if categorical predictor variables are included must provide
the names.}

\item{parallel}{logical. Whether to use parallel in the generation of
models. Default is FALSE}

\item{numCores}{numeric. If using parallel how many cores to use. Default is
NULL.}

\item{logger}{Stores all notification messages to be displayed in the Log
Window of Wallace GUI. Insert the logger reactive list here for running in
shiny, otherwise leave the default NULL.}

\item{spN}{character. Species name to be used for all logger messages.}
}
\value{
Function returns an ENMevaluate object with all the evaluated models
  and a selection of appropriate fields.
}
\description{
This functions generates maxent.jar or maxnet models using
  ENMeval 2.0 and user provided tuning parameters.
}
\details{
The function generates model in ENMeval using a user provided partition of
  occurrences from previous components in the GUI. User can activate
  clamping and input tuning arguments to be used for model building.
}
\examples{
\dontrun{
envs <- envs_userEnvs(rasPath = list.files(system.file("extdata/wc",
                                           package = "wallace"),
                      pattern = ".tif$", full.names = TRUE),
                      rasName = list.files(system.file("extdata/wc",
                                           package = "wallace"),
                      pattern = ".tif$", full.names = FALSE))
occs <- read.csv(system.file("extdata/Bassaricyon_alleni.csv",
                 package = "wallace"))
bg <- read.csv(system.file("extdata/Bassaricyon_alleni_bgPoints.csv",
               package = "wallace"))
partblock <- part_partitionOccs(occs, bg, method = 'block')
rms <- c(1:2)
rmsStep <- 1
fcs <- c('L', 'LQ')
m <- model_maxent(occs = occs, bg = bg, user.grp = partblock,
                  bgMsk = envs, rms = rms, rmsStep, fcs,
                  clampSel = TRUE, algMaxent = "maxnet",
                  parallel = FALSE)
}

}
\seealso{
\code{\link[ENMeval]{ENMevaluate}}
}
\author{
Jamie M. Kass <jamie.m.kass@gmail.com>

Gonzalo E. Pinilla-Buitrago <gepinillab@gmail.com>

Bethany A. Johnson <bjohnso005@citymail.cuny.edu>
}
