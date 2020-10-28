module Task2Message
where

-- ┌     ┐
-- │     │
-- │ X X │
-- └     ┘
-- seed: -8320007728074224413
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 2

message :: String
message = "d4:lastd2:vsl1:Xe2:ysli1ee2:xsli0eee4:prevd4:lastd2:vsl1:Xe2:ysli1ee2:xsli1eeeee"

message' :: String
message' = "d4:lastd2:vsl1:Xe2:ysli1ee2:xsli0eee4:prevd4:lastd2:vsl1:Xe2:ysli1ee2:xsli1eeeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Right $ JLMap [("last", JLMap [("vs", JLArray [JLString "X"]), ("ys", JLArray [JLInt 1]), ("xs", JLArray [JLInt 0])]), ("prev", JLMap [("last", JLMap [("vs", JLArray [JLString "X"]), ("ys", JLArray [JLInt 1]), ("xs", JLArray [JLInt 1])])])]

expectedConvert :: Either InvalidState To
expectedConvert = Left Order