defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _, socket) do
    language = params["language"] || "elixir"
    page = params["page"] || 1
    repositories = Repositories.list(language, page)

    case repositories do
      {:error, message} ->
        {:noreply, socket |> put_flash(:error, message) |> assign(:repositories, [])}

      repositories ->
        {:noreply, assign(socket, :repositories, repositories)}
    end
  end
end
