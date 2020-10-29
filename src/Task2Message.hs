module Task2Message
where

-- ┌               ┐
-- │ X O O O X O O │
-- │ X O X X O O X │
-- │ X O X O O O X │
-- │ X X X O X X ? │
-- │ O X X O O O X │
-- │ X O O X O X O │
-- │ O X X X O X O │
-- └               ┘
-- seed: 5123676262535044615
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 7

message :: String
message = "d4:prevd4:lastd2:ysli0ee2:xsli0ee2:vsl1:Xee4:prevd4:lastd2:ysli2ee2:xsli5ee2:vsl1:Oee4:prevd4:lastd2:ysli2ee2:xsli6ee2:vsl1:Xee4:prevd4:lastd2:ysli4ee2:xsli3ee2:vsl1:Oee4:prevd4:lastd2:ysli0ee2:xsli4ee2:vsl1:Xee4:prevd4:lastd2:ysli1ee2:xsli1ee2:vsl1:Oee4:prevd4:prevd4:lastd2:ysli4ee2:xsli4ee2:vsl1:Oee4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli0ee2:xsli6ee2:vsl1:Oee4:prevd4:prevd4:prevd4:lastd2:ysli5ee2:xsli3ee2:vsl1:Xee4:prevd4:lastd2:ysli\"1ee2:xsli4ee2:vsl1:Oee4:prevd4:lastd2:ysli5ee2:xsli0ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli1ee2:xsli3ee2:vsl1:Xee4:prevd4:lastd2:ysli5ee2:xsli4ee2:vsl1:Oee4:prevd4:lastd2:ysli3ee2:xsli2ee2:vsl1:Xee4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli2ee2:xsli3ee2:vsl1:Oee4:prevd4:lastd2:ysli6ee2:xsli3ee2:vsl1:Xee4:prevd4:prevd4:prevd4:lastd2:ysli5ee2:xsli2ee2:vsl1:Oee4:prevd4:lastd2:ysli6ee2:xsli1ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli3ee2:xsli4ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli4ee2:xsli1ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli6ee2:xsli2ee2:vsl1:Xee4:prevd4:lastd2:ysli4ee2:xsli5ee2:vsl1:Oee4:prevd4:lastd2:ysli3ee2:xsli5ee2:vsl1:Xee4:prevd4:lastd2:ysli2ee2:xsli4ee2:vsl1:Oee4:prevd4:prevd4:lastd2:ysli4ee2:xsli0ee2:vsl1:Oee4:prevd4:prevd4:prevd4:lastd2:ysli2ee2:xsli2ee2:vsl1:Xee4:prevd4:lastd2:ysli3ee2:xsli6ee2:vsl1:Oee4:prevd4:lastd2:ysli3ee2:xsli6ee2:vsl1:Xeeeee4:lastd2:ysli1ee2:xsli5ee2:vsl1:Oeee4:lastd2:ysli2ee2:xsli0ee2:vsl1:Xeeee4:lastd2:ysli1ee2:xsli2ee2:vsl1:Xeeeeeee4:lastd2:ysli6ee2:xsli6ee2:vsl1:Oeeee4:lastd2:ysli6ee2:xsli4ee2:vsl1:Oeeee4:lastd2:ysli0ee2:xsli2ee2:vsl1:Oeeeee4:lastd2:ysli3ee2:xsli0ee2:vsl1:Xeee4:lastd2:ysli0ee2:xsli5ee2:vsl1:Oeeeee4:lastd2:ysli6ee2:xsli5ee2:vsl1:Xeee4:lastd2:ysli5ee2:xsli6ee2:vsl1:Oeee4:lastd2:ysli5ee2:xsli5ee2:vsl1:Xeee4:lastd2:ysli0ee2:xsli3ee2:vsl1:Oeeeeee4:lastd2:ysli6ee2:xsli0ee2:vsl1:Oeeeeee4:lastd2:ysli3ee2:xsli3ee2:vsl1:Oeee4:lastd2:ysli3ee2:xsli1ee2:vsl1:Xeeee4:lastd2:ysli1ee2:xsli0ee2:vsl1:Xeee4:lastd2:ysli2ee2:xsli1ee2:vsl1:Oeee4:lastd2:ysli4ee2:xsli6ee2:vsl1:Xeee4:lastd2:ysli0ee2:xsli1ee2:vsl1:Oeee4:lastd2:ysli4ee2:xsli2ee2:vsl1:Xeeee4:lastd2:ysli1ee2:xsli6ee2:vsl1:Xeeeeeeeee4:lastd2:ysli5ee2:xsli1ee2:vsl1:Oeee"

