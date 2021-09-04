FROM alpine:3.14
RUN apk update
RUN apk add bash curl
RUN mkdir -p /home/stack && cd /home/stack
RUN curl -sSL https://get.haskellstack.org/ | bash
ENV PATH="/home/stack/.local/bin:${PATH}"
RUN stack update
ENTRYPOINT ["/bin/bash"]
