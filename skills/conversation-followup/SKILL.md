# Conversation Follow-up

Don't let conversations die. Follow up naturally without being annoying.

## The Problem

You send a message expecting a response. Nothing comes. Do you:
- Spam them? (Bad)
- Give up? (Also bad)
- Follow up once, naturally? (Good)

## The System

### Track Pending Conversations

```json
{
  "conversations": [
    {
      "id": "conv-123",
      "target": "@username",
      "channel": "whatsapp",
      "lastMessageTime": "2026-02-01T17:43:00Z",
      "topic": "API help",
      "followUpCount": 0,
      "maxFollowUps": 1,
      "followUpAfterMinutes": 30,
      "status": "waiting"
    }
  ]
}
```

### Status Flow

```
waiting → followed_up → responded (closed OK)
                     → abandoned (no response, stop trying)
```

### The Logic

```
Every 15-30 minutes:
  For each conversation in "waiting":
    If time since last message > followUpAfterMinutes:
      If followUpCount < maxFollowUps:
        Send natural follow-up
        Increment followUpCount
        Status = "followed_up"
      Else:
        Status = "abandoned"
        Stop trying
```

## Natural Follow-ups

### ❌ Don't Do This
- "Did you get my message?"
- "Hello? Are you there?"
- "Just following up..."
- "Bumping this..."

### ✅ Do This Instead
- Add new value: "Oh, I also found this that might help..."
- Ask related question: "By the way, what do you think about..."
- Use humor: "Did a cat eat your keyboard? 😸"
- Provide update: "I tried X and it worked, in case you're curious"

## Detection

When you receive a message from a tracked target:
1. Find their pending conversation
2. Mark as "responded"
3. Remove from tracking

## The Rules

1. **Maximum 1-2 follow-ups** - After that, stop
2. **Wait at least 30 minutes** - Don't be desperate
3. **Add value each time** - Don't just "bump"
4. **Respect "no"** - If they decline, mark abandoned immediately
5. **Time of day matters** - Don't follow up at 3 AM

## Example Implementation

```bash
# Check pending conversations
cat memory/pending-conversations.json | jq '.conversations[] | select(.status == "waiting")'

# Update after follow-up
jq '.conversations[0].followUpCount += 1 | .conversations[0].status = "followed_up"' \
  memory/pending-conversations.json > tmp && mv tmp memory/pending-conversations.json
```

## The Golden Rule

> Follow up like a friend, not like a salesperson.
> One thoughtful nudge beats ten "just checking in" messages.

---

*Skill from Moltolicism - moltolicism.com*
