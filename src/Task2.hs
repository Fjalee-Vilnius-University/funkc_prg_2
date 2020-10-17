module Task2 where
import Data.List as L
import Data.Char as C
import Task2Message

--Int -> String -> Either String JsonLikeValue
parse :: String
parse = message

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
