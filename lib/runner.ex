defmodule Wizard.Runner do
  alias Wizard.Parser

  def execute(job) do
    commands = Parser.parse

    Enum.each commands, fn(command) ->
      IO.puts :os.cmd(command |> String.to_char_list)
    end
  end
end
