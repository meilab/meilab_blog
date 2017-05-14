defmodule MeilabBlog.ApiView do
  use MeilabBlog.Web, :view

  def render("user.json", %{user: user}) do
    %{
      "code": "200",
      "token": "111"
    }
  end
end