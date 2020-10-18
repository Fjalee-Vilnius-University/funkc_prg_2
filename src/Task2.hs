module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

--data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)

test :: [Char] -> (JsonLikeValue, String)
test ('d':t) = undefined
test ('l':t) = parseJLArray ('l':t)
test ('e':t) = undefined
test ('i':t) = parseJLInt ('i':t)
test (h:t) = 
    if(C.isDigit h)
    then parseJLString (h:t)
    else error "symbol not allowed"


--parseJLMap :: String -> (JsonLikeValue, String)
parseJLMap ('d':t) = 
    let
       (name, value) = parseString t
       (mapInside, rest) = test value
    in
        case name of
           "prev" -> (JLMap[(name, mapInside)], rest)
           "last" -> (JLMap[(name, mapInside)], rest)
           _ -> error "Not Map"
parseJLMap _ = error "Not Map"

parseJLArray :: String -> (JsonLikeValue, String)
parseJLArray ('l':t) = 
    let 
        (value, (fstCh : rest)) = parseJLIntOrString t
    in
        case fstCh of
            'e' -> (JLArray [value], rest)
            _ -> error "List wasnt ended correctly"
parseJLArrayTemp _ = error "Not a List" 

parseJLIntOrString :: String -> (JsonLikeValue, String)
parseJLIntOrString ('i':t) = parseJLInt ('i':t)
parseJLIntOrString (h:t) =
    if C.isDigit h
    then parseJLString (h:t)
    else error "Not Int or String"

parseJLInt :: String -> (JsonLikeValue, String)
parseJLInt ('i':t) = 
    let
        prefix = L.takeWhile C.isDigit t
        postfix = L.drop (length prefix) t
    in
            case postfix of
                ('e':r) -> (JLInt (read prefix), r)
                _ -> error "Invalid integer"
parseJLInt _ = error "Not an integer"

parseJLString :: String -> (JsonLikeValue, String)
parseJLString str =
    let
       strLen = 
            L.takeWhile C.isDigit str
       postfix = L.drop (length strLen) str
    in
       case postfix of
           (':':r) -> (JLString (L.take (read strLen) r), L.drop (read strLen) r)
           _ -> error "Invalid string"
parseJLString _ = error "Not a string"

parseString :: String -> (String, String)
parseString str =
    let
       strLen = 
            L.takeWhile C.isDigit str
       postfix = L.drop (length strLen) str
    in
       case postfix of
           (':':r) -> (L.take (read strLen) r, L.drop (read strLen) r)
           _ -> error "Invalid string"
parseString _ = error "Not a string"











--fix delete
parseInt :: String -> (Int, String)
parseInt ('i':t) = 
    let
        prefix = L.takeWhile C.isDigit t
        postfix = L.drop (length prefix) t
    in
            case postfix of
                ('e':r) -> (read prefix, r)
                _ -> error "Invalid integer"
parseInt _ = error "Not an integer"


-- parseMap :: String -> (String, String)
-- parseMap ('d':r) = 
--     let
--        (name, value) = parseString r
--     in
--         case name of
--            "prev" -> parseString r
--            "last" -> parseString r
--            _ -> error "Not Map"
-- parseMap _ = error "not Map"

-- parseJLMap :: String -> (JsonLikeValue)
-- parseJLMap ('d':r) = 
--     let
--        (name, value) = parseString r
--     in
--         case name of
--            "prev" -> JLMap [(name, JLMap value)]
--            "last" -> JLMap [(name, JLMap value)]
--            _ -> error "Not Map"
-- parseJLMap _ = error "not Map"

-- getTypeNxtVal :: String -> String
-- getTypeNxtVal ('d':t) = "Map"
-- getTypeNxtVal ('l':t) = "List"
-- getTypeNxtVal ('e':t) = "End"
-- getTypeNxtVal ('i':t) = "Int"
-- getTypeNxtVal (h:t) = if(C.isDigit h)
--                         then "String"
--                         else error "symbol not allowed"
