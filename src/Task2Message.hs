module Task2Message
where

-- ┌       ┐
-- │ X X   │
-- │ O O O │
-- │     X │
-- └       ┘
-- seed: 3290578331702452286
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 3

message :: String
message = "d4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Oe2:xsli1eee4:prevd4:prevd4:prevd4:lastd2:ysli2ee2:vsl1:Xe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli0eeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli0eeeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eeee4:lastd2:ysli1\"ee2:vsl1:Oe2:xsli2eeee"

message' :: String
message' = "d4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Oe2:xsli1eee4:prevd4:prevd4:prevd4:lastd2:ysli2ee2:vsl1:Xe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli0eeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli0eeeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli2eeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 231. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Right [[(0, 'X'), (1, 'X')], [(0, 'O'), (1, 'O'), (2, 'O')], [(2, 'X')]]
