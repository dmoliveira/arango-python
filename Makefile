
.PHONY: coverage doc tests test fast one
.DEFAULT: raw

-include Makefile.local


coverage:
	@echo "Starting ..."
	INTEGRATION=1 nosetests -v \
		--cover-html \
		--cover-html-dir=./coverage \
		--with-coverage --cover-package=arango

tests:
	INTEGRATION=1 nosetests -v

test: tests

fast:
	nosetests -v

one:
	INTEGRATION=1 nosetests -v arango.tests.$(DST)

doc:
	cd docs && make clean && make html && \
		rsync -avz build/html/* -e ssh $(DOCS_HOST)

