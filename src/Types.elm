module Types exposing(..)

type alias Model = 
    { display : String
    , result : String 
    , conversion : Conversion
    , last : Msg
    }

type Conversion
    = Bin
    | Hex 
    | Oct
    | None

type Msg
    = Calc
    | Value Int
    | Conv Conversion
    | Clear
