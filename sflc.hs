-- Main
import Text.Parsec.Error
import MyParser
import MyTypecheck
import MyDataTypes
import MyInterpreter
import System.Environment (getArgs)

main::IO()
main = do
  s <- (head <$> getArgs) >>= readFile
  let res_p = parseStr s in
    case res_p of
     Left err -> putStrLn $ show err
     _ -> let res_t = tycheck res_p in
          case res_t of
            BOTTOM err -> putStrLn err
            _ -> let res_e = eval res_p in putStrLn $ show res_e
