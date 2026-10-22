# strategic-advisor

[![CI](https://github.com/Azurioh/strategic-advisor/actions/workflows/ci.yml/badge.svg)](https://github.com/Azurioh/strategic-advisor/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A small collection of Claude skills. Each skill is a self-contained folder under `skills/<skill-name>/` with a single `SKILL.md`.

## Skills

| Skill | What it does |
|-------|--------------|
| [`strategic-advisor`](skills/strategic-advisor/SKILL.md) | Cold, candid auditor: deconstructs premises, detects avoidance, weighs opportunity cost, runs a pre-mortem, then gives a ranked execution plan. |

## Install

### Claude Code (plugin marketplace)

```
/plugin marketplace add Azurioh/claude-plugins
/plugin install strategic-advisor@azurioh-plugins
```

### Claude Code (manual)

Copy the skill folder into your personal skills directory:

```sh
mkdir -p ~/.claude/skills && cp -R skills/strategic-advisor ~/.claude/skills/
```

Or symlink it to keep it in sync with this repo:

```sh
mkdir -p ~/.claude/skills && ln -s "$PWD/skills/strategic-advisor" ~/.claude/skills/strategic-advisor
```

For a single project, use `<project>/.claude/skills/` instead.

### claude.ai

Zip the skill folder (the folder itself must be the zip root entry) and upload it in **Settings → Capabilities → Skills**:

```sh
cd skills && zip -r ../strategic-advisor.zip strategic-advisor
```

## Contributing

Issues and pull requests are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) and the [Code of Conduct](CODE_OF_CONDUCT.md) first. Report security problems as described in [SECURITY.md](SECURITY.md).

## License

[MIT](LICENSE)
