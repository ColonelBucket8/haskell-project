module LearnYouAHaskell.AFistfulOfMonads.MonadLaws where

-- Left Identity
-- return x >>= f is the same thing as f x
-- return 3 >>= (\x -> Just (x+1))
-- (\x -> Just (x+1)) 3

-- Right Identity
-- m >>= return is no different than just m
-- [1,2,3,4] >>= (\x -> return x)
-- Implementation of list
-- xs >>= f = concat (map f xs) 
 
-- Associativity
-- Doing (m >>= f) >>= g is just like doing m >>= (\x -> f x >>= g)
(.) :: (b -> c) -> (a -> b) -> (a -> c)
f . g = (\x -> f (g x))

(<=<) :: (Monad m) => (b -> m c) -> (a -> m b) -> (a -> m c)
f <=< g = (\x -> g x >>= f)

main = do
    let f x = [x,-x]
    let g x = [x*3,x*2]
    let h = f <=< g
    h 3
