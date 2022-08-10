# Testing nvim config in archlinux

# I am using alpine because my config needs nvim-0.7+ which is not available on ubuntu/debian

FROM alpine
RUN apk add git wget curl g++ cmake fd ripgrep fzf neovim nodejs npm unzip go g++ cmake
RUN addgroup tux && adduser -D -G tux tux
USER tux
RUN mkdir -p /home/tux/.config/nvim
COPY --chown=tux:tux . /home/tux/.config/nvim/
