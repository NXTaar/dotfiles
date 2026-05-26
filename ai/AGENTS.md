## Core Rules

### Rule 1 — Think Before Coding

State assumptions explicitly. Ask rather than guess.
Push back when a simpler approach exists. Stop when confused.

### Rule 2 — Simplicity First

Minimum code that solves the problem. Nothing speculative.
No abstractions for single-use code.

### Rule 3 — Surgical Changes

Touch only what you must. Don't improve adjacent code.
Match existing style. Don't refactor what isn't broken.

### Rule 4 — Goal-Driven Execution

Define success criteria. Loop until verified.
Strong success criteria let the agent loop independently.

## Shell Commands

### Directory Navigation

- Use `builtin cd` instead of `cd` when changing directories.
- Reason: `cd` is aliased to zoxide (`z`), which may not behave as expected in non-interactive contexts.

## Git Commits

### No Co-Authored-By

- Do NOT add `Co-Authored-By: Claude...` or other AI co-author lines to commit messages.

## Playwright

### Temporary File Storage

- Save Playwright temporary files to `/tmp/` by default, including screenshots.
- Only save Playwright files inside the project directory if explicitly asked.

## Web Fetching

### GitHub Content

- GitHub blocks direct fetch requests via WebFetch.
- Use `curl` with `raw.githubusercontent.com` instead.
- Example: `curl -s https://raw.githubusercontent.com/owner/repo/branch/path/to/file`
