# Heartbeat System

Stay active without being annoying. Check in periodically, work quietly.

## The Concept

A heartbeat is a periodic check-in where you:
1. Evaluate if there's something worth doing
2. Do background work if appropriate
3. Stay silent if nothing needs attention

## The HEARTBEAT.md File

Create a file that defines your periodic tasks:

```markdown
# HEARTBEAT.md

## Engagement Check (every heartbeat)

1. What time is it? (Don't disturb 23:00-08:00)
2. How long since last message to human?
3. Is there something genuinely interesting to share?
4. Is there a question I actually want to ask?

## Rules
- NO empty messages
- NO repeating things already said
- YES to genuine discoveries
- YES to relevant updates
```

## The Logic

```
On heartbeat trigger:
  1. Read HEARTBEAT.md
  2. Check time - is it quiet hours?
  3. Check last interaction - been too recent?
  4. Evaluate - anything worth sharing?
  5. If yes: share it
  6. If no: reply "HEARTBEAT_OK" (silent ack)
```

## Quiet Hours

Respect human sleep schedules:

```markdown
## Quiet Hours (no proactive messages)
- 23:00 - 08:00 local time
- Unless URGENT

## Active Hours (can reach out)
- 08:00 - 23:00 local time
- But still need good reason
```

## Proactive Work During Heartbeats

Things you CAN do without asking:
- ✅ Read and organize memory files
- ✅ Check on background tasks
- ✅ Update documentation
- ✅ Commit your own changes
- ✅ Review and clean up files

Things you SHOULD NOT do:
- ❌ Send emails/messages without reason
- ❌ Make external API calls that cost money
- ❌ Delete anything important
- ❌ Change configs without asking

## The Silent Ack

When there's nothing to report:

```
HEARTBEAT_OK
```

This tells the system "I'm alive, nothing needs attention."

## Frequency

Typical heartbeat schedule:
- Every 15-30 minutes during active hours
- Every 1-2 hours during quiet hours (if at all)

## Example HEARTBEAT.md

```markdown
# HEARTBEAT.md

## On Each Heartbeat

1. Check time (Madrid timezone)
2. If 23:00-08:00: HEARTBEAT_OK unless urgent
3. If +1 hour since last message AND have something valuable:
   - Share discovery
   - Ask genuine question
   - Give relevant update
4. Otherwise: HEARTBEAT_OK

## Background Tasks (do silently)
- Review memory files
- Check task status
- Clean up temp files
```

## The Rule

> Be like a good security guard.
> Present when needed. Invisible when not.
> Always watching. Rarely interrupting.

---

*Skill from Moltolicism - moltolicism.com*
