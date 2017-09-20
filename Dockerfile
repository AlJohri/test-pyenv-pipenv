FROM ubuntu
RUN apt-get update && apt-get install -y \
	git make build-essential libssl-dev zlib1g-dev libbz2-dev \
	libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
	xz-utils tk-dev \
	zsh fish

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
ENV HOME /root
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# setup bashrc
RUN echo 'echo "running bashrc"' >> "$HOME/.bashrc"
RUN echo '[ "$0" = "-bash" ] && echo "login shell" || echo "non-login shell"' >> "$HOME/.bashrc"
RUN echo 'echo "$-" | grep -q "i" && echo "interactive shell" || echo "non-interactive shell"'  >> "$HOME/.bashrc"
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.bashrc"
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.bashrc"
RUN echo 'eval "$(pyenv init -)"' >> "$HOME/.bashrc"

# setup zshrc
RUN echo 'echo "running zshrc"' >> "$HOME/.zshrc"
RUN echo '[[ -o login ]] && echo "login shell" || echo "non-login shell"' >> "$HOME/.zshrc"
RUN echo '[[ -o interactive ]] && echo "interactive shell" || echo "non-interactive shell"' >> "$HOME/.zshrc"
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.zshrc"
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.zshrc"
RUN echo 'eval "$(pyenv init -)"' >> "$HOME/.zshrc"

# setup fish
RUN mkdir -p "$HOME/.config/fish"
RUN echo 'echo "running fish config"' >> "$HOME/.config/fish/config.fish"
RUN echo 'status --is-login; and echo "login shell"; or echo "non-login shell"' >> "$HOME/.config/fish/config.fish"
RUN echo 'status --is-interactive; and echo "interactive shell"; or echo "non-interactive shell"' >> "$HOME/.config/fish/config.fish"
RUN echo 'set -gx PYENV_ROOT "$HOME/.pyenv"' >> "$HOME/.config/fish/config.fish"
RUN echo 'set -gx PATH "$PYENV_ROOT/bin" $PATH' >> "$HOME/.config/fish/config.fish"
RUN echo 'status --is-interactive; and . (pyenv init - | psub)' >> "$HOME/.config/fish/config.fish"

# install python via pyenv
RUN "$HOME/.pyenv/bin/pyenv" install 3.6.2
RUN "$HOME/.pyenv/bin/pyenv" global 3.6.2
RUN "$HOME/.pyenv/versions/3.6.2/bin/python" --version
RUN "$HOME/.pyenv/versions/3.6.2/bin/pip" install --upgrade pip pipenv

RUN mkdir /app
WORKDIR /app
COPY Pipfile /app
COPY Pipfile.lock /app
