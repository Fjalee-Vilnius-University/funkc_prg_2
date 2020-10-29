module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

parse :: Int -> String -> Either String JsonLikeValue
parse size str = 
    case parseJLMap str str of
        Left a -> Left a
        Right (b, "") -> Right b
        Right (b, _) -> Left "Some values are outside of map"

parseJLMap :: String -> String -> Either String (JsonLikeValue, String)
parseJLMap ('d':t) orgStr = 
    case parseAllMapedJLValues t orgStr of
        Left a -> Left a
        Right (mapBody, rest) -> Right (mapBody, rest)
parseJLMap dnStartD orgStr = Left ("Error around character " ++ show errPos ++ ", map has to start with a 'd'")
    where 
        errPos = lenDiff orgStr dnStartD

parseAllMapedJLValues :: String -> String -> Either String (JsonLikeValue, String)
parseAllMapedJLValues ('e':t) orgStr = Right (JLMap [], t)
parseAllMapedJLValues str orgStr =
    case parseMapedJLValue str orgStr of
        Left a -> Left a
        Right ((key, value), rest) ->
            case parseAllMapedJLValues rest orgStr of
                Left a -> Left a
                Right (JLMap acc, rest1) -> Right $ (JLMap ([(key, value)] ++ acc), rest1)
parseAllMapedJLValues [] orgStr = Left ("Error around character " ++ show errPos ++ ", JLMap has to end with an 'e'")
    where 
        errPos = lenDiff orgStr []

parseMapedJLValue :: String -> String -> Either String ((String, JsonLikeValue), String)
parseMapedJLValue str orgStr = 
    case parseString str orgStr of
        Left a -> Left a
        Right (key, rest) ->
            case parseJLValue rest orgStr of
                Left a -> Left a
                Right (value, rest') -> Right ((key, value), rest')
parseMapedJLValue [] orgStr = Left ("Error around character " ++ show errPos ++ ", Empty maped JLValue")
    where
        errPos = lenDiff orgStr []

parseJLValue :: String -> String -> Either String (JsonLikeValue, String)
parseJLValue ('d':t) orgStr =
    case parseJLMap('d':t) orgStr of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLValue ('l':t) orgStr = 
    case parseJLArray ('l':t) orgStr of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLValue ('i':t) orgStr = 
    case parseJLInt ('i':t) orgStr of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLValue (h:t) orgStr = 
    let
        errPos = lenDiff orgStr (h:t)
    in
    if (C.isDigit h)
    then 
        case parseJLString (h:t) orgStr of
            Left a -> Left a
            Right (a, b) -> Right (a, b)
    else Left ("Error around character " ++ show errPos ++ ", JsonLikeValue has to start with a 'd' or a 'l' or an 'i' or a digit")
parseJLValue [] orgStr = Left ("Error around character " ++ show errPos ++ ", Empty JLValue")
    where
        errPos = lenDiff orgStr []

parseJLArray :: String -> String -> Either String (JsonLikeValue, String)
parseJLArray ('l':t) orgStr =
    let
        errPos = lenDiff orgStr ('l':t)
    in
    case parseJLIntOrString t orgStr of
        Left a -> Left a
        Right (value, (fstCh : rest)) ->
            case fstCh of
                'e' -> Right (JLArray [value], rest)
                _ -> Left ("Error around character " ++ show errPos ++ ", list has to end with an 'e'")
parseJLArray [] orgStr = Left ("Error around character " ++ show errPos ++ "Empty Array")
    where
        errPos = lenDiff orgStr []
parseJLArray dnStartL orgStr = Left ("Error around character " ++ show errPos ++ ", list has to start with an 'l'")
    where
        errPos = lenDiff orgStr dnStartL

parseJLIntOrString :: String -> String -> Either String (JsonLikeValue, String)
parseJLIntOrString ('i':t) orgStr = 
    case parseJLInt ('i':t) orgStr of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
parseJLIntOrString (h:t) orgStr =
    let
        errPos = lenDiff orgStr (h:t)
    in
    if C.isDigit h
    then case parseJLString (h:t) orgStr of
        Left a -> Left a
        Right (a, b) -> Right (a, b)
    else Left ("Error around character " ++ show errPos ++ ", Value is nether an Int or a String")
parseJLIntOrString [] orgStr = Left ("Error around character " ++ show errPos ++ ", Empty Int or String")
    where
        errPos = lenDiff orgStr []


parseJLInt :: String -> String -> Either String (JsonLikeValue, String)
parseJLInt ('i':t) orgStr = 
        let 
            errPos = lenDiff orgStr ('i':t)
        in
        case C.isDigit $ head t of
            False -> Left ("Error around character " ++ show errPos ++ ", Integer has 0 digits")
            True ->
                    let
                        prefix = L.takeWhile C.isDigit t
                        postfix = L.drop (length prefix) t
                    in
                        case postfix of
                            ('e':r) -> Right (JLInt (read prefix), r)
                            _ -> Left ("Error around character " ++ show errPos ++ ", Integer has to end with an 'e'")
parseJLInt [] orgStr = Left ("Error around character " ++ show errPos ++ ", Empty Int")
    where
        errPos = lenDiff orgStr []
