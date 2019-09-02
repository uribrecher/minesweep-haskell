module MineSweep (
  create
 ,solution
) where

import qualified Data.Matrix as Mat
import           Data.Char
import           Data.Maybe

create :: [String] -> Mat.Matrix Char
create = Mat.fromLists

neighbourOffsets =
  [( 1,  0)
  ,( 1,  1)
  ,( 0,  1)
  ,(-1,  1)
  ,(-1,  0)
  ,(-1, -1)
  ,( 0, -1)
  ,( 1, -1)
  ]

sumPair :: (Num a) => (a,a) -> (a,a) -> (a,a)
sumPair (x1,y1) (x2,y2) = (x1 + x2, y1 + y2)


inBounds :: Mat.Matrix Char -> (Int, Int) -> Bool
inBounds mat (x,y) =
  x > 0 
  && y > 0
  && y <= Mat.ncols mat
  && x <= Mat.nrows mat


{-- call an unsafe function (a function that might throw exception)
    only after running a predicate. If the predicate return false
    we skip the unsafe function and return Nothing. The job of the
    predicate is to ensure that the inputs to the unsafe function
    are safe inputs (inputs that yield a result rather than throw exception)
--}
maybefy :: (a -> Bool) -> (a -> b) -> (a -> Maybe b)
maybefy pred unsafe val =
  if pred val
    then Just (unsafe val)
    else Nothing


safeMatrixAt :: Mat.Matrix Char -> (Int, Int) -> Maybe Char
safeMatrixAt mat = maybefy (inBounds mat) (mat Mat.!)


isBomb :: Char -> Bool
isBomb = (== 'X')


bombCount :: Mat.Matrix Char -> (Int, Int) -> Char -> Char
bombCount matrix pos val =
  if isBomb val
    then 'X'
    else chr(48 + countBombsInOffsets neighbourOffsets)
  where
    isBombInOffset = maybe False isBomb . safeMatrixAt matrix . sumPair pos
    countBombsInOffsets = length . filter isBombInOffset


solution ::Mat.Matrix Char -> Mat.Matrix Char
solution matrix = Mat.mapPos (bombCount matrix) matrix
