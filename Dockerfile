# Base image
FROM python:3.9-slim AS base


# Development environment
FROM base AS development

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV FLASK_DEBUG=1

WORKDIR /app

# Copy and install dependencies first for better caching
COPY requirements.txt dev-requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r dev-requirements.txt

# Create directories for volume mounts
RUN mkdir -p /app/templates /app/static

# Copy application code (this will be overridden by volume mounts in dev)
COPY . .

# Expose port
EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Test environment
FROM base AS test

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY . .
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["pytest"]

# Production environment
FROM base AS production

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY . .
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

