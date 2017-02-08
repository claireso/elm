import Html exposing (Html, div, h1, ul, li, text, br, button)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Article = {title: String, content: String, isOpen: Bool}
type alias Model = List Article

model : Model
model =
  [ {title = "My first article", content = "My first content", isOpen = False}
  , {title = "My second article", content = "My second content", isOpen = False}
  , {title = "My third article", content = "My third content", isOpen = False}
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

renderArticle: Article -> Html Msg
renderArticle article =
  li [] [
    text article.title
    , br [] []
    , if article.isOpen then text article.content else text "" --TODO
    , renderArticleButton article.isOpen
    ]

renderArticleButton: Bool -> Html Msg
renderArticleButton isOpen =
  if isOpen
    then
      button [ onClick Close ] [ text "Close" ]
    else
      button [ onClick Open ] [ text "Open" ]
