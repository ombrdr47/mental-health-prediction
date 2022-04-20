# syntax=docker/dockerfile:1

FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

LABEL maintainer="IndraP24 - Indrashis Paul"

WORKDIR /app

RUN mkdir -p /app/scripts /app/artifacts

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY ./scripts/api/app.py /app/scripts/api/
COPY ./artifacts /app/artifacts

EXPOSE 8000

CMD ["python", "/app/scripts/api/app.py"]    
