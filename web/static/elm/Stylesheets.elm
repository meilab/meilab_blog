port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Styles.MarketingStyle
import Styles.LayoutStyle


-- import Styles.HomepageCss


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "web/static/css/meilab.css"
          , Css.File.compile
                [ Styles.MarketingStyle.css
                , Styles.LayoutStyle.css
                ]
          )
        ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
