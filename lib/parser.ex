defmodule Wizard.Parser do
  def parse do
    json = File.read!("jobs.json")
    commands = Poison.Parser.parse! json
  end

  def commands(job, command_set) do
    job
    |> Map.get("commands")
    |> Map.get(command_set)
  end
end
