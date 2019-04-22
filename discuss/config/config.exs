# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZNWo0NkksolaVdEqVUyHnt10WNpC0d3Bw85HK5K8MEQiJofmuFMP0tEAXrSoZLCA",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [default_scope: "user,user:email,public_repo"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "2bffb410ed72c02334b4",
  client_secret: "c56ccd8c7870bc7fb87a93073be4bd3578fbf1e4"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
