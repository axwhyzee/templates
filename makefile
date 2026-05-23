clean-develop:
	@if [ -d env ]; then rm -rf env; fi
	python3 -m venv env
	./env/bin/pip install black isort mypy pytest

	@mkdir -p .vscode

	@if [ ! -f .vscode/settings.json ]; then \
		printf '%s\n' \
'{' \
'    "files.exclude": {' \
'        "**/.git": true,' \
'        "**/.svn": true,' \
'        "**/.hg": true,' \
'        "**/.DS_Store": true,' \
'        "**/Thumbs.db": true,' \
'        "env": true,' \
'        "makefile": true,' \
'        ".gitignore": true,' \
'        ".claude": true,' \
'        "**/__pycache__": true,' \
'        "**/.pytest_cache": true' \
'    }' \
'}' \
		> .vscode/settings.json; \
	fi

format:
	./env/bin/isort . --profile black --skip env
	./env/bin/black . --line-length 79

test:
	./env/bin/mypy .
	./env/bin/pytest
