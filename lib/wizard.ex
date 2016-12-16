defmodule Wizard do
  alias Wizard.Job

  def main(["run", "setup" | _]),    do: Job.execute_setup_commands
  def main(["run", "job" | _]),      do: Job.execute_job
  def main(["run", "post_job" | _]), do: Job.execute_post_job
  def main(["run"]),                 do: Job.execute_everything
  def main(["run"|  _]),             do: IO.puts "Please specify the commands to run"

  def main(["show"]), do: Job.show
  def main(["help"]), do: help
  def main(_),        do: help

  def help do
    IO.puts 'You can see all command sets by running "./wizard show"\n'
    IO.puts 'You can run a command set by running "./wizard run command_set_name"'
  end
end
