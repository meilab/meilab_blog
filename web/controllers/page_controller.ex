defmodule MeilabBlog.PageController do
  use MeilabBlog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
