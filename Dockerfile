FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install poetry==1.8.3

WORKDIR /application

COPY pyproject.toml poetry.lock* /application/

RUN poetry install --no-root --no-interaction --no-ansi

COPY . /application

EXPOSE 3000

CMD ["poetry", "run", "fastapi", "dev", "--host", "0.0.0.0", "--port", "3000", "src/sample_api/main.py"]