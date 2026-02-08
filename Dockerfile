FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    g++ \
    libatlas-base-dev \
    liblapack-dev \
    libblas-dev \
    && apt-get clean \
    && rm -rf /var/lib/ap/lists/*
    
WORKDIR /app

COPY required.txt .
RUN pip install --no-cache-dir -r required.txt

COPY main.py .

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \ CMD curl -f http://localhost:8000/health || exit 1

# adjust permissions for non-root user
RUN chown -R appuser:appuser /app

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
