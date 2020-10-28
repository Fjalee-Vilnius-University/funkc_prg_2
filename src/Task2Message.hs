module Task2Message
where

-- ┌           ┐
-- │ O O O X ? │
-- │ O X O O X │
-- │ X X O O X │
-- │ O X O X O │
-- │ X O X X X │
-- └           ┘
-- seed: 5312648285961206292
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 5

message :: String
message = "d4:lastd2:xsli2ee2:vsl1:Oe2:ysli0eee4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli1ee2:vsl1:Xe2:ysli1eee4:prevd4:lastd2:xsli1ee2:vsl1:Oe2:ysli0eee4:prevd4:lastd2:xsli4ee2:vsl1:Xe2:ysli1eee4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli3ee2:vsl1:Oe2:ysli1eee4:prevd4:prevd4:prevd4:lastd2:xsli0ee2:vsl1:Xe2:ysli4eee4:prevd4:lastd2:xsli4ee2:vsl1:Oe2:ysli3eee4:prevd4:lastd2:xsli3ee2:vsl1:Xe2:ysli3eee4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli1eee4:prevd4:lastd2:xsli3ee2:vsl1:Xe2:ysli0eee4:prevd4:prevd4:prevd4:lastd2:xsli4ee2:vsl1:Oe2:ysli0eee4:prevd4:lastd2:xsli4ee2:vsl1:Xe2:ysli0eeeee4:lastd2:xsli3ee2:vsl1:Xe2:ysli4eeee4:lastd2:xsli0ee2:vsl1:Oe2:ysli1eeeeeeeee4:lastd2:xsli0ee2:vsl1:Oe2:ysli0eeee4:lastd2:xsli2ee2:vsl1:Xe2:ysli4eeeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli0ee2:vsl1:Oe2:ysli3eeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli3eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli2eeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli2ee2:vsl1:Oe2:ysli3eeee\"eee4:lastd2:xsli2ee2:vsl1:Oe2:ysli2eeee4:lastd2:xsli4ee2:vsl1:Xe2:ysli4eeee4:lastd2:xsli1ee2:vsl1:Oe2:ysli4eeee4:lastd2:xsli4ee2:vsl1:Xe2:ysli2eeeee"

message' :: String
message' = "d4:lastd2:xsli2ee2:vsl1:Oe2:ysli0eee4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli1ee2:vsl1:Xe2:ysli1eee4:prevd4:lastd2:xsli1ee2:vsl1:Oe2:ysli0eee4:prevd4:lastd2:xsli4ee2:vsl1:Xe2:ysli1eee4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:xsli3ee2:vsl1:Oe2:ysli1eee4:prevd4:prevd4:prevd4:lastd2:xsli0ee2:vsl1:Xe2:ysli4eee4:prevd4:lastd2:xsli4ee2:vsl1:Oe2:ysli3eee4:prevd4:lastd2:xsli3ee2:vsl1:Xe2:ysli3eee4:prevd4:lastd2:xsli2ee2:vsl1:Oe2:ysli1eee4:prevd4:lastd2:xsli3ee2:vsl1:Xe2:ysli0eee4:prevd4:prevd4:prevd4:lastd2:xsli4ee2:vsl1:Oe2:ysli0eee4:prevd4:lastd2:xsli4ee2:vsl1:Xe2:ysli0eeeee4:lastd2:xsli3ee2:vsl1:Xe2:ysli4eeee4:lastd2:xsli0ee2:vsl1:Oe2:ysli1eeeeeeeee4:lastd2:xsli0ee2:vsl1:Oe2:ysli0eeee4:lastd2:xsli2ee2:vsl1:Xe2:ysli4eeeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli0ee2:vsl1:Oe2:ysli3eeee4:lastd2:xsli1ee2:vsl1:Xe2:ysli3eeee4:lastd2:xsli3ee2:vsl1:Oe2:ysli2eeee4:lastd2:xsli0ee2:vsl1:Xe2:ysli2eeee4:lastd2:xsli2ee2:vsl1:Oe2:ysli3eeeeeee4:lastd2:xsli2ee2:vsl1:Oe2:ysli2eeee4:lastd2:xsli4ee2:vsl1:Xe2:ysli4eeee4:lastd2:xsli1ee2:vsl1:Oe2:ysli4eeee4:lastd2:xsli4ee2:vsl1:Xe2:ysli2eeeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 965. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Left Duplicates
