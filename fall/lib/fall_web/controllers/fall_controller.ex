defmodule FallWeb.FallController do
  use FallWeb, :controller

  def welcome(conn, params) do
    choices = ["Earth": 1, "Moon": 2, "Mars": 3]
    render(conn, "welcome.html", choices: choices)
  end
end
