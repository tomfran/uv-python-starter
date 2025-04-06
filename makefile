.PHONY: help build fmt test run

help:
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

build: ## Sync and build the project with all extras and dev dependencies
	uv sync --all-extras --dev && uv build

fmt: ## Run Ruff to auto-fix and format the code
	uvx ruff check --fix --extend-select I
	uvx ruff format

test: ## Run tests using pytest with verbose output
	uv run pytest tests -v

run: ## Run the main Python application
	python src/main.py
