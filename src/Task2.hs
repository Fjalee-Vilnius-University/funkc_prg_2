module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

parse :: Int -> String -> Either String JsonLikeValue
parse size str = 
    case parseJLMap (str, 0) of
        Left a -> Left a
        Right (b, "", errPos) -> Right b
        Right (b, _, errPos) -> Left "Some values are outside of map"

parseJLMap :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseJLMap (('d':t), errPos) = 
    case parseAllMapedJLValues (t, errPos) of
        Left a -> Left a
        Right (mapBody, rest, errPos) -> Right (mapBody, rest, errPos)
parseJLMap (_, errPos) = Left ("Error around character " ++ show errPos ++ ", map has to start with a 'd'")

parseAllMapedJLValues :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseAllMapedJLValues (('e':t), errPos) = Right (JLMap [], t, errPos)
parseAllMapedJLValues (str, errPos) =
    case parseMapedJLValue (str, errPos) of
        Left a -> Left a
        Right ((key, value), rest, errPos) ->
            case parseAllMapedJLValues (rest, errPos) of
                Left a -> Left a
                Right (JLMap acc, rest1, errPos) -> Right $ (JLMap ([(key, value)] ++ acc), rest1, errPos)
parseAllMapedJLValues ([], errPos) = Left ("Error around character " ++ show errPos ++ ", JLMap has to end with an 'e'")

parseMapedJLValue :: (String, Int) -> Either String ((String, JsonLikeValue), String, Int)
parseMapedJLValue (str, errPos) = 
    case parseString (str, errPos) of
        Left a -> Left a
        Right (key, rest, errPos) ->
            case parseJLValue (rest, errPos) of
                Left a -> Left a
                Right (value, rest', errPos) -> Right ((key, value), rest', errPos)
parseMapedJLValue ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty maped JLValue")

parseJLValue :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseJLValue (('d':t), errPos) =
    case parseJLMap(('d':t), errPos) of
        Left a -> Left a
        Right (a, b, c) -> Right (a, b, c)
parseJLValue (('l':t), errPos) = 
    case parseJLArray (('l':t), errPos) of
        Left a -> Left a
        Right (a, b, c) -> Right (a, b, c)
parseJLValue (('i':t), errPos) = 
    case parseJLInt (('i':t), errPos) of
        Left a -> Left a
        Right (a, b, c) -> Right (a, b, c)
parseJLValue ((h:t), errPos) = 
    if (C.isDigit h)
    then 
        case parseJLString ((h:t), errPos) of
            Left a -> Left a
            Right (a, b, c) -> Right (a, b, c)
    else Left ("Error around character " ++ show errPos ++ ", JsonLikeValue has to start with a 'd' or a 'l' or an 'i' or a digit")
parseJLValue ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty JLValue")

parseJLArray :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseJLArray (('l':t), errPos) = 
    case parseJLIntOrString (t, errPos) of
        Left a -> Left a
        Right (value, (fstCh : rest), errPos) ->
            case fstCh of
                'e' -> Right (JLArray [value], rest, errPos + lenDiff ('l':t) rest)
                _ -> Left ("Error around character " ++ show errPos ++ ", one element list has to end with an 'e' after first element in the array")
parseJLArray (_, errPos) = Left ("Error around character " ++ show errPos ++ ", list has to start with an 'l'")
parseJLArray ([], errPos) = Left ("Error around character " ++ show errPos ++ "Empty Array")

parseJLIntOrString :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseJLIntOrString (('i':t), errPos) = 
    case parseJLInt (('i':t), errPos) of
        Left a -> Left a
        Right (a, b, c) -> Right (a, b, c)
parseJLIntOrString ((h:t), errPos) =
    if C.isDigit h
    then case parseJLString ((h:t), errPos) of
        Left a -> Left a
        Right (a, b, c) -> Right (a, b, c)
    else Left ("Error around character " ++ show errPos ++ ", Value is nether an Int or a String")
parseJLIntOrString ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty Int or String")

parseJLInt :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseJLInt (('i':t), errPos) = 
        case C.isDigit $ head t of
            False -> Left ("Error around character " ++ show errPos ++ ", Integer has 0 digits")
            True ->
                    let
                        prefix = L.takeWhile C.isDigit t
                        postfix = L.drop (length prefix) t
                    in
                        case postfix of
                            ('e':r) -> Right (JLInt (read prefix), r, errPos + lenDiff ('i':t) r)
                            _ -> Left ("Error around character " ++ show errPos ++ ", Integer has to end with an 'e'")
parseJLInt (_, errPos) = Left ("Error around character " ++ show errPos ++ ", Integer has to start with an 'i'")
parseJLInt ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty Int")

parseJLString :: (String, Int) -> Either String (JsonLikeValue, String, Int)
parseJLString (str, errPos) =
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
                (':':r) -> Right (JLString $ L.take (read strLen) r, L.drop (read strLen) r, errPos + lenDiff str (L.drop (read strLen) r))
                _ -> Left ("Error around character " ++ show errPos ++ ", Invalid string")
parseJLString ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty String")

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
                (':':r) -> Right (L.take (read strLen) r, L.drop (read strLen) r, errPos + lenDiff str (L.drop (read strLen) r))
                _ -> Left ("Error around character " ++ show errPos ++ ", Invalid string")
parseString ([], errPos) = Left ("Error around character " ++ show errPos ++ ", Empty String")

lenDiff :: String -> String -> Int
lenDiff str1 str2 = (length str1) - (length str2)