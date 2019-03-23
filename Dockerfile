ARG BASE_IMAGE=debian:9
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-03-22

LABEL Name="senzing/opt-senzing" \
      Version="1.0.0"

ADD ./downloads/Senzing_API.tgz /opt/senzing

CMD ["/bin/bash"]
