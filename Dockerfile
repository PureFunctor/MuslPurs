FROM alpine:3.14
RUN apk update
RUN apk add bash curl git
RUN curl https://downloads.haskell.org/~ghc/8.10.4/ghc-8.10.4-x86_64-alpine3.10-linux-integer-simple.tar.xz -o ghc.tar.xz
RUN tar -xvf ghc.tar.xz && cp -a ghc-8.10.4-x86_64-unknown-linux/. /usr/local/ && rm -r ghc-8.10.4-x86_64-unknown-linux/
RUN ["which", "ghc"]
RUN ["ghc", "--version"]
# RUN curl -sSL https://get.haskellstack.org/ | bash
# ENV PATH="/root/.local/bin:${PATH}"
# RUN stack update
# RUN git clone https://github.com/purescript/purescript
# RUN cd purescript && git checkout v0.14.4 && stack install --flag purescript:RELEASE
# ENTRYPOINT ["which", "purs"]
