% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importBedToMongo.R
\name{queryBedInMongo}
\alias{queryBedInMongo}
\title{simple retrieval of documents representing bed ranges}
\usage{
queryBedInMongo(con, collectionName, queryGRange, queryGen = grConverter, ...)
}
\arguments{
\item{con}{RMongo connection}

\item{collectionName}{character(1) name of collection}

\item{queryGRange}{length(1) GRanges instance}

\item{\dots}{passed to RMongo::dbGetQuery}
}
\description{
simple retrieval of documents representing bed ranges
}
\note{
Note that a default characteristic of RMongo::dbGetQuery is to retrieve 1000 records with parameter \code{limit=1000}.  You can pass alternate
values of this parameter through the ... .
}
\examples{
f1 = dir(system.file("bedfiles", package="TxRegInfra"), full=TRUE, patt="ENCFF971VCD")
chk1 = importBedToMongo(f1, "vjc1", db="txregnet")
stopifnot(chk1)
require(RMongo)
con = mongoDbConnect("txregnet")
require(GenomicRanges)
queryBedInMongo(con, "vjc1", GRanges("chr1", IRanges(1, 8e5))) 
system('mongo txregnet --eval "db.vjc1.remove({})"') # cleanup
}
