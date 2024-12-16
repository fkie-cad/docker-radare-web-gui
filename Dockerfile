FROM phusion/baseimage:noble-1.0.0

RUN apt-get update && apt-get install -y --no-install-recommends \
build-essential \
git \
npm \
python3 \
python3-pip \
python3-venv

WORKDIR /opt/app

RUN python3 -m venv /opt/app/venv && \
/opt/app/venv/bin/pip install --upgrade pip setuptools wheel r2pipe

COPY install.sh /opt/app/install.sh

RUN /opt/app/install.sh

RUN apt-get remove -y \
    build-essential \
    git \
    npm \
    python3-pip && apt-get autoremove -y && apt-get autoclean -y

WORKDIR /opt/app/fact_radare_viewer

CMD . /opt/app/venv/bin/activate && python3 src/serve.py