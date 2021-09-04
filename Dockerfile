FROM alpine:3.14
RUN apk update
RUN apk add bash curl
RUN mkdir -p /home/stack && cd /home/stack
RUN curl -sSL https://get.haskellstack.org/ | bash
ENV PATH="/root/.local/bin:${PATH}"
RUN stack update
RUN stack unpack purescript
RUN cd purescript-0.14.4
RUN stack install --flag purescript:RELEASE
ENTRYPOINT ["which", "purescript"]
