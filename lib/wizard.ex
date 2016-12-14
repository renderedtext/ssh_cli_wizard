defmodule Wizard do
  alias Wizard.Parser
  alias Wizard.Runner

  def main(args) do
    job = Parser.parse

    [user_command | user_command_set] = args

    if user_command == "run" do
      [command_set | rest] = user_command_set
      if job |> Map.get("commands") |> Map.has_key?(command_set) do
       Parser.commands(job, command_set) |> Runner.execute
      else
        IO.puts "These are not the droids you're looking for. There are no such commands."
      end
    else
      IO.puts "You can only run commands. This is not a drill."
    end
  end
end
