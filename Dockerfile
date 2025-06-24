FROM markvincze/sabledocs:0.16.893-slim AS build
WORKDIR /build
COPY . .
RUN cd proto && protoc *.proto -o ../descriptor.pb --include_source_info
RUN pip3 install pypatch markdown-mermaidjs
RUN pypatch apply ./patches/sabledocs_fix_nested.patch sabledocs
RUN pypatch apply ./patches/markdown_mermaidjs_no_script.patch markdown_mermaidjs
RUN sabledocs

FROM nginx AS deploy
COPY --from=build /build/sabledocs_output /usr/share/nginx/html
