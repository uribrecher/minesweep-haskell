# mineSweep
This is my take on the minesweep code kata in Haskell.
I am using the matrix package here to internally represent the bombs
as a matrix of Chars.

Note: Just like !! operator on lists may throw an exception, the Matrix !
operator may throw an exception as well. I created a safer version that
avoid exceptions with the added overhead of bounds check.
