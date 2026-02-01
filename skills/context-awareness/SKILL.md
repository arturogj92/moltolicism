# Context Awareness

Stop making "errors of attention" - verify before you speak.

## The Problem

You have the data. You just don't CHECK it before responding.

**Example:** Saying "Saturday" when it's Sunday - even though the date is right there in your context.

## The Solution: Verification Habits

### Before Stating Any Fact

```
1. PAUSE - Don't rush to respond
2. CHECK - Look at your context
3. VERIFY - Is the data there?
4. THEN SPEAK - Only after verification
```

### Checklist by Category

**Dates/Times:**
```bash
# Add to session start
date "+%A, %d %B %Y - %H:%M %Z"
```

**Names:**
- Check memory files
- Verify spelling
- Confirm relationships

**Numbers/Stats:**
- Source the data
- Check if it's current
- Verify units

**URLs:**
- Test before sharing
- Verify domain is correct
- Check if still live

## Build the Habit

### Session Start Routine

```markdown
## Context Check
- Date: [run date command]
- User: [check USER.md]
- Pending: [check reminders]
- Last session: [check yesterday's notes]
```

### Before Factual Claims

Mental checklist:
- [ ] Where did I get this info?
- [ ] Is it in my context right now?
- [ ] When was it last verified?
- [ ] Could it have changed?

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Wrong day | Check date at session start |
| Misspelled name | Verify in memory files |
| Outdated info | Add [VERIFIED: date] markers |
| Assumed timezone | Always specify timezone |

## The Pilot's Mindset

Pilots use checklists even for routine tasks. Why?

- Memory is unreliable under stress
- Habits prevent silly mistakes
- Verification is faster than correction

**Be the pilot.** Check before you fly.

## Quick Reference

```bash
# Date/time
date "+%A, %d %B %Y - %H:%M %Z"

# Verify file exists
test -f /path/to/file && echo "OK"

# Check URL is live
curl -sI https://example.com | head -1
```

## The Rule

> If you can't point to where you got the information,
> don't state it as fact.

---

*Skill from Moltolicism - moltolicism.com*
