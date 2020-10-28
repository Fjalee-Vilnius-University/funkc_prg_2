module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

parse :: Int -> String -> Either String JsonLikeValue
parse size str = 
    case parseJLMap str of
        Left a -> Left a
        Right (b, "") -> Right b
        Right (b, _) -> Left "Some values are outside of map"

parseJLMap :: String -> Either String (JsonLikeValue, String)
parseJLMap ('d':t) = 
    case parseAllMapedJLValues t of
        Left a -> Left a
        Right (mapBody, rest) -> Right (mapBody, rest)
parseJLMap _ = Left "Error, map has to start with a 'd'"

parseAllMapedJLValues :: String -> Either String (JsonLikeValue, String)
parseAllMapedJLValues ('e':t) = Right (JLMap [], t)
parseAllMapedJLValues str =
    case parseMapedJLValue str of
        Left a -> Left a
        Right ((key, value), rest) ->
            case parseAllMapedJLValues rest of
                Left a -> Left a
                Right (JLMap acc, rest1) -> Right $ (JLMap ([(key, value)] ++ acc), rest1)
parseAllMapedJLValues [] = Left "Error, JLMap has to end with an 'e'"

parseMapedJLValue :: String -> Either String ((String, JsonLikeValue), String)
parseMapedJLValue str = 
    case parseString str of
        Left a -> Left a
        Right (key, rest) ->
            case parseJLValue rest of
                Left a -> Left a
                Right (value, rest') -> Right ((key, value), rest')
parseMapedJLValue [] = Left "Empty maped JLValue"

parseJLValue :: [Char] -> Either String (JsonLikeValue, String)
parseJLValue ('d':t) =
    case parseJLMap('d':t) of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLValue ('l':t) = 
    case parseJLArray ('l':t) of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLValue ('i':t) = 
    case parseJLInt ('i':t) of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLValue (h:t) = 
    if (C.isDigit h)
    then 
        case parseJLString (h:t) of
            Left a -> Left a
            Right (a, b) -> Right (a, b)
    else Left "Error, JsonLikeValue has to start with a 'd' or a 'l' or an 'i' or a digit"
parseJLValue [] = Left "Empty JLValue"

parseJLArray :: String -> Either String (JsonLikeValue, String)
parseJLArray ('l':t) = 
    case parseJLIntOrString t of
        Left a -> Left a
        Right (value, (fstCh : rest)) ->
            case fstCh of
                'e' -> Right (JLArray [value], rest)
                _ -> Left "Error, one element list has to end with an 'e' after first element in the array"
parseJLArray _ = Left "Error, list has to start with an 'l'"
parseJLArray [] = Left "Empty Array"

parseJLIntOrString :: String -> Either String (JsonLikeValue, String)
parseJLIntOrString ('i':t) = 
    case parseJLInt ('i':t) of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLIntOrString (h:t) =
    if C.isDigit h
    then case parseJLString (h:t) of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
    else Left "Error, Value is nether an Int or a String"
parseJLIntOrString [] = Left "Empty Int or String"

parseJLInt :: String -> Either String (JsonLikeValue, String)
parseJLInt ('i':t) = 
        case C.isDigit $ head t of
            False -> Left "Error, Integer has 0 digits"
            True ->
                    let
                        prefix = L.takeWhile C.isDigit t
                        postfix = L.drop (length prefix) t
                    in
                        case postfix of
                            ('e':r) -> Right (JLInt (read prefix), r)
                            _ -> Left "Error, Integer has to end with an 'e'"
parseJLInt _ = Left "Error, Integer has to start with an 'i'"
parseJLInt [] = Left "Empty Int"

parseJLString :: String -> Either String (JsonLikeValue, String)
parseJLString str =
    let
        strLen = if C.isDigit $ head str
            then L.takeWhile C.isDigit str
            else "not declared"
        postfix = L.drop (length strLen) str
    in
        case strLen of 
            "not declared" -> Left "Error, Length of the string was not declared"
            _ ->
                case postfix of
                (':':r) -> Right (JLString $ L.take (read strLen) r, L.drop (read strLen) r)
                _ -> Left "Error, Invalid string"
parseJLString [] = Left "Empty String"

parseString :: String -> Either String (String, String)
parseString str =
    let
        strLen = if C.isDigit $ head str
            then L.takeWhile C.isDigit str
            else "not declared"
        postfix = L.drop (length strLen) str
    in
        case strLen of 
            "not declared" -> Left "Error, Length of the string was not declared"
            _ ->
                case postfix of
                (':':r) -> Right (L.take (read strLen) r, L.drop (read strLen) r)
                _ -> Left "Error, Invalid string"
parseString [] = Left "Empty String"