defmodule GitSmartWeb.PageLive.Index do
  use GitSmartWeb, :live_view
  alias GitSmartWeb.PageLive.Repo
  alias GitSmart.Repositories

  def mount(_params, _session, socket) do
    repositories = Repositories.list()

    socket = assign(socket, :repositories, repositories)

    {:ok, socket}
  end
end
