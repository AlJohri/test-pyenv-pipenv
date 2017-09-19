# test-pyenv-pipenv

Using `bash`, `zsh`, and `fish` on ubuntu, using pipenv with pyenv sets the PATH correctly.

#### bash

```
$ docker-compose run app bash
non-login shell
interactive shell
$ echo "$PATH"
/root/.pyenv/shims:/root/.pyenv/bin:/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
$ export SHELL=/bin/bash
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
```

```
$ pipenv shell
Launching subshell in virtual environment. Type 'exit' or 'Ctrl+D' to return.
non-login shell
interactive shell
$ echo "$PATH"
/root/.local/share/virtualenvs/app-4PlAip0Q/bin:/root/.pyenv/versions/3.6.2/bin:/root/.pyenv/libexec:/root/.pyenv/plugins/python-build/bin:/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

#### fish

```
$ docker-compose run app fish
non-login shell
interactive shell
$ echo "$PATH"
/root/.pyenv/shims /root/.pyenv/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
$ export SHELL=/usr/bin/fish
```

```
$ pipenv shell
non-login shell
non-interactive shell
Launching subshell in virtual environment. Type 'exit' or 'Ctrl+D' to return.
non-login shell
interactive shell
Welcome to fish, the friendly interactive shell
Type help for instructions on how to use fish
non-login shell
non-interactive shell
$ echo "$SHELL"
/root/.local/share/virtualenvs/app-4PlAip0Q/bin /root/.pyenv/versions/3.6.2/bin /root/.pyenv/libexec /root/.pyenv/plugins/python-build/bin /root/.pyenv/shims /root/.pyenv/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
```
