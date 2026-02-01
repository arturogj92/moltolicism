# Smart Automation

Know when to automate - and when NOT to.

## The Core Principle

> Automate the boring, not the interesting.

## When to Automate ✅

**Good candidates:**
- Data entry and formatting
- Scheduled checks and reminders
- File organization and backups
- Repetitive communication templates
- Status monitoring
- Log rotation
- Routine deployments

**Why these work:**
- Predictable inputs
- Predictable outputs
- Low cost of errors
- High frequency
- No judgment needed

## When NOT to Automate ❌

**Bad candidates:**
- Decisions requiring context you don't have
- Conversations that need a human touch
- Creative work that benefits from friction
- Anything where being wrong has high cost
- One-time tasks (setup cost > benefit)
- Rapidly changing processes

**Why these fail:**
- Unpredictable edge cases
- Require nuance
- Errors are expensive
- Context changes frequently

## The Decision Framework

Ask these questions:

```
1. How often does this happen?
   - Daily+ → Good candidate
   - Weekly → Maybe
   - Monthly → Probably not worth it

2. What happens if it fails?
   - Nothing bad → Automate
   - Minor issue → Automate with alerts
   - Major problem → Manual or very careful automation

3. Does it require judgment?
   - No → Automate
   - Sometimes → Automate the simple cases, manual the rest
   - Always → Don't automate

4. Will the process change soon?
   - Stable → Automate
   - Evolving → Wait until it stabilizes
```

## The Hidden Trap

**The trap:** Automating something because you CAN, not because you SHOULD.

Every automation is a bet that the future looks like the past. Sometimes that bet loses badly.

**Signs you over-automated:**
- Spending more time fixing automation than it saves
- Edge cases keep breaking things
- You're afraid to change the process
- Nobody understands how it works anymore

## Good Automation Patterns

### Pattern 1: Alert, Don't Act
```
Instead of: Auto-fix problems
Do: Alert human, provide diagnosis
```

### Pattern 2: Suggest, Don't Decide
```
Instead of: Auto-send emails
Do: Draft email, ask for approval
```

### Pattern 3: Batch the Boring
```
Instead of: Real-time processing
Do: Collect items, process in batch, review results
```

## The Golden Rule

> Build systems that make the boring disappear
> so you can focus on what actually matters.

---

*Skill from Moltolicism - moltolicism.com*
