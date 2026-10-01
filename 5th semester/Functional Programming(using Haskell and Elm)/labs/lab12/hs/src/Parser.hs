module Parser where

import Control.Applicative

data ParseResult a = Success a String | Error String deriving (Show)

data Parser a = Parser {runParser :: String -> ParseResult a}


succeed :: a -> Parser a
succeed a = Parser (\input -> Success a input)



pFail :: String -> Parser a
pFail msg = Parser (\_ -> Error msg)


todo msg = pFail $ "TODO: " ++ msg

parserA :: Parser Char
parserA = Parser inner
  where
    inner "" = Error "End of input"
    inner (first : rest) =
      if first == 'a'
        then Success 'a' rest
        else Error "Expected 'a'"

satisfies :: (Char -> Bool) -> Parser Char
satisfies predicate = Parser inner
  where
    inner "" = Error "End of input"
    inner (first : rest) =
      if predicate first
        then Success first rest
        else Error ("Unexpected character " ++ show first)

lower :: Parser Char
lower = satisfies (\c -> elem c ['a' .. 'z'])

upper :: Parser Char
upper = satisfies (\c -> elem c ['A' .. 'Z'])

char :: Char -> Parser Char
char c = satisfies (== c)

digit :: Parser Char
digit = satisfies (`elem` ['0' .. '9'])

andThen :: Parser a -> Parser b -> Parser (a, b)
andThen pa pb = Parser inner
  where
    inner input =
      case runParser pa input of
        Success a rest ->
          case runParser pb rest of
            Success b remaining -> Success (a, b) remaining
            Error err -> Error err
        Error err -> Error err

string :: String -> Parser String
string "" = Parser (\input -> Success "" input)
string (c : cs) = Parser inner
  where
    inner "" = Error "End of input"
    inner input =
      case runParser (andThen (char c) (string cs)) input of
        Success (p, ps) rest -> Success (p : ps) rest
        Error err -> Error err

orElse :: Parser a -> Parser a -> Parser a
orElse pa pb = Parser inner
  where
    inner input =
      case runParser pa input of
        Success a rest -> Success a rest
        Error _ -> runParser pb input

letter :: Parser Char
letter = lower `orElse` upper

pMap :: (a -> b) -> Parser a -> Parser b
pMap f p = Parser inner
  where
    inner input =
      case runParser p input of
        Success r rest -> Success (f r) rest
        Error err -> Error err

bool :: Parser Bool
bool = pMap read (string "True" `orElse` string "False")

pMany :: Parser a -> Parser [a]
pMany p = Parser inner
  where
    inner "" = Success [] ""
    inner input =
      case runParser p input of
        Success r rest ->
          case runParser (pMany p) rest of
            Success rs remaining -> Success (r : rs) remaining
        Error _ -> Success [] input

pSome :: Parser a -> Parser [a]
pSome p = Parser inner
  where
    inner "" = Error "End of input"
    inner input =
      case runParser p input of
        Success r rest ->
          case runParser (pMany p) rest of
            Success rs remaining -> Success (r : rs) remaining
        Error err -> Error err

number :: Parser Int
number = read <$> some digit

pRepeat :: Int -> Parser a -> Parser [a]
pRepeat 0 _ = succeed []
pRepeat n p = (:) <$> p <*> pRepeat (n - 1) p

ws :: Parser String
ws = many (char ' ' <|> char '\n')

sepBy :: Parser a -> Parser b -> Parser [b]
sepBy sep p = f <$> try p <*> many (sep *> p)
  where
    f Nothing _ = []
    f (Just x) xs = x : xs

sepBy1 :: Parser a -> Parser b -> Parser [b]
sepBy1 sep p = (:) <$> p <*> many (sep *> p)

try :: Parser a -> Parser (Maybe a)
try p = Parser inner
  where
    inner input =
      case runParser p input of
        Success p rest -> Success (Just p) rest
        Error err -> Success Nothing input

data Date = Date {year :: Int, month :: Int, day :: Int} deriving (Show)


instance Functor Parser where
  fmap = pMap


bool' :: Parser Bool
bool' = read <$> (string "True" `orElse` string "False")


instance Applicative Parser where
  pure = succeed
  pf <*> pa = (\(f, a) -> f a) <$> andThen pf pa


between' :: Parser a -> Parser b -> Parser c -> Parser c
between' pHd pTl p = liftA3 (\_ b _ -> b) pHd p pTl

between'' :: Parser a -> Parser b -> Parser c -> Parser c
between'' pHd pTl p = pHd *> (p <* pTl)

andThen' :: Parser a -> Parser b -> Parser (a, b)
andThen' pa pb = liftA2 (,) pa pb


string'' :: String -> Parser String
string'' s = sequenceA (char <$> s)

pRepeat' :: Int -> Parser a -> Parser [a]
pRepeat' n p = sequenceA $ replicate n p


instance Alternative Parser where
  empty = pFail ""
  (<|>) = orElse


instance Monad Parser where
  pa >>= pb = Parser inner
    where
      inner input =
        case runParser pa input of
          Success r rest -> runParser (pb r) rest
          Error err -> Error err

between''' :: Parser a -> Parser b -> Parser c -> Parser c
between''' pHd pTl p = do
  pHd
  r <- p
  pTl
  return r

date' :: Parser Date
date' =
  let sep = char '-'
      nWithDigits :: Int -> Parser Int
      nWithDigits n = read <$> pRepeat n digit
   in Date <$> nWithDigits 4 <*> (sep *> nWithDigits 2) <*> (sep *> nWithDigits 2)

date'' :: Parser Date
date'' =
  let sep = char '-'
      nWithDigits :: Int -> Parser Int
      nWithDigits n = read <$> pRepeat n digit
   in do
        y <- nWithDigits 4
        sep
        m <- nWithDigits 2
        sep
        d <- nWithDigits 2
        return $ Date y m d

token :: Parser a -> Parser a
token = between' ws ws

alphaNum :: Parser Char
alphaNum = lower <|> upper <|> digit

