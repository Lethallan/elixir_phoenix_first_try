defmodule ProjectWeb.HomeController do
  use ProjectWeb, :controller

alias Project.{Repo, Word}

  def index(conn, _params) do
    words = Repo.all(Word)
    render conn, "index.html", words: words
  end

  def show(conn, %{"id" => id}) do
    word = Repo.get(Word, id)
    render conn, "show.html", word: word
  end
end
