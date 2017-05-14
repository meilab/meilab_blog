# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :meilab_blog,
  ecto_repos: [MeilabBlog.Repo]

# Configures the endpoint
config :meilab_blog, MeilabBlog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D4ezXQZMVwEIU9+AbWilfP+a4ZRITHEeJPiAJVK/0KQDV+VnRM2EYhvPQRpnkH1v",
  render_errors: [view: MeilabBlog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MeilabBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
