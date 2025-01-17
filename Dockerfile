FROM markvincze/sabledocs:0.16.893-slim AS build
WORKDIR /build
COPY . .
RUN cd proto && protoc *.proto -o ../descriptor.pb --include_source_info
RUN pip3 install pypatch
RUN pypatch apply ./sabledocs_fix_nested.patch sabledocs
RUN sabledocs

FROM nginx AS deploy
COPY --from=build /build/sabledocs_output /usr/share/nginx/html
