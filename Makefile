all: pex


ENV = .env

$(ENV):
	python3 -m venv $(ENV)
	./$(ENV)/bin/pip install --upgrade pip-tools pip pex


requirements.txt: $(ENV) requirements.in
	./$(ENV)/bin/pip-compile --output-file=requirements.txt --generate-hashes requirements.in
	# this works:
	#./$(ENV)/bin/pip-compile --output-file=requirements.txt requirements.in

pex: requirements.txt $(ENV)
	./$(ENV)/bin/python3 setup.py bdist_pex --pex-args='--disable-cache -vvvv -r requirements.txt --pip-version 24.0' --bdist-all

clean:
	rm -fr "$(ENV)" dist requirements.txt __pycache__
