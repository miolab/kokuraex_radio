defmodule KokuraexAppWeb.PageController do
  use KokuraexAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
