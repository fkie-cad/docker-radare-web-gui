FROM phusion/baseimage:jammy-1.0.3


WORKDIR /opt/app

COPY install.sh /opt/app/install.sh

RUN /opt/app/install.sh

WORKDIR /opt/app/fact_radare_viewer

CMD ["python3", "src/serve.py"]
