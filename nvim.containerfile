FROM docker.io/node:16.13.2-alpine3.15 as node
FROM docker.io/anatolelucet/neovim:0.6.1 as nvim

# Install nodejs
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

# Install various packages
RUN apk add --no-cache git gcompat

COPY .vimrc /root/.vimrc
COPY .vim/autoload /root/.vim/autoload
COPY .config/nvim /root/.config/nvim

# Install plugins and language servers
RUN nvim --headless -c PlugInstall -c qa
RUN nvim --headless -c "LspInstall --sync clangd pyright" -c qa
RUN rm -rf ~/.local/share/nvim/lsp_servers/clangd/clangd_13.0.0/lib ~/.local/share/nvim/lsp_servers/clangd/clangd_13.0.0/LICENSE.TXT

CMD ["/usr/local/bin/nvim"]
