module Update exposing(..)

import Types exposing (..)
import Tools exposing (..)

initialModel : Model 
initialModel  = 
    { display = "0000000"
    , result = "0000000"
    , conversion = None 
    , last = Clear}

update : Msg -> Model -> Model 
update msg model = 
    case msg of 
        Value num -> 
            if model.last == Clear then 
                 { model | display = toString num, last = Value num }
            else 
                { model | display = model.display ++ toString num, last = Value num}
        Conv con -> 
            {model | conversion = con, last = Conv con}

        Clear -> 
            { model | display = "000000", result = "000000",last = Clear}
        Calc ->
            if model.last /= Conv None then 
                case model.conversion of
                    Bin -> 
                        {model | result = convertToBin model.display}
                    Hex ->
                        {model | result = convertToHex model.display}
                    Oct -> 
                        {model | result = convertToOct model.display}
                    _ -> 
                       initialModel
            else 
                initialModel
        
