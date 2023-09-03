module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes
import Html.Events


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    { text : String }


type Msg
    = SetText String


init : () -> ( Model, Cmd Msg )
init () =
    ( { text = "ELM: Now go read\nthat link!" }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetText text ->
            ( { model | text = text }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.div
            [ Html.Attributes.id "preview" ]
            [ Html.img [ Html.Attributes.src "assets/background.png" ] []
            , Html.div [ Html.Attributes.id "text" ] [ Html.text model.text ]
            ]
        , Html.textarea
            [ Html.Events.onInput SetText ]
            [ Html.text model.text ]
        , Html.p []
            [ Html.txt "To save, open devtools, find the "
            , Html.code [] [ Html.text "<div id=\"preview\">" ]
            , Html.text " element, right click it and press 'Capture Screenshot' (Safari) or 'Capture node screenshot' (Chrome)."
            ]
        ]
