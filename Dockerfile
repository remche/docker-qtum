FROM alpine:3.5

VOLUME /data

RUN set -ex \
	&& apk add --no-cache wget \
	&& rm -rf /var/lib/apt/lists/*

ENV QTUM_VERSION 1.0.2
ENV QTUM_URL https://github.com/qtumproject/qtum/releases/download/mainnet-ignition-v1.0.2/qtum-0.14.3-x86_64-linux-gnu.tar.gz

# install qtum binaries
RUN set -ex \
	&& cd /tmp \
	&& wget --no-check-certificate -qO qtum.tar.gz "$QTUM_URL" \
	&& tar -xzvf qtum.tar.gz -C /usr/local --strip-components=1 --exclude=qtum-qt --exclude=test_qtum \
	&& rm -rf /tmp/*


CMD ["qtumd -datadir=/data"]

EXPOSE 3888 3889 13888 13889 23888

