FROM python:3.6-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY docker-entrypoint.sh /usr/local/bin
RUN ["chmod", "+x", "/usr/local/bin/docker-entrypoint.sh"]

RUN apk add --no-cache build-base postgresql-client postgresql-dev
RUN pip install --upgrade pip pipenv

WORKDIR /opt/app
COPY Pipfile /opt/app
COPY Pipfile.lock /opt/app

RUN pipenv install --ignore-pipfile --system

COPY . /opt/app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["server", "--bind", "0.0.0.0:8000"]
