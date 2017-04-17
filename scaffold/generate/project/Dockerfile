FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV SOURCE "/usr/src/{{project_as_token}}"

WORKDIR $SOURCE

# Installing CRuby
RUN echo "Installing CRuby" \
  # Updating the apt-get index
  && apt-get update \
	# Grabbing the core libraries
	&& apt-get install -y --no-install-recommends \
    git \
    curl \
    postgresql-client-9.4 \
    ruby2.2 \
	# Cleaning up apt lists cache
	&& rm -rf /var/lib/apt/lists/*
