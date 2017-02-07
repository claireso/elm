import Html exposing (Html, div, h1, ul, li, text)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = List String

model : Model
model =
  [ "My first article"
  , "My second article"
  , "My third article"
  ]

-- Update
type Msg = Open | Close

update : Msg -> Model -> Model
update msg model =
  case msg of
    Open ->
      []
    Close ->
      []

-- View
view : Model -> Html Msg
view model =
  div [] [
    h1 [] [
      text "List of my articles"
      , text (" (" ++ (toString (List.length model)) ++ ")")
    ]
    , renderArticles model
  ]

renderArticles: Model -> Html Msg
renderArticles model =
  let
    articles = List.map renderArticle model
  in
    ul [] articles

renderArticle: String -> Html Msg
renderArticle article =
  li [] [ text article ]
