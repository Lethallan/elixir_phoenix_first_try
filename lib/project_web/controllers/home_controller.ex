defmodule ProjectWeb.HomeController do
  use ProjectWeb, :controller

  alias Project.{Repo, Word, ChuckNorris}
  # alias Project.{Email, Mailer}

  def index(conn, _params) do
    joke = ChuckNorris.get_joke()

    # Email.welcome_email |> Mailer.deliver_now

    words = Repo.all(Word)
    render conn, "index.html", words: words, joke: joke
  end

  def show(conn, %{"id" => id}) do
    word = Repo.get(Word, id)
    render conn, "show.html", word: word
  end
end
