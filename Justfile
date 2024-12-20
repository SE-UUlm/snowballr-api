
PROTO_FILES := `echo *.proto`

lint:
    protolint {{PROTO_FILES}}
