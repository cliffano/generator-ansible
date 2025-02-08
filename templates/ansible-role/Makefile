ci: deps lint test

deps:
	python3 -m venv .venv && . .venv/bin/activate && python3 -m pip install -r requirements.txt

lint:
	molecule lint

test:
	molecule test

.PHONY: ci deps lint test