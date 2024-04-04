defmodule GitSmartWeb.PageLive.Repo do
  use GitSmartWeb, :live_component

  def update(assigns, socket) do
    socket = socket |> assign(assigns) |> assign(is_added: false)

    {:ok, socket}
  end

  def handle_event("add_repo", _params, socket) do
    socket = socket |> assign(is_added: true)

    {:noreply, socket}
  end
end
