# ledger-web

FROM python:3.8-slim-buster

RUN apt-get update && \
    apt-get install -y git g++ gosu && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m ledger

RUN git clone https://github.com/vifon/ledger-web /home/ledger/ledger-web

RUN pip install -r /home/ledger/ledger-web/requirements.txt

RUN mkdir -p /home/ledger/db
VOLUME /home/ledger/db

COPY docker-entrypoint.sh /entrypoint

RUN chmod +x /entrypoint

WORKDIR /home/ledger/ledger-web

ENTRYPOINT ["/entrypoint"]
