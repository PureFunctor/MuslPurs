FROM alpine:3.14
RUN apk update
RUN apk add bash curl git
RUN mkdir -p /home/stack && cd /home/stack
RUN curl -sSL https://get.haskellstack.org/ | bash
ENV PATH="/root/.local/bin:${PATH}"
RUN stack update
RUN git clone https://github.com/purescript/purescript
RUN cd purescript-0.14.4 && git checkout v0.14.4 && stack install --flag purescript:RELEASE
ENTRYPOINT ["which", "purs"]
