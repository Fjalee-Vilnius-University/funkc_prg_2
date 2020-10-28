module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

-- parse :: Int -> String -> Either String JsonLikeValue
-- parse size str = 
--     case parseJLMap str of
--         Left a -> Left a
--         Right (b, "") -> Right b
--         Right (b, _) -> Left "Some values are outside of map"

-- parseJLMap :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseJLMap (('d':t), errPos) = 
--     case parseAllMapedJLValues t of
--         Left a -> Left a
--         Right (mapBody, rest) -> Right (mapBody, rest)
-- parseJLMap (_, errPos) = Left "Error, map has to start with a 'd'"

-- parseAllMapedJLValues :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseAllMapedJLValues (('e':t), errPos) = Right (JLMap [], t)
-- parseAllMapedJLValues (str, errPos) =
--     case parseMapedJLValue str of
--         Left a -> Left a
--         Right ((key, value), rest) ->
--             case parseAllMapedJLValues rest of
--                 Left a -> Left a
--                 Right (JLMap acc, rest1) -> Right $ (JLMap ([(key, value)] ++ acc), rest1)
-- parseAllMapedJLValues ([], errPos) = Left "Error, JLMap has to end with an 'e'"

-- parseMapedJLValue :: (String, Int) -> Either String ((String, JsonLikeValue), String)
-- parseMapedJLValue (str, errPos) = 
--     case parseString str of
--         Left a -> Left a
--         Right (key, rest) ->
--             case parseJLValue rest of
--                 Left a -> Left a
--                 Right (value, rest') -> Right ((key, value), rest')
-- parseMapedJLValue ([], errPos) = Left "Empty maped JLValue"

-- parseJLValue :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseJLValue (('d':t), errPos) =
--     case parseJLMap('d':t) of
--         Left a -> Left a
--         Right (a, b) -> Right (a, b)
-- parseJLValue (('l':t), errPos) = 
--     case parseJLArray ('l':t) of
--         Left a -> Left a
--         Right (a, b) -> Right (a, b)
-- parseJLValue (('i':t), errPos) = 
--     case parseJLInt ('i':t) of
--         Left a -> Left a
--         Right (a, b) -> Right (a, b)
-- parseJLValue ((h:t), errPos) = 
--     if (C.isDigit h)
--     then 
--         case parseJLString (h:t) of
--             Left a -> Left a
--             Right (a, b) -> Right (a, b)
--     else Left "Error, JsonLikeValue has to start with a 'd' or a 'l' or an 'i' or a digit"
-- parseJLValue ([], errPos) = Left "Empty JLValue"

-- parseJLArray :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseJLArray (('l':t), errPos) = 
--     case parseJLIntOrString t of
--         Left a -> Left a
--         Right (value, (fstCh : rest)) ->
--             case fstCh of
--                 'e' -> Right (JLArray [value], rest)
--                 _ -> Left "Error, one element list has to end with an 'e' after first element in the array"
-- parseJLArray (_, errPos) = Left "Error, list has to start with an 'l'"
-- parseJLArray ([], errPos) = Left "Empty Array"

-- parseJLIntOrString :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseJLIntOrString (('i':t), errPos) = 
--     case parseJLInt ('i':t) of
--         Left a -> Left a
--         Right (a, b) -> Right (a, b)
-- parseJLIntOrString ((h:t), errPos) =
--     if C.isDigit h
--     then case parseJLString (h:t) of
--         Left a -> Left a
--         Right (a, b) -> Right (a, b)
--     else Left "Error, Value is nether an Int or a String"
-- parseJLIntOrString ([], errPos) = Left "Empty Int or String"

-- parseJLInt :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseJLInt (('i':t), errPos) = 
--         case C.isDigit $ head t of
--             False -> Left "Error, Integer has 0 digits"
--             True ->
--                     let
--                         prefix = L.takeWhile C.isDigit t
--                         postfix = L.drop (length prefix) t
--                     in
--                         case postfix of
--                             ('e':r) -> Right (JLInt (read prefix), r)
--                             _ -> Left "Error, Integer has to end with an 'e'"
-- parseJLInt _ = Left "Error, Integer has to start with an 'i'"
-- parseJLInt ([], errPos) = Left "Empty Int"

-- parseJLString :: (String, Int) -> Either String (JsonLikeValue, String)
-- parseJLString (str, errPos) =
--     let
--         strLen = if C.isDigit $ head str
--             then L.takeWhile C.isDigit str
--             else "not declared"
--         postfix = L.drop (length strLen) str
--     in
--         case strLen of 
--             "not declared" -> Left "Error, Length of the string was not declared"
--             _ ->
--                 case postfix of
--                 (':':r) -> Right (JLString $ L.take (read strLen) r, L.drop (read strLen) r)
--                 _ -> Left "Error, Invalid string"
-- parseJLString ([], errPos) = Left "Empty String"

parseString :: (String, Int) -> Either String (String, String, Int)
parseString (str, errPos) =
    let
        strLen = if C.isDigit $ head str
            then L.takeWhile C.isDigit str
            else "not declared"
        postfix = L.drop (length strLen) str
    in
        case strLen of 
            "not declared" -> Left ("Error around character " ++ show errPos ++ ", Length of the string was not declared")
            _ ->
                case postfix of
                (':':r) -> Right (L.take (read strLen) r, L.drop (read strLen) r, (errPos + lenDiff str (L.drop (read strLen) r)))
                _ -> Left ("Error around character " ++ show errPos ++ ", Invalid string")
parseString ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty String")
-- (errPos + length strLen + 1 + read strLen)

lenDiff :: String -> String -> Int
lenDiff str1 str2 = (length str1) - (length str2)