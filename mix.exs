defmodule Wizard.Mixfile do
  use Mix.Project

  def project do
    [app: :wizard,
     version: "0.0.1",
     elixir: "~> 1.2",
     escript: [main_module: Wizard],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:poison, "~> 3.0"}]
  end
end
