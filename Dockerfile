FROM markvincze/sabledocs:latest AS build
WORKDIR /build
COPY . .
RUN protoc *.proto -o descriptor.pb --include_source_info
RUN sabledocs

FROM nginx AS deploy
COPY --from=build /build/sabledocs_output /usr/share/nginx/html
