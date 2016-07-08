FROM golang:1.6.2-wheezy

ENV GLIDE_VERSION 0.11.0
ENV GLIDE_DOWNLOAD_URL https://github.com/Masterminds/glide/releases/download/$GLIDE_VERSION/glide-$GLIDE_VERSION-linux-amd64.tar.gz
ENV GLIDE_DOWNLOAD_SHA256 32daf53dc8c06bd2e5de319072a16678684fdba3540f967e672252b0995bc8be

ENV PATH $PATH:/usr/local/glide/linux-amd64

RUN curl -fsSL "$GLIDE_DOWNLOAD_URL" -o glide.tar.gz \
	&& echo "$GLIDE_DOWNLOAD_SHA256  glide.tar.gz" | sha256sum -c - \
	&& mkdir -p /usr/local/glide \
	&& tar -C /usr/local/glide -xzf glide.tar.gz \
	&& rm glide.tar.gz
