module Contents exposing (Contents, init)

import History exposing (History)
import Work exposing (Work)


type alias Contents =
    { history : History
    , works : List Work
    }


init : Contents
init =
    { history = [], works = [] }
