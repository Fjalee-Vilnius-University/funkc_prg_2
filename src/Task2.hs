module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

--data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)

-- parseJLMap :: String -> Either String (JsonLikeValue, String)
-- parseJLMap ('d':t) = 
--         case parseString t of
--             Left a -> Left a
--             Right (key, rest) ->
--                 parseJLMapBody rest
--             -- case name of
--                 --   "prev" -> (JLMap[(name, mapInside)], newRest)
--                 --   "last" -> (JLMap[(name, mapInside)], newRest)
--                 --   _ -> error "Not Map"
-- parseJLMap _ = Left "Error, map has to start with a 'd'"

--d2:ysli2ee2:vsl1:Oe2:xsli0eee4:prevd4:prevd4:prevd4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eee4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Xe2:xsli1eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli2eeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli0eeeee4:lastd2:ysli0ee2:vsl1:Oe2:xsli0eeee4:lastd2:ysli2ee2:vsl1:Xe2:xsli2eeeee"
-- parseJLMapBody bodyStr = 
--     let
--        (mapInside, rest) = parseJLValue bodyStr
--        rest' = if (take 1 rest == "e")
--                 then drop 1 rest
--                 else 
--     in
--         (JLMap[(name, mapInside)], rest')

-- parseJLValue :: [Char] -> Either String (JsonLikeValue, String)
-- parseJLValue ('d':t) = Right parseJLMap('d':t)
-- parseJLValue ('l':t) = Right parseJLArray ('l':t)
-- parseJLValue ('i':t) = Right parseJLInt ('i':t)
-- parseJLValue (h:t) = 
--     if(C.isDigit h)
--     then Right parseJLString (h:t)
--     else Left "Error, value isn't JsonLikeValue"

parseMapedJLArray :: String -> Either String ((String, JsonLikeValue), String)
parseMapedJLArray str = 
    case parseString str of
        Left a -> Left a
        Right (key, rest) ->
            case parseJLArray rest of
                Left a -> Left a
                Right (value, rest') -> Right ((key, value), rest')

parseMapedJLString :: String -> Either String ((String, JsonLikeValue), String)
parseMapedJLString str = 
    case parseString str of
        Left a -> Left a
        Right (key, rest) ->
            case parseJLString rest of
                Left a -> Left a
                Right (value, rest') -> Right ((key, value), rest')

parseMapedJLInt :: String -> Either String ((String, JsonLikeValue), String)
parseMapedJLInt str = 
    case parseString str of
        Left a -> Left a
        Right (key, rest) ->
            case parseJLInt rest of
                Left a -> Left a
                Right (value, rest') -> Right ((key, value), rest')

parseJLArray :: String -> Either String (JsonLikeValue, String)
parseJLArray ('l':t) = 
    case parseJLIntOrString t of
        Left a -> Left a
        Right (value, (fstCh : rest)) ->
            case fstCh of
                'e' -> Right (JLArray [value], rest)
                _ -> Left "Error, one element list has to end with an 'e' after first element in the array"
parseJLArray _ = Left "Error, list has to start with an 'l'"

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