defmodule Wizard.Parser do
  def parse do
    json = File.read!("jobs.json")
    jobs  = Poison.Parser.parse! json
  end
end
