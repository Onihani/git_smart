defmodule GitSmart.RepositoriesTest do
  use GitSmart.DataCase
  alias GitSmart.Repositories

  @payload %{
    avatar_url: "https://avatars.githubusercontent.com/u/68310464?v=4",
    description: "Open-source live customer chat",
    forks: 480,
    full_name: "papercups-io/papercups",
    git_id: 279_895_213,
    id: 279_895_213,
    language: "Elixir",
    name: 5_580,
    open_issues: 167,
    html_url: "https://api.github.com/repos/papercups-io/papercups",
    watchers_count: 5_580
  }

  describe "create/1" do
    test "given a payload, then create a repository" do
      repository = Repositories.create(@payload)

      assert repository.avatar_url == @payload[:avatar_url]
      assert repository.description == @payload[:description]
      assert repository.forks == @payload[:forks]
      assert repository.full_name == @payload[:full_name]
      assert repository.git_id == @payload[:git_id]
      assert repository.language == @payload[:language]
      assert repository.open_issues == @payload[:open_issues]
      assert repository.html_url == @payload[:html_url]
      assert repository.watchers_count == @payload[:watchers_count]
    end
  end
end
