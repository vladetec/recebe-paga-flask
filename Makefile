define USAGE
Super awesome hand-crafted build system ⚙️
By Vlademir.

Commands:
	create    create project directories and files.
	init      Install Python dependencies with venv
	# test      # Run linters, test db migrations and tests.
	serve     Run app in dev environment.
	check     cat -e -t -v  makefile
endef

export USAGE
help:
	@echo "$$USAGE"

create:
	mkdir -p templates static
	touch app.py database.py 

init:
	pip install -U pip
	pip install -U setuptools wheel
	#pip install Flask==2.0.2 Flask-RESTful==0.3.9 Flask-Migrate==2.5.0 Flask-Script==2.0.5 Flask-SQLAlchemy==2.5.1 gunicorn==20.1.0
	pip install -r requirements.txt
	pip list
	pip freeze > requirements.txt
	touch Procfile config.py .env application.py api.py __init__.py
	mkdir -p apps
	@mv __init__.py apps
	@mv api.py apps
	touch __init__.py
	

#test:
	# pipenv run yapf -irp flask-example tests
	# pipenv run flake8 --max-line-length=120 flask-example tests
	# pipenv run pytest --junitxml=pytest.xml --cov-config .coveragerc --cov flask-example --cov-report term

serve:
	FLASK_APP=app 
	FLASK_ENV=development
	flask run

check:
	cat -e -t -v  Makefile