defmodule Wizard.Runner do
  def execute(commands) do
    Enum.each commands, fn(command) ->
      {duration, output} = :timer.tc(fn ->
        :os.cmd(command["command_string"] |> String.to_char_list)
      end)
      IO.puts "command: #{command["command_string"]}"
      IO.puts "duration: #{duration/1_000_000} seconds"
      IO.puts output
    end
  end
end
