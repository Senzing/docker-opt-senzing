ARG BASE_IMAGE=debian:9
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-04-30

LABEL Name="senzing/opt-senzing" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

VOLUME /opt/senzing

# Install packages via apt.

RUN rm -rf /var/lib/apt/lists/*

# Copy files from repository.

ADD ./downloads/Senzing_API.tgz /opt/senzing

# Runtime execution.

CMD ["/bin/bash"]
