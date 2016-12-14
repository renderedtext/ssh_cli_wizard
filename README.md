# Wizard

Runs shell commands from specifically formatted JSON file.

## Usage

To make wizard script, clone this repository to your local machine and run
```bash
mix escript.build
```

Then you can test run it with, for ex:

```bash
./wizard run build_commands
```
and it will run the build commands (they are `echo` only) from the `jobs.json`
file.

Or:

```bash
./wizard run a marathon
```

Or:

```bash
./wizard where is my pizza
```
