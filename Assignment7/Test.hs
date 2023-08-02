
import Generator (sentence)

main = do 
  testGenerator 10

testGenerator :: Int -> IO ()
testGenerator iterations = do
  if iterations == 0 then
    return ()
  else do
    s <- sentence
    putStrLn s
    testGenerator (iterations - 1)


