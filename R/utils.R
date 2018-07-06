find_file <- function(template, file) {
  template <- system.file("rmarkdown", "templates", template, file,
                          package = "bbtemplates")
  if (template == "") {
    stop("Couldn't find template file ", template, "/", file, call. = FALSE)
  }
  
  template
}

find_resource <- function(template, file) {
  find_file(template, file.path("resources", file))
}
# Call rmarkdown::pdf_document and mark the return value as inheriting pdf_document
inherit_pdf_document <- function(...) {
  fmt <- rmarkdown::pdf_document(...)
  fmt$inherits <- "pdf_document"
  fmt
}

# Helper function to create a custom format derived from pdf_document
# that includes a custom LaTeX template and custom CSL definition
pdf_document_format <- function(..., format, template, csl) {
  
  # base format
  fmt <- inherit_pdf_document(..., template = find_resource(format, template))
  
  # add csl to pandoc_args
  fmt$pandoc$args <- c(fmt$pandoc$args,
                       "--csl",
                       rmarkdown::pandoc_path_arg(find_resource(format, csl)))
  
  
  # return format
  fmt
}