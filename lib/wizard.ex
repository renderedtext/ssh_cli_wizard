defmodule Wizard do
  alias Wizard.Decoder
  alias Wizard.Runner
  alias Wizard.Job

  def main(args) when args == [] do
    general_help_message
  end

  def main(args) do
    job = Decoder.execute

    [user_command | user_command_set] = args

    case user_command do
      "run" ->
          command_set = user_command_set |> List.first
          if job.commands |> Map.has_key?(command_set) do
            Job.command_set(job, command_set) |> Runner.execute
          else
            IO.puts "This command set doesn't exist"
          end
      "show" ->
          Job.show(job)
       _ ->
         general_help_message
    end
  end

  def general_help_message do
    IO.puts 'You can see all command sets by running "./wizard show"\nYou can run a command set by running "./wizard run command_set_name"'
  end
end
