module Main exposing (..)

import Browser
import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Vector =
    ( Int, Int )


type alias Model =
    { mapSize : Vector
    , cellSize : Vector
    }


init : Model
init =
    { mapSize = ( 400, 400 )
    , cellSize = ( 40, 40 )
    }


type Msg
    = Msg1
    | Msg2


update : Msg -> Model -> Model
update msg model =
    case msg of
        Msg1 ->
            model

        Msg2 ->
            model



-- <svg viewBox="0 0 230 100" xmlns="http://www.w3.org/2000/svg">
--   <defs>
--     <pattern id="star" viewBox="0,0,10,10" width="10%" height="10%">
--       <polygon points="0,0 2,5 0,10 5,8 10,10 8,5 10,0 5,2"/>
--     </pattern>
--   </defs>
--   <circle cx="50"  cy="50" r="50" fill="url(#star)"/>
--   <circle cx="180" cy="50" r="40" fill="none" stroke-width="20" stroke="url(#star)"/>
-- </svg>


view : Model -> Html Msg
view model =
    svg
        [ version "1.1"
        , Svg.Attributes.width (String.fromInt <| Tuple.first model.mapSize)
        , Svg.Attributes.height (String.fromInt <| Tuple.second model.mapSize)
        , Svg.Attributes.preserveAspectRatio "xMidYMid meet"
        , viewBox <|
            "0 0 "
                ++ (String.fromInt <| Tuple.first <| model.mapSize)
                ++ " "
                ++ (String.fromInt <| Tuple.second <| model.mapSize)
        ]
        [ defs []
            [ pattern
                [ Svg.Attributes.id "cell"
                , Svg.Attributes.fill "None"
                , Svg.Attributes.stroke "#000000"
                , Svg.Attributes.strokeWidth "0.3"
                , viewBox <|
                    "0 0 "
                        ++ (String.fromInt <| Tuple.first <| model.cellSize)
                        ++ " "
                        ++ (String.fromInt <| Tuple.second <| model.cellSize)
                , Svg.Attributes.width "10%"
                , Svg.Attributes.height "10%"
                ]
                [ polygon [ Svg.Attributes.points "0,0 40,0 40,40 0,40" ] []
                ]
            ]
        , rect
            [ Svg.Attributes.width (String.fromInt <| Tuple.first model.mapSize)
            , Svg.Attributes.height (String.fromInt <| Tuple.second model.mapSize)
            , Svg.Attributes.fill "url(#cell)"
            ]
            []
        ]
