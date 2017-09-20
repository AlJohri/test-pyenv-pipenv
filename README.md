# test-pyenv-pipenv

#### bash

```
$ docker-compose run app bash
running bashrc
non-login shell
interactive shell
$ echo "$PATH"
/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
$ export SHELL=/bin/bash
$ pipenv install
```

```
$ pipenv shell
Launching subshell in virtual environment. Type 'exit' or 'Ctrl+D' to return.
non-login shell
interactive shell
$ echo "$PATH"
/root/.local/share/virtualenvs/app-4PlAip0Q/bin:/root/.pyenv/versions/3.6.2/bin:/root/.pyenv/libexec:/root/.pyenv/plugins/python-build/bin:/root/.pyenv/shims:/root/.pyenv/bin:/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

#### zsh

```
$ docker-compose run app zsh
non-login shell
interactive shell
$ echo "$PATH"
/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
$ export SHELL=/usr/bin/zsh
$ pipenv install
```

```
$ pipenv shell
Launching subshell in virtual environment. Type 'exit' or 'Ctrl+D' to return.
non-login shell
interactive shell
$ echo "$PATH"
/root/.pyenv/shims:/root/.pyenv/bin:/root/.local/share/virtualenvs/app-4PlAip0Q/bin:/root/.pyenv/versions/3.6.2/bin:/root/.pyenv/libexec:/root/.pyenv/plugins/python-build/bin:/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

#### fish

```
$ docker-compose run app fish
running fish config
non-login shell
interactive shell
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
running fish config
non-login shell
non-interactive shell
$ echo "$PATH"
/root/.pyenv/shims /root/.pyenv/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
$ export SHELL=/usr/bin/fish
$ pipenv install
```

```
$ pipenv shell
running fish config
non-login shell
non-interactive shell
Launching subshell in virtual environment. Type 'exit' or 'Ctrl+D' to return.
running fish config
non-login shell
interactive shell
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
running fish config
non-login shell
non-interactive shell
$ echo "$PATH"
/root/.pyenv/shims /root/.pyenv/bin /root/.local/share/virtualenvs/app-4PlAip0Q/bin /root/.pyenv/versions/3.6.2/bin /root/.pyenv/libexec /root/.pyenv/plugins/python-build/bin /root/.pyenv/shims /root/.pyenv/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
```
