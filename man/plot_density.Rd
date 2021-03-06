\name{plot_density}
\alias{plot_density}
\title{Density and histogram plots from PLOS Article Level Metrics data}
\usage{
  plot_density(input, source = "scopus_citations",
    color = "#1447f2", title = "", description = "",
    plot_type = "density")
}
\arguments{
  \item{input}{A data.frame, usuaally from a call to
  \code{link{alm}}.}

  \item{source}{Data source (column) to plot. Can be a
  single element, or a character vector.}

  \item{color}{Color of the density plot and the title. Can
  be a hex color or rgb, etc.}

  \item{title}{Title for the plot, in top matching the
  color of the density plot.}

  \item{description}{Optional description, subtending the
  title.}

  \item{plot_type}{Type of plot, one of density (default)
  or histogram.}
}
\description{
  Density and histogram plots from PLOS Article Level
  Metrics data
}
\examples{
\dontrun{
library(rplos); library(plyr)
dois <- searchplos(terms='*:*', fields="id",
   toquery=list('cross_published_journal_key:PLoSONE', 'doc_type:full',
   'publication_date:[2010-01-01T00:00:00Z TO 2010-12-31T23:59:59Z]'), limit=200)
alm <- alm(doi=do.call(c,dois$id), total_details=TRUE)
alm <- ldply(alm)
plot_density(alm)
plot_density(alm, color="#DCA121")
plot_density(alm, title="Scopus citations from 2010")
plot_density(alm, title="Scopus citations from 2010", description="Probablity of
   X number of citations for a paper")
plot_density(alm, description="Probablity of X number of citations for a paper")
plot_density(input=alm, source="crossref_citations")
plot_density(input=alm, source="twitter_total")
plot_density(input=alm, source="counter_total")
plot_density(input=alm, source=c("counter_total","crossref_citations"))
plot_density(input=alm, source=c("counter_total","crossref_citations"))
plot_density(input=alm, source=c("counter_total","crossref_citations",
   "twitter_total"))
plot_density(input=alm, source=c("counter_total","crossref_citations","twitter_total"),
   color=c("#DBAC6A", "#E09B33", "#A06D34"))
plot_density(input=alm, source=c("counter_total","crossref_citations",
   "twitter_total","wos_citations"))
plot_density(input=alm, source=c("counter_total","crossref_citations"),
   title="Counter, Crossref, Twitter, and Web of Science")
plot_density(input=alm, source=c("counter_total","crossref_citations",
   "twitter_total","wos_citations"), color=c("#83DFB4","#EFA5A5","#CFD470","#B2C9E4"))
}
}
\author{
  Martin Fenner, mfenner@plos.org, modified by Scott
  Chamberlain
}
\references{
  See a tutorial/vignette for alm at
  \url{http://ropensci.org/tutorials/alm_tutorial.html}
}

