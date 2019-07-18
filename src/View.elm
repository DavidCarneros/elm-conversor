module View exposing(..)

import Html exposing (..)
import Html.Attributes exposing (class,id,type_)
import Html.Events exposing (onClick)
import Types exposing (..)

{-
Fichero que contiene la vista del programa
-}

view : Model -> Html Msg 
view model = 
    div [] 
    [ div [class "conversor-tittle"] [text "Conversor"]
        , mainContent model
    ]
    

mainContent : Model -> Html Msg 
mainContent model = 
    div [class "conversor-container"] 
        [ displays model
        , buttons model
        ]

displays : Model -> Html Msg 
displays model = 
    div [] 
    [div [class "display-tittle"][ text "Resultado"]
    ,div [class "conversor-display"] [text model.result]
    ,div [class "display-tittle"] [text "Entrada"]
    ,div [class "conversor-display"] [text model.display]]


buttons : Model -> Html Msg 
buttons model = 
    div []
        [ div [class "conversor-row"][numButton 1, numButton 2, numButton 3, numButton 0]
        , div [class "conversor-row"][numButton 4, numButton 5, numButton 6, button [class "clear-button", onClick Clear][text "C"]]
        , div [class "conversor-row"][numButton 7, numButton 8, numButton 9, button [class "conversion-button",onClick (Conv Bin)][text "Bin"]]
        , div [class "conversor-row"][button [class "conversion-button", onClick (Conv Hex)][text "Hex"],button [class "conversion-button",onClick (Conv Oct)][text "Oct"]
            , button [class "calc-button",onClick Calc][text "Calc"]]
        ]

numButton : Int -> Html Msg
numButton num = 
    button [class "number-button", onClick (Value num)][text (toString num)]