module Task2Message
where

-- ┌           ┐
-- │ O X X O O │
-- │ X X ? O O │
-- │ X X O O X │
-- │ X O X O X │
-- │ X X O O O │
-- └           ┘
-- seed: -4586556274488441162
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 5

message :: String
message = "d4:prevd4:prevd4:lastd2:xsli3ee2:vsl1:Oe2:ysli3eee4:prevd4:prevd4:prevd4:lastd2:xsli4ee2:vsl1:Xe2:ysli3eee4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli1ee2:vsl1:Xe2:ysli0eee4:prevd4:prevd4:prevd4:lastd2:xsli0ee2:vsl1:Oe2:ysli0eee4:prevd4:prevd4:prevd\"4:lastd2:xsli1ee2:vsl1:Xe2:ysli1eee4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli2eee4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli4eee4:prevd4:prevd4:lastd2:xsli3ee2:vsl1:Oe2:ysli1eee4:prevd4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli1eee4:prevd4:lastd2:xsli2ee2:vsl1:Xe2:ysli1eeeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli3eeeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli4eeeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli4ee2:vsl1:Oe2:ysli1eeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli4eeeeee4:lastd2:xsli4ee2:vsl1:Oe2:ysli4eeee4:lastd2:xsli2ee2:vsl1:Xe2:ysli0eeeee4:lastd2:xsli2ee2:vsl1:Xe2:ysli3eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli2eeeee4:lastd2:xsli1ee2:vsl1:Oe2:ysli3eeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli4eeeee4:lastd2:xsli4ee2:vsl1:Oe2:ysli0eeee4:lastd2:xsli4ee2:vsl1:Xe2:ysli2eeeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli1eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli0eeee"

message' :: String
message' = "d4:prevd4:prevd4:lastd2:xsli3ee2:vsl1:Oe2:ysli3eee4:prevd4:prevd4:prevd4:lastd2:xsli4ee2:vsl1:Xe2:ysli3eee4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli1ee2:vsl1:Xe2:ysli0eee4:prevd4:prevd4:prevd4:lastd2:xsli0ee2:vsl1:Oe2:ysli0eee4:prevd4:prevd4:prevd4:lastd2:xsli1ee2:vsl1:Xe2:ysli1eee4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli2eee4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli4eee4:prevd4:prevd4:lastd2:xsli3ee2:vsl1:Oe2:ysli1eee4:prevd4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli1eee4:prevd4:lastd2:xsli2ee2:vsl1:Xe2:ysli1eeeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli3eeeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli4eeeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli4ee2:vsl1:Oe2:ysli1eeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli4eeeeee4:lastd2:xsli4ee2:vsl1:Oe2:ysli4eeee4:lastd2:xsli2ee2:vsl1:Xe2:ysli0eeeee4:lastd2:xsli2ee2:vsl1:Xe2:ysli3eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli2eeeee4:lastd2:xsli1ee2:vsl1:Oe2:ysli3eeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli4eeeee4:lastd2:xsli4ee2:vsl1:Oe2:ysli0eeee4:lastd2:xsli4ee2:vsl1:Xe2:ysli2eeeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli1eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli0eeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 247. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Left Duplicates
