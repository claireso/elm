import Html exposing (Html, div, h1, ul, li, text, br, button)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Article = {id: Int, title: String, content: String, isOpen: Bool}
type alias Model = List Article

model : Model
model =
  [ {id = 1 ,title = "My first article", content = "My first content", isOpen = False}
  , {id = 2 ,title = "My second article", content = "My second content", isOpen = False}
  , {id = 3 ,title = "My third article", content = "My third content", isOpen = False}
  ]

-- Update
type Msg = Toggle Int Bool

update : Msg -> Model -> Model
update msg model =
  case msg of
    Toggle id isOpen ->
      let
        updateArticle t =
          if t.id == id then
            { t | isOpen = isOpen }
          else
            t
      in
        List.map updateArticle model

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
    , div [] [ renderArticleButton article ]
    ]

renderArticleButton: Article -> Html Msg
renderArticleButton article =
  if article.isOpen
    then
      button [ onClick (Toggle article.id False) ] [ text "Close" ]
    else
      button [ onClick (Toggle article.id True) ] [ text "Open" ]
