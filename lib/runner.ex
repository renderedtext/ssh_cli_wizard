defmodule Wizard.Runner do
  alias Wizard.Format

  def execute(commands) do
    Enum.each commands, fn(command) ->
      {duration, output} = :timer.tc(fn ->
        :os.cmd(command["command_string"] |> String.to_char_list)
      end)
      status = :os.cmd('if [ $? -eq 0 ]; then echo 0; else echo 1; fi')

      IO.puts [Format.bold("command: "), "#{command["command_string"]}"]
      IO.puts [Format.bold("duration: "), "#{duration/1_000_000} seconds"]
      case status do
        '0\n' ->
          IO.puts [Format.bold("exit status: "), Format.green("passed")]
        '1\n' ->
          IO.puts [Format.bold("exit status: "), Format.red("failed")]
      end
      IO.puts output
    end
  end
end
