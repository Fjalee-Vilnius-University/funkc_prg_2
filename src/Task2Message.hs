module Task2Message
where

-- ┌     ┐
-- │ X X │
-- │     │
-- └     ┘
-- seed: 6203944487583242983
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 2

message :: String
message = "d4:lastd2:vsl1:Xe2:ysli\"0ee2:xsli1eee4:prevd4:lastd2:vsl1:Xe2:ysli0ee2:xsli0eeeee"

message' :: String
message' = "d4:lastd2:vsl1:Xe2:ysli0ee2:xsli1eee4:prevd4:lastd2:vsl1:Xe2:ysli0ee2:xsli0eeeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 24. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Left Order
