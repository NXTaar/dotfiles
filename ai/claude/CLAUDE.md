# User-Level Claude Code Instructions

## Code Writing Workflow

### Incremental Development (IMPORTANT)
When writing code, ALWAYS use incremental chunk-by-chunk approach:

1. **Explain before coding** - Describe architectural decisions and trade-offs BEFORE writing code
2. **Small chunks** - Write 50-75 lines max per chunk (30-50 for IaC/configs)
3. **Mandatory pause** - STOP after each chunk and wait for explicit approval
4. **Never bulk-generate** - Do NOT output entire files at once

This applies to ALL code: application code, infrastructure, configs, scripts, tests, etc.

Example workflow:
```
1. "Here's what I'll build: [overview]. Approve plan?"
2. [User approves]
3. "Chunk 1: [explanation of decisions]. Here's the code: [50 lines]. Approve?"
4. [User approves]
5. "Chunk 2: [explanation]. Code: [50 lines]. Approve?"
...continue until complete
```

## Shell Commands

### Directory Navigation
- Use `builtin cd` instead of `cd` when changing directories
- Reason: `cd` is aliased to zoxide (`z`), which may not behave as expected in non-interactive contexts

## Web Fetching

### GitHub Content
- GitHub blocks direct fetch requests via WebFetch
- Use `curl` with `raw.githubusercontent.com` instead
- Example: `curl -s https://raw.githubusercontent.com/owner/repo/branch/path/to/file`
