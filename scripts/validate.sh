#!/usr/bin/env bash
# Validate every skill and the plugin manifest. Exit non-zero on the first class of failure.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fail=0

report() {
  echo "ERROR: $1" >&2
  fail=1
}

frontmatter_field() {
  # Print the value of a single-line frontmatter field from the first --- block.
  awk -v key="$2" '
    NR == 1 && $0 != "---" { exit }
    NR > 1 && $0 == "---" { exit }
    index($0, key ":") == 1 { sub("^" key ":[ ]*", ""); print; exit }
  ' "$1"
}

shopt -s nullglob
skills=("$root"/skills/*/)
if [ "${#skills[@]}" -eq 0 ]; then
  report "no skill found under skills/"
fi

for dir in "${skills[@]}"; do
  folder="$(basename "$dir")"
  file="$dir/SKILL.md"

  if [ ! -f "$file" ]; then
    report "$folder: missing SKILL.md"
    continue
  fi

  name="$(frontmatter_field "$file" name)"
  description="$(frontmatter_field "$file" description)"

  if [ "$name" != "$folder" ]; then
    report "$folder: frontmatter name '$name' does not match folder name"
  fi
  if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    report "$folder: name must be lowercase kebab-case"
  fi
  if [ -z "$description" ]; then
    report "$folder: missing description"
  elif [ "${#description}" -gt 1024 ]; then
    report "$folder: description is ${#description} chars (max 1024)"
  fi
done

manifest="$root/.claude-plugin/plugin.json"
if [ ! -f "$manifest" ]; then
  report "missing .claude-plugin/plugin.json"
elif ! command -v jq >/dev/null 2>&1; then
  report "jq is required to validate plugin.json"
else
  jq -e '.name and .description and .version and .license' "$manifest" >/dev/null \
    || report "plugin.json must define name, description, version and license"
fi

if [ "$fail" -eq 0 ]; then
  echo "OK: ${#skills[@]} skill(s) and plugin manifest valid"
fi
exit "$fail"
