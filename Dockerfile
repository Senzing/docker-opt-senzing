ARG BASE_IMAGE=debian:9
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-07-23

LABEL Name="senzing/opt-senzing" \
      Maintainer="support@senzing.com" \
      Version="1.1.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Run as "root" for system installation.

USER root

VOLUME /opt/senzing

# Install packages via apt.

RUN rm -rf /var/lib/apt/lists/*

# Copy files from repository.

ADD ./downloads/Senzing_API.tgz /opt/senzing

# Make non-root container.

USER 1001

# Runtime execution.

CMD ["/bin/bash"]
