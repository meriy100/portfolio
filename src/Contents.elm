module Contents exposing (Contents, init)

import History exposing (History)


type alias Contents =
    { history : History
    }


init : Contents
init =
    { history = [] }
