# strategic-advisor

A small collection of Claude skills. Each skill is a self-contained folder under `skills/<skill-name>/` with a single `SKILL.md`.

## Skills

| Skill | What it does |
|-------|--------------|
| [`strategic-advisor`](skills/strategic-advisor/SKILL.md) | Cold, candid auditor: deconstructs premises, detects avoidance, weighs opportunity cost, runs a pre-mortem, then gives a ranked execution plan. |

## Install

### Claude Code

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
