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

  def new(conn, _params) do
    changeset = Word.changeset(%Word{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"word" => word} = params) do
    changeset = Word.changeset(%Word{}, word)
    case Repo.insert(changeset) do
      {:ok, word} ->
        conn
        |> put_flash(:info, "created")
        |> redirect(to: Routes.home_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    Repo.get(Word, id) |> Repo.delete

    conn
    |> put_flash(:info, "deleted")
    |> redirect(to: Routes.home_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    word = Repo.get(Word, id)
    changeset = Word.changeset(word)
    render conn, "edit.html", word: word, changeset: changeset
  end

  def update(conn, %{"id" => id, "word" => word}) do
    old_word = Repo.get(Word, id)
    changeset = Word.changeset(old_word, word)

    case Repo.update(changeset) do
      {:ok, word} ->
        conn
        |> put_flash(:info, "updated")
        |> redirect(to: Routes.home_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, word: old_word
    end
  end
end
