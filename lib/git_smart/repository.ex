defmodule GitSmart.Repositories.Repository do
  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w/avatar_url description forks git_id language full_name open_issues html_url watchers_count/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "repositories" do
    field :description, :string
    field :language, :string
    field :avatar_url, :string
    field :forks, :integer
    field :git_id, :integer
    field :full_name, :string
    field :open_issues, :integer
    field :html_url, :string
    field :watchers_count, :integer

    timestamps(type: :utc_datetime)
  end

  def changeset(attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  @doc false
  def changeset(repository, attrs) do
    repository
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:git_id)
  end
end
