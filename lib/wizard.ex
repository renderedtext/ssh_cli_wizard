defmodule Wizard do
  def main(args) do
    args |> process
  end

  def process(args) do
    IO.puts args
  end
end
