defmodule Telebacon.Mixfile do
  use Mix.Project

  def project do
    [app: :telebacon,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     dialyzer: [plt_add_apps: [:httpoison, :gproc, :poison],
             paths: ["_build/dev/lib/telebacon/ebin"]]
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :gproc],
     mod: {Telebacon.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.11.0"},
     {:poison, "~> 3.1"},
     {:gproc, "~> 0.5"},
     {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
     {:credo, "~> 0.5", only: [:dev, :test]},
     {:ex_doc, "~> 0.14", only: :dev},
     {:temp, "~> 0.4"}
    ]
  end
end
