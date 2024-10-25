module Backend exposing (..)

import Lamdera exposing (ClientId, SessionId)
import Module
import Types exposing (..)


type alias Model =
    BackendModel


app =
    Lamdera.backend
        { init = init True
        , update = update
        , updateFromFrontend = updateFromFrontend
        , subscriptions = \m -> Sub.none
        }


init : Bool -> ( Model, Cmd BackendMsg )
init firstCall =
    if firstCall then
        init False

    else
        ( { message = Module.dummyConfigItem }
        , Cmd.none
        )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    case msg of
        NoOpBackendMsg ->
            ( model, Cmd.none )


updateFromFrontend : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend sessionId clientId msg model =
    case msg of
        NoOpToBackend ->
            ( model, Cmd.none )
