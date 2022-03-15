import Data.List
import System.Process
import Data.Maybe

data Meeting = Meeting { meetingName :: String
                       , meetingUrl :: String
                       } deriving (Show)

data Subject = Subject { subjectName :: String
                       , meetings :: [(String, String)]
                       } deriving (Show)

subjects = [ Subject "Big data scientist & engineer" [
                                                     ]
           , Subject "Business studio" $ [ ("All classes", "https://teams.microsoft.com/dl/launcher/launcher.html?url=%2F_%23%2Fl%2Fmeetup-join%2F19%3Ameeting_NTg5NGUxYmMtYTc0Mi00M2NkLTlhN2EtZTg0ZGI5MzhlZTI4%40thread.v2%2F0%3Fcontext%3D%257b%2522Tid%2522%253a%25220907bb1e-21fc-476f-8843-02d09ceb59a7%2522%252c%2522Oid%2522%253a%252250543c97-bde0-499d-944d-4e5d02607649%2522%257d%26anon%3Dtrue&type=meetup-join&deeplinkId=b5bfee75-a933-45c4-8433-9736bb282ed0")
                                         , ("bds1", "https://dlo.mijnhva.nl/d2l/le/content/355137/viewContent/1114337/View")
                                         , ("bds2", "https://dlo.mijnhva.nl/d2l/le/content/355137/viewContent/1114338/View")
                                         , ("bds3", "https://dlo.mijnhva.nl/d2l/le/content/355137/viewContent/1114339/View")
                                         , ("bds4", "https://dlo.mijnhva.nl/d2l/le/content/355137/viewContent/1114340/View")
                                         ]
           ]

dropLast :: Int -> [a] -> [a]
dropLast n xs
  | length xs < n = error "dropped too many"
  | otherwise     = take (length xs - n) xs


main = do
  let currentMeetings = meetings $ subjects !! 1
      klasnamen = map fst $ currentMeetings
  meetingName' <- readProcess "rofi" ["-dmenu"] $ unlines klasnamen
  let meetingName = dropLast 1 meetingName'
  print meetingName
  case lookup meetingName currentMeetings of
    Nothing -> return ()
    Just url -> callCommand $ "$BROWSER " ++ url
