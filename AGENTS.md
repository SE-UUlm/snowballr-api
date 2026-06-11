# AGENTS

## Overview

This repository contains the **SnowballR API specification**: the Protocol Buffers (`.proto`) definitions used
for gRPC communication between the SnowballR frontend and backend, plus the tooling to build the static API
documentation site (via [Sabledocs](https://github.com/markvincze/sabledocs)) and a thin NPM package wrapping
the generated TypeScript client. Prefer referencing the README and existing docs over restating them here. If
you must summarize, keep it short and point to the canonical page.

### SnowballR repositories

- Organization: https://github.com/SE-UUlm
- SnowballR (umbrella repo): https://github.com/SE-UUlm/snowballr
- SnowballR API: https://github.com/SE-UUlm/snowballr-api
- SnowballR Backend: https://github.com/SE-UUlm/snowballr-backend
- SnowballR Frontend: https://github.com/SE-UUlm/snowballr-frontend
- SnowballR CI: https://github.com/SE-UUlm/snowballr-ci
- SnowballR Mock Backend: https://github.com/SE-UUlm/snowballr-mock-backend
- SnowballR Backend (legacy): https://github.com/SE-UUlm/snowballr-backend-old

### Canonical documentation and what each covers

This repository has **no markdown wiki**. The canonical references are:

- README.md — getting started (consumption as submodule or NPM package), release procedure, docs build, linting
- proto/*.proto — the authoritative service / message definitions (start at `proto/main.proto`)
- docs/ — Jinja-style HTML templates used by Sabledocs to render the static documentation site
- sabledocs.toml — Sabledocs config (title, footer, repo URL, markdown extensions, template path)
- patches/ — pypatch patches applied at docs build time to Sabledocs and `markdown_mermaidjs`
- Published API documentation: https://snowballr.informatik.uni-ulm.de/docs/
- Release procedure (canonical): https://github.com/SE-UUlm/snowballr/wiki/Contributing#release-procedure
- npm-package/ — the published NPM package (https://www.npmjs.com/package/snowballr-api)

## Structure

```
.
├── proto/                       # canonical .proto sources (main.proto is the entry point)
│   ├── main.proto
│   ├── authentication.proto
│   ├── base.proto
│   ├── criterion.proto
│   ├── export.proto
│   ├── fetcher.proto
│   ├── paper.proto
│   ├── project.proto
│   ├── review.proto
│   ├── user.proto
│   └── user_settings.proto
├── npm-package/                 # NPM publish artifact (generated TS client + package.json)
├── docs/                        # custom Sabledocs HTML templates (base, enum, message, package, ...)
├── patches/                     # pypatch patches applied to Sabledocs / markdown_mermaidjs at build time
├── images/                      # logo used in README
├── Justfile                     # `lint`, `fix`, `build-docs`, `run-docs`
├── Dockerfile                   # multi-stage: Sabledocs build → nginx serving the static site
├── docker-compose.yaml          # local docs build, exposed on :8000
├── flake.nix / flake.lock       # Nix dev shell (just, protobuf, protolint, protols)
├── sabledocs.toml               # Sabledocs config
├── markdownlint.json
├── .github/workflows/           # docker (publish image), linting, release (NPM publish), git_conventions
├── CHANGELOG.md
└── LICENSE
```

## Where to look

| Task                            | Location                                               | Notes                                                                |
| ------------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------- |
| API entry point                 | proto/main.proto                                       | Imports all other .proto files; start here when navigating.          |
| Service / message definitions   | proto/*.proto                                          | Canonical contract.                                                  |
| Generated TS client (consumers) | npm-package/                                           | Published as `snowballr-api` on npm.                                 |
| Static docs templates           | docs/*.html                                            | Sabledocs templates (`template-path` in sabledocs.toml).             |
| Docs build patches              | patches/*.patch                                        | Applied via `pypatch` inside the Dockerfile.                         |
| Sabledocs configuration         | sabledocs.toml                                         | Title, footer, repo info, markdown extensions, template path.        |
| Build / lint shortcuts          | Justfile                                               | `just lint`, `just fix`, `just build-docs`, `just run-docs [open]`.  |
| Local docs container            | Dockerfile, docker-compose.yaml                        | nginx serves the generated site on :80 (mapped to :8000 in compose). |
| Nix dev shell                   | flake.nix                                              | Provides `just`, `protobuf`, `protolint`, `protols`.                 |
| Lint CI (protolint + markdown)  | .github/workflows/linting.yml                          | Uses `yoheimuta/action-protolint` and snowballr-ci `lint-md@v1`.     |
| Docker image publishing         | .github/workflows/docker.yml                           | Delegates to `SE-UUlm/snowballr-ci/.github/workflows/docker.yml@v1`. |
| Release / NPM publish           | .github/workflows/release.yml                          | Builds and publishes `snowballr-api` to npm on `v*.*.*` tags.        |
| Linear history check            | .github/workflows/git_conventions.yml                  | Uses snowballr-ci `ensure-linear-history@v1`.                        |
| Release procedure (canonical)   | https://github.com/SE-UUlm/snowballr/wiki/Contributing | Single source of truth for SnowballR releases.                       |

## Architecture and patterns

- **gRPC + Protocol Buffers:** The API is a `.proto` contract. The backend implements the services; the
  frontend consumes the generated stubs (via the `snowballr-api` NPM package or by generating from source).
- **Consumption modes:** Git submodule (then run `protoc` per the gRPC language guide), or the published
  TypeScript NPM package (preferred for the SvelteKit frontend).
- **Docs pipeline:** `protoc --include_source_info` builds `descriptor.pb`; Sabledocs (patched via `pypatch`)
  renders HTML using the templates in `docs/`; the output is served by nginx (see `Dockerfile`).
- **Browser compatibility:** Direct gRPC is not browser-compatible. The umbrella repo (`snowballr`) deploys a
  gRPC-Web proxy in front of the backend — see `https://github.com/SE-UUlm/snowballr/wiki/Architecture`.

## API versioning

- This repository is the source of truth for the API version. Tags `v*.*.*` trigger both an NPM publish and a
  Docker image build/publish.
- The backend's `apiVersion` (see `build.gradle.kts` in `snowballr-backend`) and the frontend's `snowballr-api`
  dependency must be bumped to consume new API versions.
- When releasing, also bump the version in `npm-package/package.json` (README.md, "Release procedure").

## Boundaries

- Always do: prefer wiki / README references for process guidance; keep `.proto` files protolint-clean (run
  `just fix` before committing); update `npm-package/package.json` version in lockstep with releases.
- Ask first: any breaking change to existing services / messages (renames, field number reuse, removed RPCs);
  changes to the patches under `patches/`; changes to the Sabledocs template or `sabledocs.toml`; changes to
  `Dockerfile` (Sabledocs / nginx layers); CI workflow edits; bumping `protoc` / `protobuf` versions in `flake.nix`.
- Never do: reuse a previously-used proto field number; commit generated artifacts other than under
  `npm-package/dist` if reviewers expect it; publish to NPM manually from a workstation; modify CHANGELOG.md for
  past releases.

## Commands (run from repo root)

### Lint and format (proto)

- Lint: `just lint` (or `protolint proto/*.proto`)
- Auto-fix: `just fix` (or `protolint -fix proto/*.proto`)

### Docs

- Build docs image: `just build-docs` (or `docker build . -t snowballr-api/docs`)
- Run docs locally: `just run-docs` (opens http://localhost:8080) or `just run-docs false` (no browser open)
- Via compose: `docker compose up` (exposes http://localhost:8000)

### NPM package

- The package is published by CI on tag push (`.github/workflows/release.yml`). For a local dry run:
  `cd npm-package && npm i && npm run compile && npm publish --access public --dry-run`.

### Dev shell (Nix)

- `nix develop` provides `just`, `protobuf`, `protolint`, `protols` (see `flake.nix`).

## Style, checks, and tests

- **Proto style:** Enforced by Protolint (CI runs `yoheimuta/action-protolint@v1`). Keep snake_case for fields,
  PascalCase for messages/services/enums, etc.
- **Markdown:** `markdownlint.json` is enforced via snowballr-ci's `lint-md@v1` (see `linting.yml`). Note that
  `docs/`, `patches/`, and `proto/` are excluded from broken-link checks.
- **Tests:** There are no automated tests in this repo — correctness is enforced by the consumers (backend
  service tests, frontend integration/E2E tests) and by protolint.

## Issues

- Use `.github/ISSUE_TEMPLATE` (when present) to pick the right template.

## PRs

- Use `.github/pull_request_template.md` (when present) for required sections.

## Git and CI conventions

- PRs to `main` must keep a linear git history (`git_conventions.yml`, via snowballr-ci's
  `ensure-linear-history@v1`). Rebase onto `main` before requesting review.
- CI runs protolint, markdown lint, docker image build/publish, and (on tags) NPM publish.

## Conventional commits

Commit messages follow Conventional Commits with a short type prefix and optional scope. Common types in this
repo include: feat, fix, refactor, docs, chore, ci. Use lowercase types and keep the subject imperative and
concise.
