defmodule Wizard do
  alias Wizard.Parser
  alias Wizard.Runner

  def main(args) do
    job = Parser.parse

    [user_command | user_command_set] = args

    case user_command do
      "run" ->
          command_set = user_command_set |> List.first
          if job |> Map.get("commands") |> Map.has_key?(command_set) do
           Parser.commands(job, command_set) |> Runner.execute
          else
            IO.puts "These are not the droids you're looking for. There are no such commands."
          end
      "show" ->
          #here all you commands will be shown
          IO.puts "something"
       _ ->
          IO.puts "You can only run or show commands. This is not a drill."
    end
  end
end
