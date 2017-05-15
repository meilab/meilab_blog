defmodule MeilabBlog.ApiController do
  use MeilabBlog.Web, :controller

  @mock_post_list_data(
    "priv/mock_data/posts.json"
    |> File.read!
    |> Poison.decode!
  )

  def login(conn, %{"username" => username, "password" => password}) do    
    render(conn, "user.json", %{user: ""})
  end

  def posts(conn, _params) do    
    conn
    |> json(@mock_post_list_data)
  end
end