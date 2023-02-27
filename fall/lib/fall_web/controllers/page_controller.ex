defmodule FallWeb.PageController do
  use FallWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
