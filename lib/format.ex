defmodule Wizard.Format do
  def bold(string) do
    [IO.ANSI.bright, string, IO.ANSI.reset]
  end

  def green(string) do
    [IO.ANSI.green, string, IO.ANSI.reset]
  end

  def red(string) do
    [IO.ANSI.red, string, IO.ANSI.reset]
  end
end
