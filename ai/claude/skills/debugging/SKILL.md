---
name: debugging
description: Systematic debugging using hypothesis-driven root cause analysis and parallel investigation. Use when tests fail, errors occur, unexpected behavior happens, or user says "debug", "fix", "investigate", "why is this failing". Employs evidence-based debugging with differential analysis.
---

# Debugging

Systematic root cause analysis through parallel investigation, hypothesis testing, and evidence gathering.

## When to Activate

- Test failures during development
- Runtime errors or exceptions
- Unexpected behavior reported
- Performance degradation detected
- User asks to debug, investigate, or fix an issue

## Process

### 1. Symptom Capture

Gather complete error context before forming hypotheses:

```
- Error message (exact text)
- Stack trace (relevant frames)
- Reproduction steps (minimal case)
- Environment state (versions, config)
- Recent changes (git diff HEAD~5)
- What was expected vs what happened
```

### 2. Form Hypotheses

Apply the **Five Whys with Evidence Links**:

```
Why did [symptom]? → Because [cause 1] (Evidence: [log line/trace])
Why did [cause 1]? → Because [cause 2] (Evidence: [specific proof])
...continue until root cause
```

Rank hypotheses by:
- Evidence strength (strong, weak, circumstantial)
- Likelihood based on patterns
- Fix complexity

### 3. Parallel Investigation

Spawn specialized agents for different analysis angles:

**Code Analysis Path:**
- Static analysis of changed code
- Control flow tracing
- Type/null safety issues
- Async/await patterns

**Context Analysis Path:**
- Environment differences
- Dependency version mismatches
- Configuration drift
- External service state

**Historical Analysis Path:**
- Git blame on affected lines
- Similar past issues in codebase
- Recent commits to affected area

### 4. Differential Analysis

Compare working vs broken states:
- Before/after code diff
- Working environment vs failing environment
- Expected vs actual data flow

### 5. Fix Implementation

For the top hypothesis:

1. **Create minimal reproduction** - Isolate the failing case
2. **Write failing test** - Capture the bug before fixing
3. **Implement fix** - Targeted correction
4. **Verify fix** - Test passes, no regressions
5. **Document** - What broke and why

## Output Format

```markdown
## Debug Report: [Issue Summary]

### Symptom
[Error message / observed behavior]

### Root Cause
[Identified cause with supporting evidence]

### Investigation Path
| Hypothesis | Evidence | Result |
|------------|----------|--------|
| [Theory 1] | [Proof]  | [Confirmed/Rejected] |
| [Theory 2] | [Proof]  | [Confirmed/Rejected] |

### Fix Applied
[Description with code reference]

### Verification
- [ ] Original error no longer occurs
- [ ] Failing test now passes
- [ ] Related tests still pass
- [ ] No new warnings/errors

### Prevention
[How to prevent recurrence - test, monitoring, etc.]
```

## Agent Dispatch Templates

### Code Analysis Agent
```
Analyze this error for potential root causes:

## Error
[stack trace / error message]

## Changed Files
[git diff output]

## Focus Areas
1. Type mismatches and null handling
2. Async/await and promise issues
3. State mutation and race conditions
4. Edge case handling

Provide top 3 hypotheses ranked by likelihood with evidence.
```

### Historical Analysis Agent
```
Search for similar issues in codebase history:

## Error Pattern
[error signature / affected code area]

## Tasks
1. Git log for changes to affected files
2. Search for similar error patterns
3. Check for previously fixed related bugs
4. Review comments mentioning this area

Report findings that inform the current issue.
```

## Common Bug Patterns

| Pattern | Symptoms | Investigation |
|---------|----------|---------------|
| Null/undefined | TypeError, "cannot read property" | Check optional chaining, default values |
| Race condition | Intermittent failures | Review async operations, add logging |
| State mutation | Inconsistent UI, stale data | Check immutability, reference equality |
| Type mismatch | Unexpected behavior | Verify types at boundaries |
| Off-by-one | Loop errors, array bounds | Review iteration logic |

## Collaboration

- After fix is verified, return to **developing** skill to continue tasks
- If fix is complex, invoke **planning** skill to break down the fix
- Before marking complete, invoke **verifying** skill for full validation
