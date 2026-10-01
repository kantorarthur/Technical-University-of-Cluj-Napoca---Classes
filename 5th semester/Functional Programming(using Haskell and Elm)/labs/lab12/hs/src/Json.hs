module Json where

import Control.Applicative
import Parser (Parser, between', char, number, runParser, satisfies, sepBy, string, token, ws, alphaNum, bool)


data Json
  = JNull
  | JBool Bool
  | JInt Int
  | JString String
  | JList [Json]
  | JDict [(String, Json)]
  deriving (Show)



jNull :: Parser Json
jNull = (const JNull) <$> string "null"



jBool :: Parser Json
jBool = 
  ((const $ JBool True) <$> string "true")
  <|> ((const $ JBool False) <$> string "false")



jInt :: Parser Json
jInt = JInt <$> number



jString :: Parser Json
jString = JString <$> between' (char '"') (char '"') (many alphaNum)



jList :: Parser Json
jList = JList <$> between' (char '[') (char ']') (sepBy (char ',') json)



jDict :: Parser Json
jDict = JDict <$> between' (char '{') (char '}') (sepBy (char ',') kv)
  where
    kv = (,) <$> k <*> ((char ':') *> v)
    k = between' (char '"') (char '"') (many $ satisfies (/= '"'))
    v = json



json :: Parser Json
json = jNull <|> jBool <|> jInt <|> jString <|> jList <|> jDict


jList' :: Parser Json
jList' = JList <$> between' lBracket rBracket (sepBy comma json)
  where
    lBracket = token $ char '['
    rBracket = token $ char ']'
    comma = token $ char ','

jDict' :: Parser Json
jDict' = JDict <$> between' lBrace rBrace (sepBy comma kv)
  where
    lBrace = token $ char '{'
    rBrace = token $ char '}'
    comma = token $ char ','
    kv = (,) <$> k <*> ((token $ char ':') *> v)
    k = between' (char '"') (char '"') (many $ satisfies (/= '"'))
    v = json

json' :: Parser Json
json' = jNull <|> jBool <|> jInt <|> jString <|> jList' <|> jDict'

-- >>> runParser jNull "null"
-- Success JNull ""

-- >>> runParser jBool "true"
-- Success (JBool True) ""

-- >>> runParser jInt "12"
-- Success (JInt 12) ""

-- >>> runParser jString "\"abc\""
-- Success (JString "abc") ""

-- >>> runParser jList "[]"
-- Success (JList []) ""

-- >>> runParser jList "[1,2]"
-- Success (JList [JInt 1,JInt 2]) ""

-- >>> runParser jDict "{}"
-- Success (JDict []) ""

-- >>> runParser jDict "{\"a\":[]}"
-- Success (JDict [("a",JList [])]) ""

-- >>> runParser jDict "{\"a\":1,\"b\":2}"
-- Success (JDict [("a",JInt 1),("b",JInt 2)]) ""

-- >>> runParser jList "[1, 2]"
-- Error "Unexpected character ','"

-- >>> runParser jDict "{\"a\": []}"
-- Error "Unexpected character '\"'"

-- >>> runParser jDict "{\"a\":[ ]}"
-- Error "Unexpected character '\"'"

-- >>> runParser json "\"asd\""
-- Success (JString "asd") ""

-- >>> runParser (ws `andThen` ws) "  "
-- Success ("  ","") ""

-- >>> runParser jList' "[1, 2]"
-- Success (JList [JInt 1,JInt 2]) ""

-- >>> runParser jDict' "{  }"
-- Success (JDict []) ""

-- >>> runParser jDict' "{\"a\": []}"
-- Success (JDict [("a",JList [])]) ""

-- >>> runParser jDict' "{\"a\": 1,\n\"b\": 2}"
-- Success (JDict [("a",JInt 1),("b",JInt 2)]) ""

-- >>> runParser jDict' "{\"a\": 1,\n\"b\": 2}"
-- Success (JDict [("a",JInt 1),("b",JInt 2)]) ""
