module Conversor exposing (..)

import Html exposing (..)
import View exposing (..)
import Types exposing (..)
import Update exposing (..)

main : Program Never Model Msg 
main = 
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }