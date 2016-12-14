defmodule Wizard do
  alias Wizard.Parser

  def main(args) do
    jobs = Parser.parse
    IO.inspect jobs
    args |> process
  end

  def process(args) do
    IO.inspect args
  end
end
