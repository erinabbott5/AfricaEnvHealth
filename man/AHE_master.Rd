\name{AHE_master}
\alias{AHE_master}
\docType{data}
\title{AHE_master}
\description{Master dataset for the continent of Africa by country including varaibles to aid in the study of environment, behavior and human health. As of now, the master dataset contains cross sectional data for 2016 but will eventually include panel data for 2000, 2005, 2010, and 2015 to be able to study changes across space and time.}
\usage{data("AHE_master")}
\format{
  A spatial data frame with 49 observations on the following 15 variables. CRS:4326
  \describe{
    \item{\code{Country}}{Full name: factor}
    \item{\code{subregion}}{Region within the continent: factor}
    \item{\code{areakm}}{Area of the country (km^2): numeric}
    \item{\code{isoa3}}{Three letter country code: factor}
    \item{\code{copd}}{Age-standardized prevalence of COPD per 100,000 people: numeric}
    \item{\code{lungc}}{Age-standardized prevalence of tracheal, bronchus, and lung cancer per 100,000 people: numeric}
    \item{\code{pm25}}{Average annual population-weighted PM2.5 (ug/m^3): integer}
    \item{\code{co2}}{Average carbon dioxide (CO₂) emissions per capita (tonness per year): numeric}
    \item{\code{water}}{Baseline water stress indicator value: numeric}
    \item{\code{smoke}}{Prevalence of daily smoking in populations aged 10
and older (percent): numeric}
    \item{\code{sldfuel}}{Proportion of population using solid fuels: numeric}
    \item{\code{ozone}}{Average seasonal population-weighted ozone (ppb): integer}
    \item{\code{pop}}{Total population count: numeric}
    \item{\code{urbpop}}{Urban population count: numeric}
    \item{\code{perurb}}{Percent of the population living in an urban setting: numeric}
  }
}

\source{Sources for the individual datasets included in the master dataset can be found in the README file on the github:
\url{https://github.com/erinabbott5/AfricaEnvHealth}
}

\examples{
  head(AHE_master)
}
\keyword{datasets}
