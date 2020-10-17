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
                _ -> error "Invalid Integer"
parseInt _ = error "Not integer"
