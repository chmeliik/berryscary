YARN_CACHE_FOLDER := /tmp/berryscary-cache

all: build run

build: prefetch clean
	podman build . \
		--no-cache \
		--network none \
		-v $(YARN_CACHE_FOLDER):$(YARN_CACHE_FOLDER):z \
		--build-arg YARN_CACHE_FOLDER=$(YARN_CACHE_FOLDER) \
		--tag berryscary

run:
	podman run --rm -ti berryscary:latest

prefetch:
	YARN_CACHE_FOLDER=$(YARN_CACHE_FOLDER) yarn install --mode=skip-build

clean:
	git clean -Xdf  # only ignored, also directories, force
