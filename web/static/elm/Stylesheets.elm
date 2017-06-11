port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Styles.MarketingCss
import Styles.LayoutCss
import Styles.BlogCss


-- import Styles.HomepageCss


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "web/static/css/meilab.css"
          , Css.File.compile
                [ Styles.MarketingCss.css
                , Styles.LayoutCss.css
                , Styles.BlogCss.css
                ]
          )
        ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
