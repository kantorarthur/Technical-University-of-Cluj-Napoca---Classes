module Html where

import Control.Applicative
import Parser


data Html = Text String | Node String [(String, String)] [Html] deriving (Show)


-- | Parses HTML text, consuming input as long as it doesn't contain the characters < or >
--
-- >>> runParser text "some text"
-- Success (Text "some text") ""
--
-- >>> runParser text "!@#$%^&&*()"
-- Success (Text "!@#$%^&&*()") ""
--
-- >>> runParser text "some text<"
-- Success (Text "some text") "<"
--
-- >>> runParser text "<some text>"
-- Error "Unexpected character '<'"
text :: Parser Html
text = todo "text"

-- | Parses an identifier which starts with a letter, followed by zero or more alphanumeric characters.
--
-- >>> runParser ident "h1"
-- Success "h1" ""
--
-- >>> runParser ident "11"
-- Error "Unexpected character '1'"
--
-- >>> runParser ident "div"
-- Success "div" ""
--
-- >>> runParser ident "<div>"
-- Error "Unexpected character '<'"
ident :: Parser String
ident = todo "ident"

-- | Parses a self closing tag
--
-- A self closing tag is an identifier followed by a possibly empty list of attributes (see @attributes@) between < and />
--
-- Some useful functions:
-- - @Parser.ident@
-- - @Parser.between@
-- - @Parser.tag@
-- - @Parser.char@
--
-- >>> runParser selfClosing "<a/>"
-- Success ("a",[]) ""
--
-- >>> runParser selfClosing "<a>"
-- Error "Unexpected character '>'"
--
-- >>> runParser selfClosing "<a x=\"y\"/>"
-- Success ("a",[("x","y")]) ""
selfClosing :: Parser (String, [(String, String)])
selfClosing = todo "selfClosing"

-- | Parses an opening tag
--
-- A tag is an identifier followed by a possibly empty list of attributes (see @attributes@) between < and >
--
-- Note: There might be whitespace between the identifier and >
--
-- Some useful functions:
-- - @Parser.between@
-- - @Parser.token@
-- - @Parser.char@
--
-- >>> runParser openTag "<a>"
-- Success ("a",[]) ""
--
-- >>> runParser openTag "<a >"
-- Success ("a",[]) ""
openTag :: Parser (String, [(String, String)])
openTag = todo "openTag"

-- | Parses a possibly empty list of attributes
--
-- An attribute is a key, optionally followed by = and a value between double quotes or single quotes.
-- The attributes are separated by whitespace.
--
-- Some useful functions:
-- - @Parser.sepBy@
-- - @Parser.between@
-- - @Parser.orElse@
--
-- >>> runParser attributes "a=\"b\""
-- Success [("a","b")] ""
--
-- >>> runParser attributes "a='b'"
-- Success [] "a='b'"
--
-- >>> runParser attributes "a=\"\""
-- Success [("a","")] ""
attributes :: Parser [(String, String)]
attributes = todo "attributes"

-- | Parses the given closing tag
--
-- A closing tag is an identifier between </ and >
--
-- Note: There might be whitespace between the identifier and >
--
-- Some useful functions:
-- - @Parser.token@
--
-- >>> runParser (closeTag "a") "</a>"
-- Success () ""
--
-- >>> runParser (closeTag "a") "</a  >"
-- Success () ""
--
-- >>> runParser (closeTag "a") "</div>"
-- Error "Unexpected character 'd'"
closeTag :: String -> Parser ()
closeTag tag = todo "closeTag"

-- | Run a parser between HTML tags, checking that the opening and closing tag match.
--
-- Some useful functions:
-- - @openTag@
-- - @closingTag@
-- - @Parser.pWith@
-- 
-- >>> runParser (betweenHtmlTags (char 'x')) "<a>x</a>"
-- Success ('x',"a",[]) ""
--
-- >>> runParser (betweenHtmlTags (char 'x')) "<a>x</b>"
-- Error "Unexpected character 'b'"
--
-- >>> runParser (betweenHtmlTags (char 'x')) "<a y=\"z\">x</a>"
-- Success ('x',"a",[("y","z")]) ""
betweenHtmlTags :: Parser a -> Parser (a, String, [(String, String)])
betweenHtmlTags _ = todo "betweenHtmlTags"

-- | Parses a HTML node
--
-- A HTML node is one of:
-- - a self closing tag
-- - an opening and closing tag, with more HTML between them
--
-- Some useful functions:
-- - @Parser.pMap@
-- - @Parser.orElse@
-- - @html@
-- - @betweenHtmlTags@
-- - @selfClosing@
--
-- >>> runParser htmlNode "<a/>"
-- Success (Node "a" [] []) ""
--
-- >>> runParser htmlNode "<a>b</a>"
-- Success (Node "a" [] [Text "b"]) ""
--
-- >>> runParser htmlNode "<a><b>text</b></a>"
-- Success (Node "a" [] [Node "b" [] [Text "text"]]) ""
htmlNode :: Parser Html
htmlNode = todo "htmlNode"

-- | Parses a HTML node or a text node
--
-- Some useful functions:
-- - @Parser.pMap@
-- - @Parser.orElse@
-- - @htmlNode@
-- - @text@
--
-- >>> runParser html "<a y=\"z\"><b>x</b></a>"
-- Success (Node "a" [("y","z")] [Node "b" [] [Text "x"]]) ""
--
-- >>> runParser html "<a y=\"z\"><b>x <z></z></b></a>"
-- Success (Node "a" [("y","z")] [Node "b" [] [Text "x ",Node "z" [] []]]) ""
html :: Parser Html
html = todo "html"
