#!/usr/bin/env bash
set -euo pipefail

REPO="trisetiohidayat/odoo-pre-sales-skill"
REF="main"
SKILL_NAME="odoo-pre-sales"
DEST_ROOT="${CODEX_HOME:-$HOME/.codex}/skills"
FORCE="0"

usage() {
  cat <<'USAGE'
Install the Odoo Pre-Sales Codex skill.

Options:
  --version, --ref <ref>   Git ref to install, such as main or v0.1.0.
  --dest <path>            Skills directory. Defaults to $CODEX_HOME/skills or ~/.codex/skills.
  --force                  Replace an existing odoo-pre-sales skill folder.
  -h, --help               Show help.

Examples:
  curl -fsSL https://raw.githubusercontent.com/trisetiohidayat/odoo-pre-sales-skill/main/install.sh | bash
  curl -fsSL https://raw.githubusercontent.com/trisetiohidayat/odoo-pre-sales-skill/main/install.sh | bash -s -- --version v0.1.0
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --version|--ref)
      REF="${2:-}"
      if [[ -z "$REF" ]]; then
        echo "Missing value for $1" >&2
        exit 1
      fi
      shift 2
      ;;
    --dest)
      DEST_ROOT="${2:-}"
      if [[ -z "$DEST_ROOT" ]]; then
        echo "Missing value for --dest" >&2
        exit 1
      fi
      shift 2
      ;;
    --force)
      FORCE="1"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

DEST="${DEST_ROOT%/}/${SKILL_NAME}"
TMP_DIR="$(mktemp -d)"
cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

copy_skill() {
  local source_dir="$1"
  if [[ ! -f "$source_dir/SKILL.md" ]]; then
    echo "Invalid skill source: $source_dir" >&2
    exit 1
  fi

  mkdir -p "$DEST_ROOT"
  if [[ -e "$DEST" ]]; then
    if [[ "$FORCE" != "1" ]]; then
      echo "Skill already exists: $DEST" >&2
      echo "Use --force to replace it." >&2
      exit 1
    fi
    rm -rf "$DEST"
  fi

  cp -R "$source_dir" "$DEST"
}

SCRIPT_PATH="$0"
SCRIPT_DIR=""
LOCAL_SKILL_DIR=""
if [[ "$SCRIPT_PATH" != "bash" && "$SCRIPT_PATH" != "sh" && -f "$SCRIPT_PATH" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
  LOCAL_SKILL_DIR="$SCRIPT_DIR/skills/$SKILL_NAME"
fi

if [[ -n "$LOCAL_SKILL_DIR" && -f "$LOCAL_SKILL_DIR/SKILL.md" ]]; then
  copy_skill "$LOCAL_SKILL_DIR"
else
  ARCHIVE_URL="https://github.com/${REPO}/archive/${REF}.tar.gz"
  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required for remote install." >&2
    exit 1
  fi
  curl -fsSL "$ARCHIVE_URL" | tar -xz -C "$TMP_DIR"
  EXTRACTED_DIR="$(find "$TMP_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  copy_skill "$EXTRACTED_DIR/skills/$SKILL_NAME"
fi

echo "Installed $SKILL_NAME to $DEST"
echo "Restart Codex to pick up the new skill."
