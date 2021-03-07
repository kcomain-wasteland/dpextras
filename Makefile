.PHONY: upload-devpi upload-test upload
.SILENT: help

VERSION = $(shell cat version.txt)

all: setup build
cleanbuild: clean docs build
devenv: clean deps-dev build docs

setup-dev deps-dev:
	pip3 install -r requirements-all.txt

setup deps:
	pip3 install -r requirements.txt

build:
	python3 -m build

upload-test: build
	twine upload "dist/*" -s -r testpypi

upload-devpi: build
	twine upload "dist/*" -s -r devpi

upload: build
	(echo "This project should not be released yet. You might be looking for \`make upload-test\` or \`make upload-devpi\`." && exit 1) && twine upload "dist/*" -s

clean:
	rm -fr build || echo "Nothing to clean in build"
	rm -fr dist || echo "Nothing to clean in dist"
	rm -fr dpextras.egg-info || echo "Nothing to clean in dpextras.egg-info"
	rm -fr docs/build || echo "Nothing to clean in docs/"


.PHONY: docs-serve
docs-serve: deps-dev
	cd docs && make serve

.PHONY: docs
docs: deps-dev
	cd docs && make html

.PHONY: help
help:
	echo 'dpextras v$(VERSION)'
	echo ''
	echo 'Makefile usage: make [all|setup|build|upload-test|upload|clean|docs-serve]'
	echo ''
	echo 'Commands:'
	echo '    make            : runs make setup, make build'
	echo '    make       setup: install required dependencies'
	echo '    make   setup-dev: install develop deps as well as normal required deps'
	echo '    make        deps: same as make setup'
	echo '    make    deps-dev: same as make setup-dev'
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
