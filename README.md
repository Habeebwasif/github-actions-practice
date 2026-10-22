# E-Commerce Python App

A simple Python e-commerce web app, containerized with Docker and tested automatically with GitHub Actions.

## Features

- Python web app served with Gunicorn
- Dockerized for consistent builds and deployment
- Automated tests with pytest
- CI pipeline with GitHub Actions (test, then build Docker image)

## Project Structure

```
.
├── app.py              # Application entry point
├── requirements.txt    # Python dependencies
├── Dockerfile          # Container build instructions
├── tests/              # pytest tests
└── .github/workflows/
    └── ci.yml          # GitHub Actions workflow
```

## Getting Started

### Run with Docker (recommended)

```bash
docker build -t e-commerce-python:latest .
docker run -d -p 8085:80 e-commerce-python:latest
```

Then open http://localhost:8085.

### Run locally without Docker

Requires Python 3.13+.

```bash
python -m venv venv
venv\Scripts\activate        # Windows
# source venv/bin/activate   # macOS/Linux
pip install -r requirements.txt
gunicorn --bind 0.0.0.0:8085 app:app
```

## Running Tests

With Docker:

```bash
docker run --rm --entrypoint pytest e-commerce-python:latest
```

Or locally:

```bash
python -m pytest
```

## CI/CD

Every push to `main` and every pull request triggers the workflow in `.github/workflows/ci.yml`:

1. **test**: installs dependencies and runs pytest
2. **docker**: builds the Docker image (only if tests pass)

## Tech Stack

Python, Gunicorn, pytest, Docker, GitHub Actions

## License

This project is for learning and practice.
