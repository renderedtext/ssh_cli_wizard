# SSHCliWizard

Runs the project build commands from specifically formatted JSON files, inside
the SSH session. It helps make the SHH experience more friendly for the user.

## Usage

Seeing all commands:
```bash
semaphore show
```

Running all commands:
```bash
semaphore run
```

Running setup commands:
```bash
semaphore run setup
```

Running job commands:
```bash
semaphore run job
```

Running post job commands:
```bash
semaphore run post_job
```

## Development

After making the wanted changes to the source code, make the script with:
```bash
mix escript.build
```

This will create an executable with the name: `wizard`. Rename the executable to
what is appropriate to user of the SSH session (`semaphore` makes most sense)
and push you changes.

Do not add the executable to the `.gitignore` file, as it is downloaded from
github to the machine running the SHH session.
