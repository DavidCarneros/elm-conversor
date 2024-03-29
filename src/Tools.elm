module Tools exposing(convertToBin,convertToHex,convertToOct)

{-
Fichero que contiene las herramientas para que 
funcione el conversor.
-}

{- Funcion que convierte un entero a binario(string)
-}
decToBin : Int -> String 
decToBin value = 
    if value < 2 then
        toString value
    else 
        decToBin (value//2) ++ toString (value % 2) 

{- Funcion que convierte un String a entero y 
llama a la funcion para convetir a binario(string)
-}
convertToBin : String -> String 
convertToBin input = 
    decToBin <|
    Maybe.withDefault 0 <|
    Result.toMaybe <|
    String.toInt <|
    input

{- Funcion que convierte un String a entero y 
llama a la funcion para convetir a hexadecimal(string)
-}
convertToHex : String -> String 
convertToHex input = 
    decToHex <|
    Maybe.withDefault 0 <|
    Result.toMaybe <|
    String.toInt <|
    input
{- Funcion que convierte un entero a Hexadecimal(string)
-}
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
  
{- Funcion que convierte un entero a Octal(string)
-}
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

{- Funcion que convierte un String a entero y 
llama a la funcion para convetir a octal(string)
-}
convertToOct : String -> String 
convertToOct input = 
    decToOct <|
    Maybe.withDefault 0 <|
    Result.toMaybe <|
    String.toInt <|
    input
