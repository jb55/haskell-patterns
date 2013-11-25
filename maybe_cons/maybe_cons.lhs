Maybe Cons
==========

Build a list from Maybe-typed elements

> import Control.Monad (guard, MonadPlus)
> 
> infixr 5 ?:
> (?:) :: Maybe a -> [a] -> [a]
> Just x  ?: xs = x : xs
> Nothing ?: xs = xs
> 
> onlyAllow :: (a -> Bool) -> a -> Maybe a
> onlyAllow fn a = guard (fn a) >> return a
> 
> valid :: [a] -> Maybe [a]
> valid = onlyAllow (not . null)
> 
> elements :: [String]
> elements = Just "something" ?:
>            Nothing          ?:
>            valid ""         ?:
>            valid "str"      ?: []
> 
> -- elements == ["something", "str"]
> 
> main = mapM_ putStrLn elements

