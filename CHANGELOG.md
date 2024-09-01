# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased](https://github.com/KiranChander/sample-api) (2024-09-01)
### Added
- Created `Dockerfile` to build the sample-api FastAPI application.
- Created GitHub Actions CI workflow `ci.yaml` for Docker image build, push (to ghcr.io), and unit testing.

### Changed
- Updated `docker-compose.yml` to include the `build` section for `housing-api`.
- Updated `README.md` with instructions to build and run a docker image using `docker-compose`, to pull and run the docker image from GitHub Container Registry, and to re-run the GitHub actions CI workflow.
