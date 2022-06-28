TestProject <- function( path, name = "" ) {

    if (dir.exists(path)) {stop("This directory already exists")}

    ### generate the necessary directories
    dir.create(path, recursive = TRUE, showWarnings = FALSE)
    # dir.create(...) # e.g., dat/ log/

    ### copy the template files - .Rmd, .R etc.
    # template_files = c()
    # for ( t in template_files ) { file.copy(t, file.path(path)) }

    ### copy directories files and contents - img/
    # template_directories = c()
    # for ( t in template_files ) { file.copy(t, file.path(path)) }
}
