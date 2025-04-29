
PROTO_FILES := `echo proto/*.proto`

lint:
    protolint {{PROTO_FILES}}

fix:
    protolint -fix {{PROTO_FILES}}

build-docs:
    docker build . -t "snowballr-api/docs"

run-docs open="true": build-docs
    #!/usr/bin/env bash
    docker run --rm -p 8080:80 "snowballr-api/docs" &
    pid=$!
    if [ "{{open}}" = "true" ]; then \
        sleep 1
        open "http://localhost:8080"; \
    fi
    wait $pid
