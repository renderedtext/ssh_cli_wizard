defmodule Wizard.Job do
  alias Wizard.Format

  defstruct [:commands]

  def show(job) do
    IO.puts "Commands you can run as a set:\n"
    show_command_set job, "build_setup_commands"
    show_command_set job, "build_commands"
    show_command_set job, "post_build_commands"
  end

  def command_set(job, command_set) do
    job.commands
    |> Map.get(command_set)
  end

  defp show_command_set(job, command_set) do
    IO.puts Format.bold("#{command_set}:")

    build_setup_commands = command_set(job, command_set)
    Enum.each build_setup_commands, fn(command) ->
      IO.puts command["command_string"]
    end
    IO.puts ""
  end
end
