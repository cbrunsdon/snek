defmodule Snek.Mixfile do
  use Mix.Project

  def project do
    [app: :snek,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Snek, []},
     applications: applications(Mix.env)
   ]
  end

  def applications(:dev) do
    [
      :reprise,
    ] ++ applications(:all)
  end

  def applications(_) do
    [
      :cowboy,
      :gettext,
      :logger,
      :phoenix,
      :phoenix_pubsub,
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:phoenix, "~> 1.2.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:reprise, "~> 0.5", only: :dev}
    ]
  end
end
