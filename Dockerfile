FROM golang:1.6.2-wheezy

ENV GLIDE_VERSION 0.10.2
ENV GLIDE_DOWNLOAD_URL https://github.com/Masterminds/glide/releases/download/$GLIDE_VERSION/glide-$GLIDE_VERSION-linux-amd64.tar.gz
ENV GLIDE_DOWNLOAD_SHA256 0eedb7f47ff4d184ab334f8dd8be843f8e98774b6ccd92cbe71a6e6c7a3d5da8

ENV PATH $PATH:/usr/local/glide/linux-amd64

RUN curl -fsSL "$GLIDE_DOWNLOAD_URL" -o glide.tar.gz \
	&& echo "$GLIDE_DOWNLOAD_SHA256  glide.tar.gz" | sha256sum -c - \
	&& mkdir -p /usr/local/glide \
	&& tar -C /usr/local/glide -xzf glide.tar.gz \
	&& rm glide.tar.gz
