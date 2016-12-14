defmodule Wizard do
  def main(args) do
    args |> process
  end

  def process(args) do
    IO.inspect args
  end
end
