FROM python:3.8.13-alpine3.15

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /src/app

COPY requirements.txt .
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev && \
    pip install --no-cache-dir -r requirements.txt


COPY ./src . 