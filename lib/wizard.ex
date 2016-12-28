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
    IO.puts ""
    IO.puts 'Welcome to the shh session little helper! Here is what you can do:\n'
    IO.puts 'You can see all your build commands by running "semaphore show"\n'
    IO.puts 'You can run setup commands by running "semaphore run setup"'
    IO.puts 'You can run job commands by running "semaphore run job"'
    IO.puts 'You can run post job commands by running "semaphore run post_job"\n'
    IO.puts 'Also, to run all commands, simply run "semaphore run"\n'
  end
end
