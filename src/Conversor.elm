module Conversor exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class,id,type_)
import Html.Events exposing (onClick)

type alias Model = 
    Int

type Msg 
    = Bin
    | Value Int


initialModel : Model 
initialModel = 
    0


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
    ,div [class "conversor-display"] [text " 000000000 "]
    ,div [class "display-tittle"] [text "Entrada"]
    ,div [class "conversor-display"] [text "000000000"]]


buttons : Model -> Html Msg 
buttons model = 
    div []
        [ div [class "conversor-row"][numButton 1, numButton 2, numButton 3, numButton 0]
        , div [class "conversor-row"][numButton 4, numButton 5, numButton 6, button [class "clear-button"][text "C"]]
        , div [class "conversor-row"][numButton 7, numButton 8, numButton 9, button [class "conversion-button"][text "Bin"]]
        , div [class "conversor-row"][button [class "conversion-button"][text "Hex"],button [class "conversion-button"][text "Oct"]
            , button [class "calc-button"][text "Calc"]]
        ]

numButton : Model -> Html Msg
numButton num = 
    button [class "number-button", onClick (Value num)][text (toString num)]

update : Msg -> Model -> Model 
update msg model = 
    initialModel

main : Program Never Model Msg 
main = 
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }