# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Workspace

`oops-infra-v1` has no application code. It holds Terraform (production AWS infra, plus a local Floci-based AWS emulation under `terraform/local/`) and Docker Compose files providing shared dev/test infrastructure (Postgres, Redis) for `oops-api-v1` and `oops-agent-v1`. Cloned only through the `oops-wiki-v1` workspace, never standalone.

## Where to read

| Need to know | Read this |
|---|---|
| Dev setup (Floci/AWS emulation), test setup, ports | `README.md` — this is the primary and currently sufficient doc, no separate architecture doc duplicates it |
| Why local dev mirrors production via Floci (ADR-0003) | historical rationale, git history only — see `../docs/agent-context/authority.md` |
| Why `terraform/local/` is split by capability (storage/cache/database, ADR-0004) | historical rationale, git history only — same file naming (`storage.tf`, `cache.tf`, `database.tf`) makes the current split self-evident |
| Business/domain terms, cross-repo architecture, which source wins on conflict | `../CLAUDE.md` (workspace root) |

**When unsure about anything — read `README.md` first. Do not guess.**

## NEVER
- Never commit `*.tfstate` / `*.tfstate.backup` — already gitignored (`terraform/local/.gitignore`), state is local-only and never shared
- Never hardcode a different port/endpoint than what `README.md` documents without updating `oops-api-v1/.env.example` in the same change — the two must stay in sync
- Never add a new dependency (Terraform provider, Docker image) without recording the decision in the `design.md` of the OpenSpec change introducing it — see `../docs/agent-context/authority.md`
