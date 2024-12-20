
PROTO_FILES := `echo proto/*.proto`

lint:
    protolint {{PROTO_FILES}}
