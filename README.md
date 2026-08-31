# oops-infra-v1

Shared local dev/test infrastructure and (later) Terraform for the Oops platform.

## Docker

Two Compose files, no application images inside — just the shared services other repos connect to.

### `docker/dev/compose.yaml`

Long-running local dev containers, shared by `oops-api-v1` and `oops-agent-v1`.

```bash
docker compose -f docker/dev/compose.yaml up -d
```

| Service  | Port |
|----------|------|
| postgres | 5432 |
| redis    | 6379 |

### `docker/test/compose.yaml`

Ephemeral, isolated containers for local test runs and CI parity.

```bash
docker compose -f docker/test/compose.yaml up -d --wait
```

| Service       | Port |
|---------------|------|
| postgres-test | 5433 |
| redis-test    | 6380 |

## Usage from a consuming repo

`oops-api-v1` (and later `oops-agent-v1`) reference these compose files as a sibling submodule, e.g. from `oops-api-v1/Makefile`:

```make
docker-up:
	docker compose -f ../oops-infra-v1/docker/dev/compose.yaml up -d
```

This requires cloning through the `oops-wiki-v1` workspace with submodules initialized:

```bash
git clone git@github.com:oopsla5xx/oops-wiki-v1.git
cd oops-wiki-v1
git submodule update --init
```

## Terraform

Not set up yet — added when a real AWS environment needs managing (see `oops-wiki-v1/.ai/decisions/0002-shared-local-infra-in-oops-infra.md`).
