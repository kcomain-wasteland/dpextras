all: setup build

setup:
	pip3 install -r requirements.txt -r requirements-dev.txt

build:
	python3 -m build

.PHONY: upload-test
upload-test: build
	python3 -m twine upload --repository testpypi dist/*

.PHONY: upload
upload: build
	(echo "This project should not be released yet. You might be looking for make upload-test." && exit 1) && python3 -m twine upload dist/*

clean:
	rm -fr build || echo "Nothing to clean in build"
	rm -fr dist || echo "Nothing to clean in dist"
	rm -fr dpextras.egg-info || echo "Nothing to clean in dpextras.egg-info"
