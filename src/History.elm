module History exposing (Organization)


type alias Month =
    { year : Int
    , month : Int
    }


type alias Product =
    { startedMonth : Month
    , finishedMonth : Maybe Month
    , title : String
    , description : String
    , technology_used : List String
    , members : List String
    }


type alias Organization =
    { name : String
    , startedMonth : Month
    , finishedMonth : Maybe Month
    , products : List Product
    }


type alias History =
    List Organization
