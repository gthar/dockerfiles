#!/bin/sh

make && \
    docker run -it \
        -v $(pwd)/settings.py:/home/ledger/ledger-web/ledger/settings.py:ro \
        -v $(pwd)/db:/home/ledger/db \
        rilla/ledger-web \
        bash
