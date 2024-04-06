# Project API

We utilize [Sanic](https://sanic.dev), an asynchronous web app framework for Python.

## Initializing Project

To install dependencies after cloning, run the following (in *administrator mode*) to install Poetry:

```bash
pip install -U poetry
```

Once this is complete, you can `cd` into *this directory* (`root/api`, not `root/api/api`) and run the following command:

```bash
poetry install
```

This will install all dependencies from `pyproject.yaml` accordingly, and also create a virtual environment at `./.venv` automatically.

## Running Server

The `pyproject.toml` file has pre-specified commands that you can simply run as tasks. To run the server on your local machine, just enter the following:

```bash
poetry run task server
```

Considering you've entered any required variables in the `.env` file, everything should work well.

## Contributing Code

Before you commit/push anything to the repository, make sure to run the following commands:

1. Install pre-commit hooks
	```bash
	poetry run task precommit
	```

2. Run Black formatter for all files
	```bash
	poetry run task format
	```

3. Lint all files
	```bash
	poetry run task lintall
	```

This should be everything. If there's any other instructions, feel free to shout at me during the hackathon.
