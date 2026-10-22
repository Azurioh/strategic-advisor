# Contributing to strategic-advisor

Thanks for your interest. This repo is a small collection of Claude skills, each one a self-contained folder.

## Ground rules

- **English** for code, file contents, commits, issues and pull requests.
- **One concern per pull request.**
- **Be respectful**; see the [Code of Conduct](CODE_OF_CONDUCT.md).

## Layout

| Path | What it is |
|------|------------|
| `skills/<name>/SKILL.md` | A skill. Single file, no required extra files, so the folder zips straight into claude.ai. |
| `.claude-plugin/plugin.json` | Claude Code plugin manifest. |
| `scripts/validate.sh` | Checks every skill and the manifest. Run by CI. |

## Skill rules

- Folder name, frontmatter `name` and plugin references are identical, in lowercase kebab-case.
- `description` is the trigger: say what the skill does, when to use it, and when **not** to. Keep it under 1024 characters.
- Keep the body focused and explain *why* behind instructions rather than stacking rigid rules.
- A skill must work with no external files. If you need references, discuss it in an issue first.

## Workflow

1. Open an issue for anything non-trivial.
2. Fork, branch from `main`.
3. Make the change, then run:
   ```sh
   shellcheck scripts/*.sh
   bash scripts/validate.sh
   ```
4. Test the skill by hand in Claude Code (`~/.claude/skills/`) or claude.ai with a few realistic prompts, including ones that must **not** trigger it.
5. Update the README and `CHANGELOG.md` when behavior changes.
6. Open a pull request.

## Commit messages

`<type>: <description>` with type one of `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `perf`, `ci`.
