
Maybe Cons
==========

Build a list from Maybe-typed elements

\begin{code}
import Control.Monad (guard, MonadPlus)

infixr 5 ?:
(?:) :: Maybe a -> [a] -> [a]
Just x  ?: xs = x : xs
Nothing ?: xs = xs

onlyAllow :: MonadPlus m => (a -> Bool) -> a -> m a
onlyAllow fn a = guard (fn a) >> return a

valid = onlyAllow (not . null)

str = ""

elements :: [String]
elements = Just "something" ?:
           Nothing          ?:
           valid ""         ?:
           valid "str"      ?: []

-- elements == ["something", "str"]

main = mapM_ putStrLn elements
\end{code}
