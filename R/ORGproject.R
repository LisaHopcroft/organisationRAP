library(stringr)

ORGproject <- function( path,
                        project_name = "",
                        report_name = "",
                        author_name = "",
                        author_email = "",
                        author_organisation = "" ) {

    if (dir.exists(path)) {
        stop("This directory already exists")
    }

    ### STEP [0]: generate the necessary directories
    dir.create(path, recursive = TRUE, showWarnings = FALSE)
    dir.create(file.path(path, "! DISTRIBUTED"), showWarnings = FALSE)
    dir.create(file.path(path, "! GENERATED"), showWarnings = FALSE)
    dir.create(file.path(path, "dat" ), showWarnings = FALSE)
    dir.create(file.path(path, "img"), showWarnings = FALSE)

    template_directories = list.dirs(system.file("resources", package="organisationRAP"),recursive=FALSE,full.names=FALSE)
    template_files = setdiff(list.files(system.file("resources", package="organisationRAP")),template_directories)

    ### STEP [1]: copy template documents to project directory
    for ( template_document in template_files ) {
        file_location = system.file( "resources",  template_document,  package = "organisationRAP" )
        file_name = basename( file_location )
        cat( sprintf( "Copying template [%s]\n", file_name ) )
        text_template = readLines( file_location, warn=FALSE )

        text_specific = stringr::str_replace( text_template, "<<PROJECT_NAME>>", project_name )
        text_specific = stringr::str_replace( text_specific, "<<REPORT_NAME>>", report_name )
        text_specific = stringr::str_replace( text_specific, "<<AUTHOR_NAME>>", author_name )
        text_specific = stringr::str_replace( text_specific, "<<AUTHOR_EMAIL>>", author_email )
        text_specific = stringr::str_replace( text_specific, "<<AUTHOR_ORGANISATION>>", author_organisation )

        writeLines( text_specific, file.path( path, file_name ))
    }

    ### STEP [2]: copy directories recursively to project directory
    for ( template_dir in template_directories ) {
        directory_location = system.file( "resources",  template_dir,  package = "organisationRAP" )
        directory_name = basename( directory_location )
        cat( sprintf( "Copying directory [%s]\n", directory_name ) )
        file.copy(directory_location, file.path( path ), recursive = TRUE)
    }


}
