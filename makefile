clean-develop:
	@if [ -d env ]; then rm -rf env; fi
	python3 -m venv env
	./env/bin/pip install black isort mypy pytest

format:
	./env/bin/isort . --profile black --skip env
	./env/bin/black .

test:
	mypy .
	pytest
