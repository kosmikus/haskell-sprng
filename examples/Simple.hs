{-# LANGUAGE ScopedTypeVariables #-}

-- compile with: ghc --make Foo.hs -pgml g++

module Main where

import Sprng

main = do
   gen1 :: RNG LFG <- newRng
   initRng gen1 0 1 985456376 0
   [gen2, gen3, gen4] <- spawnRng gen1 3
   printRandInts gen1 10
   printRandDoubles gen1 10
   printRandInts gen2 10
   printRandDoubles gen2 10
   printRandInts gen3 10
   printRandDoubles gen3 10
   printRandInts gen4 10
   printRandDoubles gen4 10

printRandInts :: SprngGen a => RNG a -> Int -> IO ()
printRandInts rng num = do
   printRng rng
   is <- sequence $ replicate num $ randomInt rng
   mapM_ print is

printRandDoubles :: SprngGen a => RNG a -> Int -> IO ()
printRandDoubles rng num = do
   printRng rng
   ds <- sequence $ replicate num $ randomDouble rng
   mapM_ print ds
