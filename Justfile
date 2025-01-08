
PROTO_FILES := `echo proto/*.proto`

lint:
    protolint {{PROTO_FILES}}

fix:
    protolint -fix {{PROTO_FILES}}
