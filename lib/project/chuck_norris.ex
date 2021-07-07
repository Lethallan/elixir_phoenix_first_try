defmodule Project.ChuckNorris do
  def get_joke() do
    result = "https://api.icndb.com/jokes/random" |> HTTPoison.get |> parse_response()

    case result do
      {:ok, joke} -> joke
      :error -> "Chuck Norris has broken everything completely."
    end
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> Jason.decode! |> pull_joke()
  end
  defp parse_response(_), do: :error

  defp pull_joke(%{"value" => %{"joke" => joke}}), do: {:ok, joke}
  defp pull_joke(_), do: :error
end
