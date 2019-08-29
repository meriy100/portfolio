module Session exposing (Session, toNavKey)

import Browser.Navigation as Nav exposing (Key)


type alias Session =
    { key : Nav.Key
    }


toNavKey : Session -> Nav.Key
toNavKey session =
    session.key
