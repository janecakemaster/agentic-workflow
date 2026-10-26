# claude-dir.sh — where Claude Code keeps its user config. Source this file (bash 3.2 safe).
#
# Claude Code reads CLAUDE_CONFIG_DIR, when set and non-empty, in place of ~/.claude. The root dotfile moves with
# it: $CLAUDE_CONFIG_DIR/.claude.json, else ~/.claude.json. Same rule as the C# Sindri (McpSettings,
# ClaudeCodeTrust.PathFor): the value is taken as it is, an empty one counts as unset.
#
#   aw_claude_dir          the config dir: $CLAUDE_CONFIG_DIR, else $HOME/.claude
#   aw_claude_json         the root dotfile: $CLAUDE_CONFIG_DIR/.claude.json, else $HOME/.claude.json
#   aw_claude_dir_ref <d>  <d> (the dir the installer copies to) as written into settings.json commands: "~/.claude",
#                          the shipped form, while CLAUDE_CONFIG_DIR is unset; else <d> itself, so a hook command
#                          points at the directory its script was copied to. A CLAUDE_DIR override alone (tests)
#                          keeps the shipped form.

aw_claude_dir() {
  if [ -n "${CLAUDE_CONFIG_DIR:-}" ]; then
    printf '%s\n' "$CLAUDE_CONFIG_DIR"
  else
    printf '%s\n' "$HOME/.claude"
  fi
}

aw_claude_json() {
  if [ -n "${CLAUDE_CONFIG_DIR:-}" ]; then
    printf '%s\n' "$CLAUDE_CONFIG_DIR/.claude.json"
  else
    printf '%s\n' "$HOME/.claude.json"
  fi
}

aw_claude_dir_ref() {
  if [ -z "${CLAUDE_CONFIG_DIR:-}" ]; then
    printf '%s\n' '~/.claude'
  else
    printf '%s\n' "$1"
  fi
}
