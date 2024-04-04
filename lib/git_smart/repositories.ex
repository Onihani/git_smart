defmodule GitSmart.Repositories do
  def list do
    for _ <- 1..10, do: mock()
  end

  defp mock do
    id = :rand.uniform(1000)

    %{
      id: id,
      git_id: id,
      avatar_url: "https://avatars.githubusercontent.com/u/1481354?2=200&v4",
      full_name: "Elixir Language",
      watchers_count: 1_000,
      description: "pumpkin",
      name: "elixir",
      open_issues: 10,
      language: "Elixir"
    }
  end
end
