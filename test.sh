#!/bin/sh

docker build --build-arg REVIEW_VERSION=3.1.0 --tag fabon/alpine-review:local-build .
docker run -t --rm -v "$(pwd)/test-book:/book" fabon/alpine-review:local-build /bin/bash -ci "cd /book && review-pdfmaker config.yml"
