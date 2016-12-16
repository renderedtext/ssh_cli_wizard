defmodule Wizard.Runner do
  alias Wizard.Format

  def execute(commands) do
    Enum.each commands, fn(command) ->
      IO.puts [Format.bold("command: "), "#{command["command_string"]}"]

      {duration, {_, status}} = :timer.tc(fn ->
        System.cmd("sh", ["-c", command["command_string"]], into: IO.stream(:stdio, :line))
      end)

      IO.puts [Format.bold("duration: "), "#{duration/1_000_000} seconds"]

      case status do
        0 ->
          IO.puts [Format.bold("exit status: "), Format.green("passed")]
        _ ->
          IO.puts [Format.bold("exit status: "), Format.red("failed")]
          IO.puts ""
          System.halt(1)
      end

      IO.puts ""
    end
  end
end
