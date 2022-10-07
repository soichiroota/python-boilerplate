build:
	docker-compose build

update:
	docker-compose run --rm py poetry update

install:
	docker-compose run --rm py poetry install

up:
	docker-compose up

up-build:
	docker-compose up --build

down:
	docker-compose down

test:
	make install
	docker-compose run --rm py poetry run pytest --cov=api tests

lint:
	make install
	docker-compose run --rm py poetry run flake8 tests app.py python_boilerplate
	docker-compose run --rm py poetry run isort  --profile black --check --diff tests app.py python_boilerplate
	docker-compose run --rm py poetry run black --check tests app.py python_boilerplate
	docker-compose run --rm py poetry run mypy tests app.py python_boilerplate

format:
	make install
	docker-compose run --rm py poetry run isort tests app.py python_boilerplate
	docker-compose run --rm py poetry run black tests app.py python_boilerplate
