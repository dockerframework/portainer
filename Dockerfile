ARG TAG
FROM portainer/portainer-ce:${TAG:-2.6.3}-alpine

# ================================================================================================
#  Inspiration: Docker Framework (https://github.com/zeroc0d3/docker-framework)
#               Dwi Fahni Denni <zeroc0d3.0912@gmail.com>
# ================================================================================================
#  Core Contributors:
#   - Mahmoud Zalt @mahmoudz
#   - Bo-Yi Wu @appleboy
#   - Philippe Trépanier @philtrep
#   - Mike Erickson @mikeerickson
#   - Dwi Fahni Denni @zeroc0d3
#   - Thor Erik @thorerik
#   - Winfried van Loon @winfried-van-loon
#   - TJ Miller @sixlive
#   - Yu-Lung Shao (Allen) @bestlong
#   - Milan Urukalo @urukalo
#   - Vince Chu @vwchu
#   - Huadong Zuo @zuohuadong
# ================================================================================================

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="mahmoud@zalt.me" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="dockerframework-portainer" \
      org.label-schema.description="dockerframework-portainer image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Laradock Team" \
      org.label-schema.version="$BUILD_VERSION"

ENV PORTAINER_VERSION=2.6.3 \
    PORTAINER_HOME=/var/lib/portainer

RUN apk update && \
    apk upgrade && \
    apk add bash bind-tools ca-certificates curl jq tar; sync

RUN mkdir ${PORTAINER_HOME} && \
    addgroup -S portainer && \
    adduser -S -D -g "" -G portainer -s /bin/sh -h ${PORTAINER_HOME} portainer && \
    chown portainer:portainer ${PORTAINER_HOME}

RUN apk del tar 

CMD []

EXPOSE 9000
VOLUME ["/var/lib/portainer"]
