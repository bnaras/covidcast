% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/covidcast.R
\name{plot.covidcast_signal}
\alias{plot.covidcast_signal}
\title{Plot \code{covidcast_signal} objects}
\usage{
\method{plot}{covidcast_signal}(
  x,
  plot_type = c("choro", "bubble", "line"),
  time_value = NULL,
  include = c(),
  range = NULL,
  choro_col = c("#FFFFCC", "#FD893C", "#800026"),
  alpha = 0.5,
  direction = FALSE,
  dir_col = c("#6F9CC6", "#E4E4E4", "#C56B59"),
  bubble_col = "purple",
  num_bins = 8,
  line_col = 1:6,
  line_type = rep(1:6, each = length(line_col)),
  title = NULL,
  choro_params = list(),
  bubble_params = list(),
  line_params = list(),
  ...
)
}
\arguments{
\item{x}{The \code{covidcast_signal} object to map or plot. If the object contains
multiple issues of the same observation, only the most recent issue is
mapped or plotted.}

\item{plot_type}{One of "choro", "bubble", "line" indicating whether to plot
a choropleth map, bubble map, or line (time series) graph, respectively.
The default is "choro".}

\item{time_value}{Date object (or string in the form \code{"YYYY-MM-DD"})
specifying the day to map, for choropleth and bubble maps. If \code{NULL}, the
default, then the last date in \code{x} is used for the maps. Time series plots
always include all available time values in \code{x}.}

\item{include}{Vector of state abbreviations (case insensitive, so "pa" and
"PA" both denote Pennsylvania) indicating which states to include in the
choropleth and bubble maps. Default is \code{c()}, which is interpreted to mean
all states.}

\item{range}{Vector of two values: min and max, in this order, to use when
defining the color scale for choropleth maps and the size scale for bubble
maps, or the range of the y-axis for the time series plot. If \code{NULL}, the
default, then the min and max are set to be the mean +/- 3 standard
deviations, where this mean and standard deviation are as provided in the
meta data for the given data source and signal.}

\item{choro_col}{Vector of colors, as specified in hex code, to use for the
choropleth color scale. Can be arbitrary in length. Default is similar to
that from covidcast.cmu.edu.}

\item{alpha}{Number between 0 and 1, indicating the transparency level to be
used in the maps. For choropleth maps, this determines the transparency
level for the mega counties. For bubble maps, this determines the
transparency level for the bubbles. Default is 0.5.}

\item{direction}{Should direction be visualized (instead of intensity) for
the choropleth map? Default is \code{FALSE}.}

\item{dir_col}{Vector of colors, as specified in hex code, to use for the
direction color scale. Must be of length 3. Default is similar to that from
covidcast.cmu.edu.}

\item{bubble_col}{Bubble color for the bubble map. Default is "purple".}

\item{num_bins}{Number of bins for determining the bubble sizes for the
bubble map. Default is 6. These bins are evenly-spaced in between the min
and max as specified through the \code{range} parameter. Each bin is assigned
the same bubble size. Also, values of zero special: it has its own separate
(small) bin, and values mapped to the zero bin are not drawn.}

\item{line_col}{Vector of colors for the time series plot. This will be
recycled as necessary. Default is \code{1:6}.}

\item{line_type}{Vector of line types for the time series plot. This will be
recycled as necessary. Default is \code{rep(1:6, each = length(col))}.}

\item{title}{Title for the plot. If \code{NULL}, the default, then a simple title
is used based on the given data source, signal, and time values.}

\item{choro_params, bubble_params, line_params}{Additional parameter lists for
the different plot types, for further customization. See details below.}

\item{...}{Additional arguments, for compatibility with \code{plot()}. Currently
unused.}
}
\description{
Several plot types are provided, including choropleth plots (maps), bubble
plots, and time series plots showing the change of signals over time, for
objects returned by \code{covidcast_signal()}.
}
\details{
The following named arguments are supported through the lists
\code{choro_params}, \code{bubble_params}, and \code{line_params}.

For both choropleth and bubble maps:
\describe{
\item{\code{subtitle}}{Subtitle for the map.}
\item{\code{missing_col}}{Color assigned to missing or NA geo locations.}
\item{\code{border_col}}{Border color for geo locations.}
\item{\code{border_size}}{Border size for geo locations.}
\item{\code{legend_height}, \code{legend_width}}{Height and width of the legend.}
\item{\code{breaks}}{Breaks for a custom (discrete) color or size scale.  Note
that we must set \code{breaks} to be a vector of the same length as \code{choro_col}
for choropleth maps. This works as follows: we assign the \code{i}th color for
choropleth maps, or the \code{i}th size for bubble maps, if and only if the
given value satisfies \verb{breaks[i] <= value < breaks[i+1]}, where we take by
convention \code{breaks[0] = -Inf} and \code{breaks[N+1] = Inf} for \code{N = length(breaks)}.}
}

For choropleth maps only:
\describe{
\item{\code{legend_n}}{Number of values to label on the color bar.}
}

For bubble maps only:
\describe{
\item{\code{remove_zero}}{Should zeros be excluded from the size scale (hence
effectively drawn as bubbles of zero size)?}
\item{\code{min_size}, \code{max_size}}{Min size for the size scale.}
}

For line graphs:
\describe{
\item{\code{xlab}, \code{ylab}}{Labels for the x-axis and y-axis.}
}
}
