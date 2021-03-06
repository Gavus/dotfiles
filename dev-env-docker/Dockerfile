FROM alpine

USER root
RUN apk add --no-cache \
    wget \
    curl \
    clang \
    cmake \
    g++ \
    python3 \
    py3-pip \
    gdb

# nvim
RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -O /nvim.tgz && \
    tar -xf /nvim.tgz --strip 1 -C /usr

# rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN wget https://github.com/rust-analyzer/rust-analyzer/releases/download/2021-03-01/rust-analyzer-linux -O /usr/bin/rust-analyzer && chmod +x /usr/bin/rust-analyzer
