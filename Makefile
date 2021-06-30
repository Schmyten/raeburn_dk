mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

all: build

build:
	docker run -u "$(shell id -u):$(shell id -g)" -v $(mkfile_dir):/app --workdir /app balthek/zola:0.13.0 build

serve:
	docker run -u "$(shell id -u):$(shell id -g)" -v $(mkfile_dir):/app --workdir /app -p 8080:8080 balthek/zola:0.13.0 serve --interface 0.0.0.0 --port 8080 --base-url localhost