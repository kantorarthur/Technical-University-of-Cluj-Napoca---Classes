module Simple where

data ParseResult a = Success a String | Error String deriving (Show)

data Parser a = Parser {runParser :: String -> ParseResult a}

succeed :: a -> Parser a
succeed a = Parser (\input -> Success a input)

pFail :: String -> Parser a
pFail msg = Parser (\_ -> Error msg)

todo = pFail "TODO"


parserA :: Parser Char
parserA = Parser inner where
  inner "" = Error "End of input"
  inner (first:rest) = 
    if first == 'a' then
      Success 'a' rest
    else
      Error "Expected 'a'"



satisfies :: (Char -> Bool) -> Parser Char
satisfies predicate = Parser inner where
  inner "" = Error "End of input"
  inner (first:rest) = 
    if predicate first then
      Success first rest
    else
      Error ("Unexpected character " ++ show first)



lower :: Parser Char
lower = satisfies (\c -> elem c ['a'..'z'])



upper :: Parser Char
upper = satisfies (\c -> elem c ['A'..'Z'])



char :: Char -> Parser Char
char _ = todo



digit :: Parser Char
digit = todo



andThen :: Parser a -> Parser b -> Parser (a, b)
andThen pa pb = Parser inner where
  inner input = 
    case runParser pa input of
      Success a rest -> 
        case runParser pb rest of
          Success b remaining -> Success (a,b) remaining
          Error err -> Error err
      Error err -> Error err



string :: String -> Parser String
string "" = Parser (\input -> Success "" input)
string (c:cs) = Parser inner where
  inner "" = Error "End of input"
  inner input =
    case runParser (andThen (char c) (string cs) ) input of
      Success (p, ps) rest -> Success (p:ps) rest
      Error err -> Error err



orElse :: Parser a -> Parser a -> Parser a
orElse pa pb = Parser inner where
  inner input = 
    case runParser pa input of
      Success a rest -> Success a rest 
      Error _ -> runParser pb input



letter :: Parser Char
letter = lower `orElse` upper



pMap :: (a -> b) -> Parser a -> Parser b
pMap f p = Parser inner where
  inner input = 
    case runParser p input of
      Success r rest -> Success (f r) rest
      Error err -> Error err



bool :: Parser Bool
bool = pMap read (string "True" `orElse` string "False")


string' :: String -> Parser String
string' _ = todo


many :: Parser a -> Parser [a]
many p = Parser inner where
  inner "" = Success [] ""
  inner input =
    case runParser p input of
      Success r rest -> 
        case runParser (many p) rest of
          Success rs remaining -> Success (r:rs) remaining
      Error _ -> Success [] input



some :: Parser a -> Parser [a]
some p = Parser inner where
  inner "" = Error "End of input"
  inner input =
    case runParser p input of
      Success r rest ->
        case runParser (many p) rest of
          Success rs remaining -> Success (r:rs) remaining
      Error err -> Error err


number :: Parser Int
number = todo

-- Exercises

pRepeat :: Int -> Parser a -> Parser [a]
pRepeat _ _ = todo

pThen :: Parser a -> Parser b -> Parser b
pThen _ _ = todo

ws :: Parser String
ws = todo

between :: Parser a -> Parser b -> Parser c -> Parser c
between _ _ _ = todo

sepBy :: Parser a -> Parser b -> Parser [b]
sepBy _ _ = todo

sepBy1 :: Parser a -> Parser b -> Parser [b]
sepBy1 _ _ = todo

try :: Parser a -> Parser (Maybe a)
try _ = todo

data Date = Date {year :: Int, month :: Int, day :: Int} deriving (Show)

date :: Parser Date
date = todo
