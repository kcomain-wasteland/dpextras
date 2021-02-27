.PHONY: upload-test upload
.SILENT: help

VERSION = $(shell cat version.txt)

all: setup build

setup deps:
	pip3 install -r requirements-all.txt

build:
	python3 -m build

upload-test: build
	python3 -m twine upload --repository testpypi dist/*

upload: build
	(echo "This project should not be released yet. You might be looking for make upload-test." && exit 1) && python3 -m twine upload dist/*

clean:
	rm -fr build || echo "Nothing to clean in build"
	rm -fr dist || echo "Nothing to clean in dist"
	rm -fr dpextras.egg-info || echo "Nothing to clean in dpextras.egg-info"
	rm -fr docs/build || echo "Nothing to clean in docs/"

.PHONY: docs-serve
docs-serve:
	cd docs && make serve

.PHONY: docs
docs:
	cd docs && make html

.PHONY: help
help:
	echo 'dpextras v$(VERSION)'
	echo ''
	echo 'Makefile usage: make [all|setup|build|upload-test|upload|clean|docs-serve]'
	echo ''
	echo 'Commands:'
	echo '    make            : runs make setup, make build'
	echo '    make       setup: install all dependencies'
	echo '    make        deps: same as make setup'
	echo '    make       build: builds the package'
	echo '    make      upload: uploads the package to PyPI'
	echo '    make  upload-dev: uploads the package to TestPyPI'
	echo '    make       clean: clear the build dirs'
	echo '    make        docs: build the docs'
	echo '    make  docs-serve: build and serve the docs through a livereload server'
	echo ''
	echo "Quickstart: \`make\`"
	echo 'Docs: https://dpextras.kcomain.dev'
	echo ''
	echo 'For more information, see the Docs.'
