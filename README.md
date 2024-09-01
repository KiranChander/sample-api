# Sample API

This is a sample api. 

## Technology Used
- [x] [Python](https://www.python.org)
- [x] [FastAPI](https://fastapi.tiangolo.com)
- [x] [SQLAlchemy](https://www.sqlalchemy.org)
- [x] [Poetry](https://python-poetry.org)
- [x] [Flyway](https://www.red-gate.com/products/flyway/community/)
- [x] [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### Environment variables

The following environment variables are expected:

- ORIGINS: comma separated list of [allowed origins](https://fastapi.tiangolo.com/tutorial/cors/).
- POSTGRES_SERVER: URL of db server
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_DB: postgres DB name

### DB adaptor

The [psycopg2](https://www.psycopg.org) adaptor is used. Note the [installation requirements](https://www.psycopg.org/docs/install.html) for the psycopg2 package. The [sample-api dependencies](pyproject.toml) use the psycopg2 package and not the psycopg2-binary package.
    
## Local Development

### Running locally

#### Docker Setup

The application is containerized using Docker. A Dockerfile is provided to build the Docker image for the sample API.

#### Building the Docker Image

To build the Docker image, run the command `docker-compose build` from the root directory. This command will build the sample-api-housing-api image using the provided Dockerfile.

#### Running Locally with Docker Compose

To start the entire stack locally, run the command `docker-compose up`.
This will start the following services:
- Postgres server
- Flyway - Sets up the Postgres tables and inserts some dev data.
- sample-api server

Environment variables are defined in the docker-compose.yml file.

The sample-api folder is volume-mounted, so any changes to the code will be reflected in the container.

The API's documentation is available at http://localhost:3003/docs.

### Unit tests

- Run `docker compose --profile test up` command to run the unit tests from the root directory. This will run the above services as well as the unit tests.
- The folder is volume mounted, so any changes to the code will be reflected in the container and run the unit tests again.

### How to Pull and Run the Docker Image

To run the Docker image directly without Docker Compose, you can pull the image from the GitHub Container Registry and start a container from it, allowing you to use the application without the additional configuration and orchestration provided by Docker Compose.

#### Pull the Docker Image

To pull the Docker image from the GitHub Container Registry, use the command `docker pull ghcr.io/kiranchander/sample-api:latest`. This command fetches the latest version of the Docker image from the registry.

#### Run the Docker Image

To run the Docker image and expose it on port 3003 of your host maachine, use the command `docker run --rm -p 3003:3000 ghcr.io/kiranchander/sample-api:latest`.

Once the container is running, you can access the FastAPI application by opening your web browser and navigating to http://localhost:3003

The API's documentation is available at http://localhost:3003/docs.

#### Stopping the Container
To stop the running container, you can press `CTRL+C` in the terminal where the container is running. Since the `--rm` flag is used, the container will be automatically removed after it is stopped.


## GitHub Actions CI Workflow

### Triggering the Workflow

The GitHub Actions CI workflow is configured to run automatically under the following conditions:

- Pushes to the main Branch: Every time code is pushed to the main branch, the workflow will be triggered.
- Pull Requests Targeting the main Branch: When a pull request is opened or updated with the main branch as the target, the workflow will be triggered.

### Viewing Workflow Runs

To view the status of workflow runs:

- Visit the [GitHub Actions page for this repository](https://github.com/KiranChander/sample-api).
- You will see a list of workflow runs, including their status (success, failure, or in-progress).

### Manual Triggering

While the workflow is primarily triggered automatically, you can manually re-run a workflow from the Actions tab:

- Navigate to the [GitHub Actions page](https://github.com/KiranChander/sample-api/actions) for the repository.
- Select the workflow run you want to re-run.
- Click the "Re-run jobs" button to trigger the workflow manually.

### Checking Workflow Status

After triggering the workflow, you can monitor its status on the [GitHub Actions page](https://github.com/KiranChander/sample-api/actions).

Look for the most recent workflow run. Click on it to view details, including job status, logs, and any errors if present.

By following these instructions, you can monitor and manage the CI workflow for your repository, ensuring that your builds and tests run as expected.

### Note:

To manually re-run workflows or perform other administrative tasks in this repository, you must be a collaborator with write access. If you need access, please request to be added as a collaborator to this repository.

## The API

This is a simple API. It is not production ready. 

The API is based on the table schema defined in [V1.0.0__init.sql](db/migrations/V1.0.0__init.sql) file. Note the foreign key constraint if you want to try the endpoints out.

The [http://localhost:3003/docs](http://localhost:3003/docs) page lists the available endpoints.