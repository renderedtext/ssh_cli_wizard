defmodule Wizard.Runner do
  def execute(commands) do
    Enum.each commands, fn(command) ->
      {duration, output} = :timer.tc(fn ->
        :os.cmd(command["command_string"] |> String.to_char_list)
      end)
      status = :os.cmd('if [ $? -eq 0 ]; then echo 0; else echo 1; fi')

      IO.puts "command: #{command["command_string"]}"
      IO.puts "duration: #{duration/1_000_000} seconds"
      case status do
        '0\n' -> IO.puts "exit status: passed"
        '1\n' -> IO.puts "exit status: failed"
      end
      IO.puts output
    end
  end
end