parseJLInt dnStartI orgStr = Left ("Error around character " ++ show errPos ++ ", Integer has to start with an 'i'")
    where
        errPos = lenDiff orgStr dnStartI

parseJLString :: String -> String -> Either String (JsonLikeValue, String)
parseJLString str orgStr =
    let
        errPos = lenDiff orgStr str
        strLen = if C.isDigit $ head str
            then L.takeWhile C.isDigit str
            else "not declared"
        postfix = L.drop (length strLen) str
    in
        case strLen of 
            "not declared" -> Left ("Error around character " ++ show errPos ++ ", Length of the string was not declared")
            _ ->
                case postfix of
                (':':r) -> Right (JLString $ L.take (read strLen) r, L.drop (read strLen) r)
                _ -> Left ("Error around character " ++ show errPos ++ ", Invalid string")
parseJLString [] orgStr = Left ("Error around character " ++ show errPos ++ ", Empty String")
    where 
        errPos = lenDiff orgStr []

parseString :: String -> String -> Either String (String, String)
parseString str orgStr =
    let
        errPos = lenDiff orgStr str
        strLen = if C.isDigit $ head str
            then L.takeWhile C.isDigit str
            else "not declared"
        postfix = L.drop (length strLen) str
    in
        case strLen of 
            "not declared" -> Left ("Error around character " ++ show errPos ++ ", Length of the string was not declared")
            _ ->
                case postfix of
                (':':r) -> Right (L.take (read strLen) r, L.drop (read strLen) r)
                _ -> Left ("Error around character " ++ show errPos ++ ", Invalid string")
parseString [] orgStr = Left ("Error around character " ++ show errPos ++ ", Empty String")
    where 
        errPos = lenDiff orgStr []

lenDiff :: String -> String -> Int
lenDiff str1 str2 = (length str1) - (length str2)


--------------------------------------------------------------------------------------------------------------------------------

--convert $ parse size message'
convert a = case a of
    Right wholeMap -> 
        getAllTurns wholeMap ([], [], [])

--test :: Either String JsonLikeValue -> Maybe JsonLikeValue
--test :: JsonLikeValue -> JsonLikeValue
getAllTurns :: JsonLikeValue -> ([Int], [Int], [Char]) -> ([Int], [Int], [Char])
getAllTurns wholeMap allTurns = 
    case mapFind wholeMap "last" of
        Nothing -> error "Nothing" -- fix
        Just lstLast -> 
            let
                allTurns' = addTurn lstLast allTurns
            in
                case delFromMap wholeMap ("last", lstLast) of
                    JLMap (h:t) -> getAllTurns (snd h) allTurns'
                    JLMap [] -> allTurns'

addTurn :: JsonLikeValue -> ([Int],[Int],[Char]) -> ([Int],[Int],[Char])
addTurn turn (xsArr,ysArr,vsArr) = 
    case turn of
        JLMap [] -> (xsArr,ysArr,vsArr)
        JLMap turnArr -> 
            case fst (head turnArr) of
                "xs" -> 
                    let
                        parsedInt = parseJLArrayToInt $ snd $ head turnArr
                    in
                        addTurn (JLMap (tail turnArr)) (xsArr ++ [parsedInt], ysArr, vsArr)
                "ys" -> 
                    let
                        parsedInt = parseJLArrayToInt $ snd $ head turnArr
                    in
                        addTurn (JLMap (tail turnArr)) (xsArr, ysArr ++ [parsedInt], vsArr)
                "vs" -> 
                    let
                        parsedStr = parseJLArrayToString $ snd $ head turnArr
                    in
                        addTurn (JLMap (tail turnArr)) (xsArr, ysArr, vsArr ++ parsedStr)

parseJLArrayToInt :: JsonLikeValue -> Int
parseJLArrayToInt arr =
    case arr of
        JLArray [JLInt a] -> a

parseJLArrayToString :: JsonLikeValue -> String
parseJLArrayToString arr =
    case arr of
        JLArray [JLString a] -> a

delFromMap :: JsonLikeValue -> (String, JsonLikeValue) -> JsonLikeValue
delFromMap wholeMap itemDel = 
    case wholeMap of
        JLMap arrayOfTuples -> JLMap $ delete itemDel arrayOfTuples

mapFind :: JsonLikeValue -> String -> Maybe JsonLikeValue 
mapFind (JLMap []) _ = Nothing
mapFind (JLMap (h:t)) needed = 
    if (fst h) == needed
    then Just $ snd h
    else mapFind (JLMap t) needed

mapFindLast :: JsonLikeValue -> String -> Maybe JsonLikeValue 
mapFindLast (JLMap []) _ = Nothing
mapFindLast (JLMap (h:t)) needed = 
    case mapFind (JLMap (h:t)) needed of
        Nothing -> Nothing
        Just value ->
            case isMapContains value needed of
                False -> Just value
                True -> mapFindLast value needed
            
isMapContains ::  JsonLikeValue -> String -> Bool
isMapContains (JLMap (h:t)) needed = 
    case mapFind (JLMap (h:t)) needed of
        Nothing -> False
        Just _ -> True