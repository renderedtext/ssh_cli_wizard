defmodule Wizard do
  alias Wizard.Decoder
  alias Wizard.Runner
  alias Wizard.Job

  def main(args) do
    job = Decoder.execute

    [user_command | user_command_set] = args

    case user_command do
      "run" ->
          command_set = user_command_set |> List.first
          if job.commands |> Map.has_key?(command_set) do
            Job.command_set(job, command_set) |> Runner.execute
          else
            IO.puts "These are not the droids you're looking for. There are no such commands."
          end
      "show" ->
          Job.show(job)
       _ ->
          IO.puts "You can only run or show commands. This is not a drill."
    end
  end
end
