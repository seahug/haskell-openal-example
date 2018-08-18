-- From https://bluishcoder.co.nz/articles/haskell/openal.html

import Control.Monad
import Sound.ALUT

playSound :: IO ()
playSound =
  withProgNameAndArgs runALUTUsingCurrentContext $ \_ _ ->
  do
    (Just device) <- openDevice Nothing
    (Just context) <- createContext device []
    currentContext $= Just context
    buffer1 <- createBuffer $ Sine 880 0 1
    buffer2 <- createBuffer $ Square 440 0 1
    [source] <- genObjectNames 1
    queueBuffers source (take 10 $ cycle [buffer1, buffer2])
    play [source]
    sleep 60
    closeDevice device
    return ()

main = playSound
