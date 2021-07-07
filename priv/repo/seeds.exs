# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Project.Repo.insert!(%Project.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Project.{Repo, Word}

Repo.insert! %Word{eng: "cat", rus: "кошка"}
Repo.insert! %Word{eng: "meow", rus: "мяу"}
Repo.insert! %Word{eng: "paw", rus: "лапа"}
Repo.insert! %Word{eng: "tail", rus: "хвост"}
