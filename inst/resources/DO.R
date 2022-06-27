rm( list=ls() )

#####################################################################
### Set up your preferred knitr preferences here ####################
#####################################################################
knitr::opts_chunk$set( fig.width =6,
                       fig.height=4,
                       ft.align="left",
                       echo      =FALSE,
                       message   =FALSE,
                       warning   =FALSE,
                       error     =FALSE )

#####################################################################
### Include any libraries necessary to generate the report here #####
#####################################################################
require( lubridate )
require( RColorBrewer )
require( magrittr )
require( rmarkdown )
library( yaml )
library( knitr )

#####################################################################
### BUILD REPORT
#####################################################################
publication_date_string = format( lubridate::today(),'%y%m%d' )

### === Where will the final document be saved? ================== ###
document_dir = "! GENERATED"

### === The main document ======================================== ###
main_document.output_name = sprintf( "%s_report.docx",
                                     publication_date_string )
bookdown::render_book(input       = "index.Rmd",
                      config_file = "_main.yml",
                      clean       = TRUE,
                      output_dir  = document_dir,
                      output_file = main_document.output_name )
