defmodule Wizard.Runner do
  def execute(commands) do
    Enum.each commands, fn(command) ->
      IO.puts :os.cmd(command["command_string"] |> String.to_char_list)
    end
  end
end
