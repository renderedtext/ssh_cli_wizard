defmodule Wizard.Parser do
  alias Wizard.Commands

  def parse do
    json = File.read!("jobs.json")
    commands = Poison.decode!(json, as: %Commands{})
  end
end
