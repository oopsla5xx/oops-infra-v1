# oops-infra-v1

Shared local dev/test infrastructure and Terraform for the Oops platform. Cloned through the
`oops-wiki-v1` workspace (`git submodule update --init`), not standalone.

## Dev: Floci (AWS emulator)

`docker/dev/compose.yaml` runs [Floci](https://github.com/floci-io/floci), backing RDS PostgreSQL,
ElastiCache Redis, and S3 — mirrors production, which runs the real thing (see
[ADR-0003](../.ai/decisions/0003-floci-local-aws-emulation.md)). `terraform/local/` provisions the
actual instances against it.

From `oops-api-v1`, `make dev-up` does both steps. Manually:

```bash
docker compose -f docker/dev/compose.yaml up -d --wait   # start Floci
cd terraform/local && terraform init && terraform apply  # provision RDS/ElastiCache/S3
```

| Port | What |
|------|------|
| `4566` | AWS API edge |
| `7001-7099` | RDS proxy range |
| `6379` | ElastiCache proxy — narrowed to the one instance provisioned; widen if a second is added |

Endpoints are fixed (`localhost:7001`, `localhost:6379`) and already filled in in
`oops-api-v1/.env.example` — see ADR-0003 for why that's safe to hardcode here. Terraform state is
local-only, gitignored, never shared.

## Test: `docker/test/compose.yaml`

Plain, ephemeral Postgres/Redis (no Floci) — fast, isolated, matches CI.

```bash
docker compose -f docker/test/compose.yaml up -d --wait
```

| Service | Port |
|---------|------|
| postgres-test | 5433 |
| redis-test | 6380 |