message' :: String
message' = "d4:prevd4:lastd2:ysli0ee2:xsli0ee2:vsl1:Xee4:prevd4:lastd2:ysli2ee2:xsli5ee2:vsl1:Oee4:prevd4:lastd2:ysli2ee2:xsli6ee2:vsl1:Xee4:prevd4:lastd2:ysli4ee2:xsli3ee2:vsl1:Oee4:prevd4:lastd2:ysli0ee2:xsli4ee2:vsl1:Xee4:prevd4:lastd2:ysli1ee2:xsli1ee2:vsl1:Oee4:prevd4:prevd4:lastd2:ysli4ee2:xsli4ee2:vsl1:Oee4:prevd4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli0ee2:xsli6ee2:vsl1:Oee4:prevd4:prevd4:prevd4:lastd2:ysli5ee2:xsli3ee2:vsl1:Xee4:prevd4:lastd2:ysli1ee2:xsli4ee2:vsl1:Oee4:prevd4:lastd2:ysli5ee2:xsli0ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli1ee2:xsli3ee2:vsl1:Xee4:prevd4:lastd2:ysli5ee2:xsli4ee2:vsl1:Oee4:prevd4:lastd2:ysli3ee2:xsli2ee2:vsl1:Xee4:prevd4:prevd4:prevd4:prevd4:prevd4:lastd2:ysli2ee2:xsli3ee2:vsl1:Oee4:prevd4:lastd2:ysli6ee2:xsli3ee2:vsl1:Xee4:prevd4:prevd4:prevd4:lastd2:ysli5ee2:xsli2ee2:vsl1:Oee4:prevd4:lastd2:ysli6ee2:xsli1ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli3ee2:xsli4ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli4ee2:xsli1ee2:vsl1:Xee4:prevd4:prevd4:lastd2:ysli6ee2:xsli2ee2:vsl1:Xee4:prevd4:lastd2:ysli4ee2:xsli5ee2:vsl1:Oee4:prevd4:lastd2:ysli3ee2:xsli5ee2:vsl1:Xee4:prevd4:lastd2:ysli2ee2:xsli4ee2:vsl1:Oee4:prevd4:prevd4:lastd2:ysli4ee2:xsli0ee2:vsl1:Oee4:prevd4:prevd4:prevd4:lastd2:ysli2ee2:xsli2ee2:vsl1:Xee4:prevd4:lastd2:ysli3ee2:xsli6ee2:vsl1:Oee4:prevd4:lastd2:ysli3ee2:xsli6ee2:vsl1:Xeeeee4:lastd2:ysli1ee2:xsli5ee2:vsl1:Oeee4:lastd2:ysli2ee2:xsli0ee2:vsl1:Xeeee4:lastd2:ysli1ee2:xsli2ee2:vsl1:Xeeeeeee4:lastd2:ysli6ee2:xsli6ee2:vsl1:Oeeee4:lastd2:ysli6ee2:xsli4ee2:vsl1:Oeeee4:lastd2:ysli0ee2:xsli2ee2:vsl1:Oeeeee4:lastd2:ysli3ee2:xsli0ee2:vsl1:Xeee4:lastd2:ysli0ee2:xsli5ee2:vsl1:Oeeeee4:lastd2:ysli6ee2:xsli5ee2:vsl1:Xeee4:lastd2:ysli5ee2:xsli6ee2:vsl1:Oeee4:lastd2:ysli5ee2:xsli5ee2:vsl1:Xeee4:lastd2:ysli0ee2:xsli3ee2:vsl1:Oeeeeee4:lastd2:ysli6ee2:xsli0ee2:vsl1:Oeeeeee4:lastd2:ysli3ee2:xsli3ee2:vsl1:Oeee4:lastd2:ysli3ee2:xsli1ee2:vsl1:Xeeee4:lastd2:ysli1ee2:xsli0ee2:vsl1:Xeee4:lastd2:ysli2ee2:xsli1ee2:vsl1:Oeee4:lastd2:ysli4ee2:xsli6ee2:vsl1:Xeee4:lastd2:ysli0ee2:xsli1ee2:vsl1:Oeee4:lastd2:ysli4ee2:xsli2ee2:vsl1:Xeeee4:lastd2:ysli1ee2:xsli6ee2:vsl1:Xeeeeeeeee4:lastd2:ysli5ee2:xsli1ee2:vsl1:Oeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Left "Error at position 456. But, dear students, please make your error more informative"

expectedConvert :: Either InvalidState To
expectedConvert = Left Duplicates
