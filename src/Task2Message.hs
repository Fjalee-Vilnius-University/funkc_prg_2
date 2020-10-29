module Task2Message
where

-- ┌       ┐
-- │ X X X │
-- │   O O │
-- │ ? X O │
-- └       ┘
-- seed: -7753783528582890193
-- encoding: Ben
-- list entry: ARR
-- convert to: LIL

data JsonLikeValue = JLString String | JLInt Int | JLMap [(String, JsonLikeValue)] | JLArray [JsonLikeValue] deriving (Show, Eq)
data InvalidState = Order | Duplicates deriving (Show, Eq)

size :: Int
size = 3

message :: String
message = "d4:lastd2:ysli0ee2:vsl1:Xe2:xsli2eee4:prevd4:lastd2:ysli1ee2:vsl1:Oe2:xsli1eee4:prevd4:prevd4:lastd2:ysli2ee2:vsl1:Oe2:xsli2eee4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Oe2:xsli2eee4:prevd4:lastd2:ysli0ee2:vsl1:Xe2:xsli0eee4:prevd4:lastd2:ysli2ee2:vsl1:Oe2:xsli0eee4:prevd4:lastd2:ysli2ee2:vsl1:Xe2:xsli0eeeeeee4:lastd2:ysli2ee2:vsl1:Xe2:xsli1eeeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eeeeee"

message' :: String
message' = "d4:lastd2:ysli0ee2:vsl1:Xe2:xsli2eee4:prevd4:lastd2:ysli1ee2:vsl1:Oe2:xsli1eee4:prevd4:prevd4:lastd2:ysli2ee2:vsl1:Oe2:xsli2eee4:prevd4:prevd4:lastd2:ysli1ee2:vsl1:Oe2:xsli2eee4:prevd4:lastd2:ysli0ee2:vsl1:Xe2:xsli0eee4:prevd4:lastd2:ysli2ee2:vsl1:Oe2:xsli0eee4:prevd4:lastd2:ysli2ee2:vsl1:Xe2:xsli0eeeeeee4:lastd2:ysli2ee2:vsl1:Xe2:xsli1eeeee4:lastd2:ysli0ee2:vsl1:Xe2:xsli1eeeeee"

type To = [[(Int, Char)]]

expectedParse :: Either String JsonLikeValue
expectedParse = Right $ JLMap [("last", JLMap [("ys", JLArray [JLInt 0]), ("vs", JLArray [JLString "X"]), ("xs", JLArray [JLInt 2])]), ("prev", JLMap [("last", JLMap [("ys", JLArray [JLInt 1]), ("vs", JLArray [JLString "O"]), ("xs", JLArray [JLInt 1])]), ("prev", JLMap [("prev", JLMap [("last", JLMap [("ys", JLArray [JLInt 2]), ("vs", JLArray [JLString "O"]), ("xs", JLArray [JLInt 2])]), ("prev", JLMap [("prev", JLMap [("last", JLMap [("ys", JLArray [JLInt 1]), ("vs", JLArray [JLString "O"]), ("xs", JLArray [JLInt 2])]), ("prev", JLMap [("last", JLMap [("ys", JLArray [JLInt 0]), ("vs", JLArray [JLString "X"]), ("xs", JLArray [JLInt 0])]), ("prev", JLMap [("last", JLMap [("ys", JLArray [JLInt 2]), ("vs", JLArray [JLString "O"]), ("xs", JLArray [JLInt 0])]), ("prev", JLMap [("last", JLMap [("ys", JLArray [JLInt 2]), ("vs", JLArray [JLString "X"]), ("xs", JLArray [JLInt 0])])])])])]), ("last", JLMap [("ys", JLArray [JLInt 2]), ("vs", JLArray [JLString "X"]), ("xs", JLArray [JLInt 1])])])]), ("last", JLMap [("ys", JLArray [JLInt 0]), ("vs", JLArray [JLString "X"]), ("xs", JLArray [JLInt 1])])])])]

expectedConvert :: Either InvalidState To
expectedConvert = Left Duplicates
