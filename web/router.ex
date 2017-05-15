defmodule MeilabBlog.Router do
  use MeilabBlog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MeilabBlog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :index
    get "/register", PageController, :index
    get "/bloglist", PageController, :index
    get "/blogdetail/:slug", PageController, :index
    get "/projectlist", PageController, :index
    get "/projectdetail/:slug", PageController, :index
    get "/rent", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1/meilab", MeilabBlog do
    pipe_through :api

    post ( "/auth" ), ApiController, :login
    get ("/posts"), ApiController, :posts
  end
end
