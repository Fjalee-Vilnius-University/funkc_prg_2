module Task2Message
where

--http://tic-tac-toe.homedir.eu/arbitrary/2/9
-- ┌       ┐
-- │ O X X │
-- │ X X O │
-- │ X O O │
-- └       ┘
-- seed: 7631977681515652598
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 3

message :: String
message = "d4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Xe2:xsli0eee4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eeee4:lastd2:ysli0ee2:vsl1:Oe2:xsli0eeee4:l\"astd2:ysli0ee2:vsl1:Xe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli2eeee4:lastd2:ysli2ee2:vsl1:Xe2:xsli0eeee4:lastd2:ysli2ee2:vsl1:Oe2:xsli1eeeee4:lastd2:ysli2ee2:vsl1:Oe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Xe2:xsli1eeee"

message' :: String
message' = "d4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Xe2:xsli0eee4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eeee4:lastd2:ysli0ee2:vsl1:Oe2:xsli0eeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Oe2:xsli2eeee4:lastd2:ysli2ee2:vsl1:Xe2:xsli0eeee4:lastd2:ysli2ee2:vsl1:Oe2:xsli1eeeee4:lastd2:ysli2ee2:vsl1:Oe2:xsli2eeee4:lastd2:ysli1ee2:vsl1:Xe2:xsli1eeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 168. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Right [[(0, 'O'), (1, 'X'), (2, 'X')], [(0, 'X'), (1, 'X'), (2, 'O')], [(0, 'X'), (1, 'O'), (2, 'O')]]
