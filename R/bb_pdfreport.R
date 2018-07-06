#' UCCH Core Biostatistics format.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @details Possible arguments for the YAML header are:
#' \itemize{
#'   \item \code{title} title of the manuscript
#'   \item \code{author} list of authors, containing \code{name} and \code{num}
#'   \item \code{subtitle} the subtitle
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "bb_pdfreport", package = "bbtemplates")
#' }
#'
#' @export
bb_pdfreport <- function(..., toc = TRUE) {
  
 
  tpl<-find_resource( "bb_pdfreport","UCCH_REG_tpl.tex")
  tpage<-find_resource( "bb_pdfreport","titleUCCH.tex")
  
  inherit_pdf_document(...,
                       template = tpl,
                       toc = toc,
                       includes = rmarkdown::includes(before_body = tpage))
}

