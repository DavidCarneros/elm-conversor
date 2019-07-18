module Tools exposing(convertToBin,convertToHex,convertToOct)

decToBin : Int -> String 
decToBin value = 
    if value // 2 == 0 then
        "0"
    else if value // 2 == 1 then 
        "1"
    else 
        decToBin (value//2) ++ toString (value % 2) 

convertToBin : String -> String 
convertToBin input = 
    decToBin <|
    Maybe.withDefault 0 <|
    Result.toMaybe <|
    String.toInt <|
    input

convertToHex : String -> String 
convertToHex input = 
    decToHex <|
    Maybe.withDefault 0 <|
    Result.toMaybe <|
    String.toInt <|
    input

decToHex : Int -> String 
decToHex value = 
    let
        mod = value % 16
        result = value // 16
    in
        if value == 0 then 
            ""
        else if mod >= 10 then 
            case mod of 
                10 ->
                    decToHex result ++ "A"
                11 ->
                    decToHex result ++"B"
                12 -> 
                    decToHex result ++"C"
                13 -> 
                    decToHex result ++"D"
                14 -> 
                    decToHex result ++ "E"
                15 -> 
                    decToHex result ++ "F"
                _ -> 
                    decToHex result
        else 
            decToHex result ++ toString mod            
  

decToOct : Int -> String 
decToOct value = 
    let
        div = value // 8
        mod = value % 8
    in
        if div == 0 then 
            toString mod
        else 
            decToOct div ++ toString mod

convertToOct : String -> String 
convertToOct input = 
    decToOct <|
    Maybe.withDefault 0 <|
    Result.toMaybe <|
    String.toInt <|
    input
