defmodule LearnElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :learn_elixir,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_check, "> 0.0.0", only: [:dev, :test], runtime: false}
    ]
  end
end
