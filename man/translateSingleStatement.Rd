% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RenderSql.R
\name{translateSingleStatement}
\alias{translateSingleStatement}
\title{Translates a single SQL statement from one dialect to another}
\usage{
translateSingleStatement(
  sql = "",
  targetDialect,
  tempEmulationSchema = getOption("sqlRenderTempEmulationSchema"),
  oracleTempSchema = NULL
)
}
\arguments{
\item{sql}{The SQL to be translated}

\item{targetDialect}{The target dialect. Currently "oracle", "postgresql", "pdw", "impala",
"sqlite", "sqlite extended", "netezza", "bigquery", "spark", and "redshift" are supported.}

\item{tempEmulationSchema}{Some database platforms like Oracle and Impala do not truly support
temp tables. To emulate temp tables, provide a schema with write
privileges where temp tables can be created.}

\item{oracleTempSchema}{DEPRECATED: use \code{tempEmulationSchema} instead.}
}
\value{
A character vector with the translated SQL.
}
\description{
\code{translateSingleStatement} translates a single SQL statement from one dialect to another.
}
\details{
This function takes SQL in one dialect and translates it into another. It uses simple pattern
replacement, so its functionality is limited. This removes any trailing semicolon as required by
Oracle when sending through JDBC. An error is thrown if more than one statement is encountered in
the SQL.
}
\examples{
translateSingleStatement("USE my_schema;", targetDialect = "oracle")
}
