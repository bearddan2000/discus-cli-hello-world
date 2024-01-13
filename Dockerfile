FROM ubuntu:18.04

ENV LC_ALL="en_US.UTF-8"

ENV PATH=/opt/ghc/8.6.3/bin:/opt/cabal/2.4/bin:$PATH

WORKDIR /workspace

RUN apt update

RUN apt install -y software-properties-common gcc git llvm locales && \
    add-apt-repository ppa:hvr/ghc && \
    apt-get update && \
    apt-get install -y ghc-8.6.3 cabal-install-2.4

RUN locale-gen $LC_ALL

RUN git clone https://github.com/discus-lang/ddc /opt/ddc

WORKDIR /opt/ddc

RUN make setup && make

COPY bin .

CMD "./run.sh"