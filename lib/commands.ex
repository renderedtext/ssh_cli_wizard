defmodule Wizard.Commands do
  defstruct [:commands]

  def show(job) do
    show_command_set job, "build_setup_commands"
    show_command_set job, "build_commands"
    show_command_set job, "post_build_commands"
  end

  def command_set(job, command_set) do
    job.commands
    |> Map.get(command_set)
  end

  defp show_command_set(job, command_set) do
    IO.puts "#{command_set}:"
    build_setup_commands = command_set(job, command_set)
    Enum.each build_setup_commands, fn(command) ->
      IO.puts command["command_string"]
    end
  end
end
