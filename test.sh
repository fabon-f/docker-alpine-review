#!/bin/sh

docker build --tag fabon/alpine-review:local-build .
docker run -t --rm -v "$(pwd)/test-book:/book" fabon/alpine-review:local-build /bin/bash -ci "cd /book && review-pdfmaker config.yml"
