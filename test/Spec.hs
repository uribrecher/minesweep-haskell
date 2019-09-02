import           Test.Hspec
import           Test.QuickCheck
import qualified MineSweep


problem1 = MineSweep.create
  ["XOO"
  ,"OOO"
  ,"XXO"]

solution1 = MineSweep.create
  ["X10"
  ,"331"
  ,"XX1"]

problem2 = MineSweep.create
  ["XOOO"
  ,"OOOO"
  ,"OXOO"
  ,"OOOO"]

solution2 = MineSweep.create
  ["X100"
  ,"2210"
  ,"1X10"
  ,"1110"]

problem3 = MineSweep.create
  ["XXOOO"
  ,"OOOOO"
  ,"OXOOO"]

solution3 = MineSweep.create
  ["XX100"
  ,"33200"
  ,"1X100"]


main = hspec $ describe "tests:" $ do
  it "sweep1" $ MineSweep.solution problem1 `shouldBe` solution1

  it "sweep2" $ MineSweep.solution problem2 `shouldBe` solution2

  it "sweep3" $ MineSweep.solution problem3 `shouldBe` solution3
