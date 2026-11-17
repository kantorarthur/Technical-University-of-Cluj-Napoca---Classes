module Ex8127 where

fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)

breakToLines :: Int -> String -> [String]
breakToLines _ [] = []
breakToLines lineLen str = take lineLen str : breakToLines lineLen (drop lineLen str)

formatLines :: [String] -> String
formatLines [] = ""
formatLines [x] = x
formatLines (x : xs) = x ++ "\n" ++ formatLines xs

main :: IO ()
main = putStrLn (formatLines (breakToLines 80 (show (fact 1000))))
