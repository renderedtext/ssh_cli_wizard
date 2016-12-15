defmodule Wizard.Decoder do
  alias Wizard.Job

  def execute do
    json = File.read!("jobs.json")
    job  = Poison.decode!(json, as: %Job{})
  end
end
