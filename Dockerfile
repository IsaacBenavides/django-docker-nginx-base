FROM python:3.8

RUN mkdir /src

WORKDIR /src

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y python3-pip

COPY requirements.txt /src

RUN pip install -r requirements.txt

COPY ./entrypoint.sh .

RUN sed -i 's/\r$//g' /src/entrypoint.sh

RUN chmod +x /src/entrypoint.sh

COPY . .

# ENTRYPOINT ["/src/entrypoint.sh"]