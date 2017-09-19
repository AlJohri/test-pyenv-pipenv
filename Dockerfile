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

# echo the shell type in bashrc
RUN echo '[ "$0" = "-bash" ] && echo "login shell" || echo "non-login shell"' >> "$HOME/.bashrc"
RUN echo 'echo "$-" | grep -q "i" && echo "interactive shell" || echo "non-interactive shell"'  >> "$HOME/.bashrc"

# echo the shell type in zshrc
RUN echo '[[ -o login ]] && echo "login shell" || echo "non-login shell"' >> "$HOME/.zshrc"
RUN echo '[[ -o interactive ]] && echo "interactive shell" || echo "non-interactive shell"' >> "$HOME/.zshrc"

RUN mkdir -p "$HOME/.config/fish"
RUN echo 'status --is-login; and echo "login shell"; or echo "non-login shell"' >> "$HOME/.config/fish/config.fish"
RUN echo 'status --is-interactive; and echo "interactive shell"; or echo "non-interactive shell"' >> "$HOME/.config/fish/config.fish"

# setup pyenv for current shell
ENV PYENV_ROOT="$HOME/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"
ENV PATH="$PYENV_ROOT/shims:$PATH"

# setup pyenv for future shells (bash)
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME/.bashrc"
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME/.bashrc"
RUN echo 'eval "$(pyenv init -)"' >> "$HOME/.bashrc"

RUN pyenv install 3.6.2
RUN pyenv global 3.6.2
RUN python --version
RUN pip install --upgrade pip pipenv
RUN mkdir /app
WORKDIR /app
COPY Pipfile /app
COPY Pipfile.lock /app
RUN pipenv install
