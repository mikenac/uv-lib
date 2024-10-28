.PHONY: venv install lint lint-fix test clean

venv:
	@uv venv .venv

install: venv
	@uv sync

lint:
	@.venv/bin/ruff check src/

lint-fix:
	@.venv/bin/black src/
	@.venv/bin/ruff check --fix src/

test: install
	@.venv/bin/pytest -n 3

package:
	@uv build

publish: package
	@uv publish

clean:
	@rm -rf .venv
