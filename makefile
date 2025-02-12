clean-develop:
	@if [ -d env ]; then rm -rf env; fi
	python3 -m venv env
	./env/bin/pip install black mypy pytest

format:
	./env/bin/black .

test:
	mypy .
	pytest
