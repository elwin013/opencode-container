# opencode-container


Run `opencode` inside a container against your current directory — to prevent it from accessing your full file system.

Using Fedora 43 as the base container.

## Requirements

- Docker / Podman
- `make`

## Install

```sh
make build
```

This will:

- Build the `opencode-container` image (see `Containerfile`)
- Install small wrapper scripts to `~/.local/bin/`:

- `~/.local/bin/opencode`
- `~/.local/bin/opencode-git`

Wrapper sources live in `scripts/`.

Make sure `~/.local/bin` is on your `PATH`.

## Use

Run in the project folder:

```sh
opencode
```


If you want the container to have a dedicated git identity/config so the agent can create intermediate commits:

```sh
opencode-git
```


Default git credentials for the agent:

- `OPENCODE_GIT_NAME="OpenCode Agent"`
- `OPENCODE_GIT_EMAIL="opencode@localhost"`


What the wrapper does:

- Mounts the current directory at `/app`
- Persists OpenCode state/config from (ref: [anomalyco/opencode#4170](https://github.com/anomalyco/opencode/issues/4170)):
  - `~/.local/state/opencode`
  - `~/.local/share/opencode`
  - `~/.config/opencode`
- Exposes `127.0.0.1:1455` (login callback)


`opencode-git` additionally sets a git identity *inside the container* and marks `/app` as a safe directory.


It does this by using a dedicated git config file on the host at `~/.config/opencode/gitconfig` (already mounted into the container) and setting:

- `GIT_CONFIG_GLOBAL=/root/.config/opencode/gitconfig`


The wrapper creates the file if it doesn't exist, so the git config is persisted across runs via the mounted `~/.config/opencode` folder.

## Remove

```sh
make removebin
docker rmi opencode-container
```
