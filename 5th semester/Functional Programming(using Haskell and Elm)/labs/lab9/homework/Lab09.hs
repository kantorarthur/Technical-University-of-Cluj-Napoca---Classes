import Data.List (sortOn)
import Data.Monoid
import Data.Char (isUpper)

newtype Rev a = Rev a deriving (Eq, Show)

instance Ord a => Ord (Rev a) where
  compare (Rev a) (Rev b) = compare b a

sortRev :: Ord a => [a] -> [a]
sortRev = sortOn Rev

allUpper :: String -> Bool
allUpper = getAll . foldMap (All . isUpper)

class Graph g where
  neighbors :: Eq a => g a -> a -> [a]

newtype TupleGraph a = TupleGraph [(a, a)]

newtype NeighborListGraph a = NeighborListGraph [(a, [a])]

instance Graph TupleGraph where
  neighbors (TupleGraph edges) node = [y | (x, y) <- edges, x == node]

instance Graph NeighborListGraph where
  neighbors (NeighborListGraph list) node = concat [ns | (x, ns) <- list, x == node]

bf :: (Graph g, Eq a) => g a -> a -> [a]
bf g start = bfHelper [start] g []

bfHelper :: (Graph g, Eq a) => [a] -> g a -> [a] -> [a]
bfHelper [] _ visited = visited
bfHelper (x:queue) g visited
  | x `elem` visited = bfHelper queue g visited
  | otherwise = bfHelper (queue ++ neighbors g x) g (visited ++ [x])

df :: (Graph g, Eq a) => g a -> a -> [a]
df g start = dfHelper [start] g []

dfHelper :: (Graph g, Eq a) => [a] -> g a -> [a] -> [a]
dfHelper [] _ visited = visited
dfHelper (x:stack) g visited
  | x `elem` visited = dfHelper stack g visited
  | otherwise = dfHelper (neighbors g x ++ stack) g (visited ++ [x])
