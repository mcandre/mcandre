import Development.Shake
import Development.Shake.FilePath
import System.Directory as Dir

main :: IO ()
main = do
    let tarball = "dist/magic-0.0.1.tar.gz"
    homeDir <- Dir.getHomeDirectory

    shakeArgs shakeOptions{ shakeFiles="dist" } $ do
        want ["dist/bin/magic" <.> exe]

        "dist/bin/magic" <.> exe %> \out ->
            cmd_ "cabal" "install" "--bindir" "dist/bin"

        phony "hlint" $
            cmd_ "hlint" "."

        phony "lint" $
            need ["hlint"]

        phony "test" $ do
            need ["dist/bin/magic" <.> exe]
            cmd_ $ "dist/bin/magic" <.> exe

        phony "install" $
            cmd_ "cabal" "install"

        phony "uninstall" $
            removeFilesAfter homeDir ["/.cabal/bin/magic" <.> exe]

        phony "build" $
            cmd_ "cabal" "build"

        tarball %> \_ -> do
            need ["build"]
            cmd_ "cabal" "sdist"

        phony "sdist" $
            need [tarball]

        phony "publish" $ do
            need ["sdist"]
            cmd_ "cabal" "upload" tarball

        phony "clean" $
            cmd_ "cabal" "clean"
