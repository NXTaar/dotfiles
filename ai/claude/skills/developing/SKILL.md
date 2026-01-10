---
name: developing
description: Executes implementation plans using subagent-driven development with code review checkpoints. Use when plan is ready, user says "implement", "develop", "build", "execute the plan", "start coding". Dispatches specialized agents for each task with validation between steps.
---

# Developing

Execute implementation plans through coordinated subagent dispatch with code review and verification checkpoints.

## When to Activate

- Implementation plan is approved
- User says "start implementing", "build it", "execute the plan"
- Ready to write code after planning phase
- Resuming development from previous session

## Process

### 1. Session Startup Protocol

Check for existing progress:
```
1. Look for claude-progress.json
2. If exists: Review state, identify next task
3. If new: Initialize progress tracking
4. Run quick smoke test on existing code
5. Load relevant context from completed tasks
```

### 2. Load the Plan

Retrieve or confirm the implementation plan:
- List all tasks with dependencies
- Identify current task to execute
- Check for blockers from previous sessions

### 3. Select Appropriate Agent

Match task type to specialized agent:

| Task Type | Agent | Use For |
|-----------|-------|---------|
| Backend API | backend-developer | REST endpoints, services |
| Database | database-administrator | Schema, migrations, queries |
| Frontend UI | frontend-developer | Pages, layouts, styling |
| React | react-specialist | Components, hooks, state |
| TypeScript | typescript-pro | Types, complex TS patterns |
| Testing | qa-expert | Test cases, coverage |
| Refactoring | refactoring-specialist | Code restructuring |
| Security | security-engineer | Auth, validation |
| Architecture | architect-reviewer | Design validation |

### 4. Execute Task Loop

For each task:

```
1. Update progress: Mark task IN_PROGRESS
2. Spawn task agent with context
3. Agent implements task
4. Run verification gate
5. Code review checkpoint
6. If passes: Mark COMPLETE, update progress
7. If fails: Route to debugging or fix
8. Proceed to next task
```

### 5. Progress Tracking

Maintain `claude-progress.json`:

```json
{
  "feature": "feature-name",
  "plan_file": "path/to/plan.md",
  "status": "in_progress",
  "current_task": 3,
  "tasks": [
    {"id": 1, "status": "complete", "agent": "backend-developer", "commit": "abc123"},
    {"id": 2, "status": "complete", "agent": "database-administrator", "commit": "def456"},
    {"id": 3, "status": "in_progress", "agent": "frontend-developer"},
    {"id": 4, "status": "pending"}
  ],
  "blockers": [],
  "last_session": {
    "ended": "2025-01-11T15:30:00Z",
    "notes": "Task 3 in progress, auth context from task 1 needed"
  }
}
```

### 6. Code Review Checkpoint

After each task:

1. **Spawn code-reviewer agent** on modified files
2. **Check for issues:** Security, quality, patterns
3. **Run verification commands** from plan
4. **Decision point:**
   - APPROVED → Mark complete, proceed
   - CHANGES_NEEDED → Fix issues, re-review

## Agent Dispatch Template

```markdown
You are implementing Task [N] of [Total] for [Feature].

## Task
[Description from plan]

## Prior Work
Tasks 1-[N-1] are complete. Key outcomes:
- [Relevant files created/modified]
- [Important context from completed tasks]

## Your Deliverables
1. [Specific output 1]
2. [Specific output 2]

## Files
- Create: [new files]
- Modify: [existing files]

## Patterns to Follow
- Reference: [path/to/similar/code]
- Convention: [specific patterns]

## Verification (MUST pass before complete)
- [ ] [Verification command 1]
- [ ] [Verification command 2]

## Constraints
- Do NOT modify: [protected files]
- Do NOT: [specific restrictions]

Report BLOCKED if you encounter issues requiring human decision.
```

## Code Review Template

```markdown
Review changes for Task [N]:

## Changed Files
[git diff --name-only output]

## Review Focus
- [ ] No hardcoded secrets or credentials
- [ ] Error handling covers edge cases
- [ ] Follows existing code patterns
- [ ] Test coverage adequate
- [ ] No obvious performance issues
- [ ] Documentation updated if needed

## Questions
1. Does this match the task requirements?
2. Are there any security concerns?
3. Is the code maintainable?

Respond: APPROVED | CHANGES_NEEDED: [specific issues]
```

## Handling Issues

**If verification fails:**
1. Check if it's a quick fix (< 5 min)
2. If quick: Fix inline and re-verify
3. If complex: Invoke **debugging** skill

**If blocked:**
1. Document the blocker clearly
2. Note what information is needed
3. Mark task as BLOCKED in progress
4. Ask user for guidance

**If scope creep detected:**
1. Note the new requirement
2. Do NOT implement it in current task
3. Suggest adding to plan as new task

## Commit Conventions

After each task completion:
```bash
git add [changed files]
git commit -m "feat([feature]): [task description]

Task [N]/[Total] of [Feature] implementation.
- [Change 1]
- [Change 2]

Co-Authored-By: Claude <noreply@anthropic.com>"
```

## Collaboration

- If issues arise → Invoke **debugging** skill
- After all tasks complete → Invoke **verifying** skill
- If requirements change → Return to **brainstorming**
- If plan needs revision → Return to **planning**
