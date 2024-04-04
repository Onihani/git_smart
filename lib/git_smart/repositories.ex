defmodule GitSmart.Repositories do
  alias __MODULE__.GithubApi
  alias __MODULE__.Repository
  alias GitSmart.Repo

  def list(language, page) do
    GithubApi.search_repository_by_language(language, page)
  end

  def create(attrs) do
    attrs
    |> Repository.changeset()
    |> Repo.insert!()
  end
end
