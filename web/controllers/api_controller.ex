defmodule MeilabBlog.ApiController do
  use MeilabBlog.Web, :controller

  def login(conn, %{"username" => username, "password" => password}) do    
    render(conn, "user.json", %{user: ""})
  end
end