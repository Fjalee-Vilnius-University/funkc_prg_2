module Task2Message
where

-- ┌         ┐
-- │ O X O O │
-- │ X O X   │
-- │ X X O X │
-- │   O X O │
-- └         ┘
-- seed: 1535842634780406394
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 4

message :: String
message = "d4:prevd4:lastd2:vsl1:Xe2:xsli0ee2:ysli2eee4:prevd4:lastd2:vsl1:Oe2:xsli0ee2:ysli0eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli2ee2:ysli2eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli1ee2:ysl\"i3eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli3ee2:ysli3eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli3ee2:ysli0eee4:prevd4:lastd2:vsl1:Xe2:xsli3ee2:ysli2eee4:prevd4:prevd4:lastd2:vsl1:Xe2:xsli0ee2:ysli1eeee4:lastd2:vsl1:Oe2:xsli2ee2:ysli0eeeeee4:lastd2:vsl1:Xe2:xsli1ee2:ysli0eeeee4:lastd2:vsl1:Xe2:xsli2ee2:ysli3eeeee4:lastd2:vsl1:Xe2:xsli1ee2:ysli2eeeee4:lastd2:vsl1:Xe2:xsli2ee2:ysli1eeeeee4:lastd2:vsl1:Oe2:xsli1ee2:ysli1eeee"

message' :: String
message' = "d4:prevd4:lastd2:vsl1:Xe2:xsli0ee2:ysli2eee4:prevd4:lastd2:vsl1:Oe2:xsli0ee2:ysli0eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli2ee2:ysli2eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli1ee2:ysli3eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli3ee2:ysli3eee4:prevd4:prevd4:lastd2:vsl1:Oe2:xsli3ee2:ysli0eee4:prevd4:lastd2:vsl1:Xe2:xsli3ee2:ysli2eee4:prevd4:prevd4:lastd2:vsl1:Xe2:xsli0ee2:ysli1eeee4:lastd2:vsl1:Oe2:xsli2ee2:ysli0eeeeee4:lastd2:vsl1:Xe2:xsli1ee2:ysli0eeeee4:lastd2:vsl1:Xe2:xsli2ee2:ysli3eeeee4:lastd2:vsl1:Xe2:xsli1ee2:ysli2eeeee4:lastd2:vsl1:Xe2:xsli2ee2:ysli1eeeeee4:lastd2:vsl1:Oe2:xsli1ee2:ysli1eeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 179. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Right [[(0, 'O'), (1, 'X'), (2, 'O'), (3, 'O')], [(0, 'X'), (1, 'O'), (2, 'X')], [(0, 'X'), (1, 'X'), (2, 'O'), (3, 'X')], [(1, 'O'), (2, 'X'), (3, 'O')]]
