#' nivopie
#'
#' This is an htmlwidget that draw an interactive pie chart
#'
#' @import htmlwidgets
#'
#' @export
#' @examples
#' id=c("A", "B", "C")
#' value=c(12,13,45)
#' df2=data.frame(id,value)
#' nivopie(df2)
nivopie <- function(data=NULL,
                    ...,
                    width = NULL, height = NULL, elementId = NULL) {
  data<- mapply(
    function(id, value){
      list(id=id, value=value)
    },
    data$id,
    data$value,
    SIMPLIFY = FALSE
  )
  # describe a React component to send to the browser for rendering.
  component <- reactR::reactMarkup(htmltools::tag(
    "ResponsivePie",
    list(
      data=data,
      ...
      )
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'nivopie',
    component,
    width = width,
    height = height,
    package = 'nivopie',
    elementId = elementId
  )
}

#' Shiny bindings for nivopie
#'
#' Output and render functions for using nivopie within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a nivopie
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name nivopie-shiny
#'
#' @export
nivopieOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'nivopie', width, height, package = 'nivopie')
}

#' @rdname nivopie-shiny
#' @export
renderNivopie <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, nivopieOutput, env, quoted = TRUE)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @rdname nivopie-shiny
nivopie_html <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}
