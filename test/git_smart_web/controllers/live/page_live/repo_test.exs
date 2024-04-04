defmodule GitSmartWeb.PageLive.RepoTest do
  use GitSmartWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "render/1 Repo" do
    test "render the repo live_component", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")

      assert has_element?(lv, "li#elixir")
      assert has_element?(lv, "li#elixir>div>div>h3", "Elixir Language")
      assert has_element?(lv, "li#elixir>div>div>span", "1,000")
      assert has_element?(lv, "li#elixir>div>div>p", "pumpkin")
      assert has_element?(lv, "li#elixir>div>div>button")
    end
  end

  describe "handle_event/3 - add repo" do
    test "handle the event to add repo", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/")

      refute has_element?(lv, "li#elixir>div>div", "Repo added!")

      lv |> element("button[phx-click=add_repo]") |> render_click()

      assert has_element?(lv, "li#elixir>div>div", "Repo added!")
    end
  end
end
