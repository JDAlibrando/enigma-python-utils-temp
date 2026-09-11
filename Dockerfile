FROM python:3.12-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        coreutils \
        gawk \
        grep \
        procps \
        sed \
    && rm -rf /var/lib/apt/lists/* \
    && test -x /bin/bash \
    && for utility in awk date grep ps sed tail tee head tr uname sleep \
        touch mktemp mkdir cp mv rm dirname env sort; do \
        command -v "$utility" >/dev/null || exit 1; \
    done

RUN pip install --no-cache-dir \
        nibabel==5.4.2 \
        matplotlib==3.11.1 \
        numpy==2.5.2

RUN pip install --no-cache-dir torch torchvision --index-url https://download.pytorch.org/whl/cpu \
    && pip install --no-cache-dir hd-bet
