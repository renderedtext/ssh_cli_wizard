defmodule Wizard.Job do

  @base_path "/var/run/commands"

  def show do
    IO.puts "Setup Commands:"
    "build_setup_commands" |> load_commands |> Enum.map(&IO.puts/1)

    IO.puts "Job Commands:"
    "build_commands"       |> load_commands |> Enum.map(&IO.puts/1)

    IO.puts "Post Job Commands:"
    "post_build_commands"  |> load_commands |> Enum.map(&IO.puts/1)
  end

  def execute_setup_commands do
    "build_setup_commands" |> load_commands |> Enum.each(&execute/1)
  end

  def execute_job do
    "build_commands" |> load_commands |> Enum.each(&execute/1)
  end

  def execute_post_job do
    "post_build_commands" |> load_commands |> Enum.each(&execute/1)
  end

  def execute_everything do
    execute_setup_commands
    execute_job
    execute_post_job
  end

  defp execute(command) do
    IO.puts "---> #{command}"

    {result, exit_status} = System.cmd("sh", ["-c", command], into: IO.stream(:stdio, :line))

    if exit_status != 0 do
      IO.puts ""
      IO.puts "\e[31mError while running command.\e\[0m"
      System.halt(1)
    end

    result
  end

  defp load_commands(filename) do
    json = "#{@base_path}/#{filename}" |> File.read!

    if String.length(json) == 0 do
      []
    else
      json
      |> Poison.Parser.parse!
      |> Enum.map(fn(cmd) -> cmd["command_string"] end)
    end
  end
end
