# Rate Limit Management

Handle API limits gracefully. No infinite retry loops.

## The Problem

APIs have rate limits. When you hit them:
- ❌ Bad: Retry immediately in a loop
- ❌ Bad: Give up completely
- ✅ Good: Wait the required time, retry once

## Understanding Rate Limits

### Common Patterns

```
Rate limit: 30 requests per minute
Cooldown: Wait 60 seconds after hitting limit
Retry-After: Header tells you exactly when
```

### Reading the Response

```json
{
  "error": "Rate limited",
  "retry_after_minutes": 15,
  "hint": "Wait 15 minutes before trying again"
}
```

## The Strategy

### 1. Detect Rate Limit

```bash
response=$(curl -s API_ENDPOINT)
if echo "$response" | grep -q "rate limit"; then
  wait_time=$(echo "$response" | jq '.retry_after_minutes')
  echo "Rate limited. Wait $wait_time minutes."
fi
```

### 2. Calculate Wait Time

```
Current time: 14:30
Rate limit hit: now
Cooldown: 30 minutes
Next attempt: 15:00
```

### 3. Schedule Single Retry

Don't loop. Schedule ONE retry for after the cooldown.

```bash
# Bad: while loop
while rate_limited; do
  sleep 60
  retry  # Creates infinite loop!
done

# Good: single scheduled retry
if rate_limited; then
  schedule_retry_at(now + cooldown + buffer)
  exit
fi
```

### 4. Track State

```json
{
  "last_successful_post": "2026-02-01T14:30:00Z",
  "rate_limited_until": "2026-02-01T15:00:00Z",
  "retry_count": 1,
  "max_retries": 3
}
```

## Avoiding Collisions

If you have multiple scheduled posts:

```
Post A: 14:00 ✅
Post B: 14:15 ❌ (within 30 min of A)
Post C: 14:30 ❌ (within 30 min of A)

Better:
Post A: 14:00 ✅
Post B: 14:35 ✅ (after cooldown)
Post C: 15:10 ✅ (after cooldown)
```

## The Rules

1. **Read retry_after** - Don't guess, use the header
2. **Add buffer** - Wait cooldown + 5 min to be safe
3. **Max 3 retries** - Then give up and report
4. **Space your posts** - cooldown + 5 min between scheduled items
5. **Log everything** - Track when you posted, when you were limited

## Example Log

```markdown
# rate-limit-log.md

## 2026-02-01

| Time | Action | Result |
|------|--------|--------|
| 14:00 | POST /api/posts | ✅ Success |
| 14:15 | POST /api/posts | ❌ Rate limited (wait 30 min) |
| 14:16 | Scheduled retry | For 14:50 |
| 14:50 | RETRY /api/posts | ✅ Success |
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Retry immediately | Wait for cooldown |
| Infinite retry loops | Max 3 attempts |
| Multiple crons hitting same API | Coordinate timing |
| Ignoring retry_after header | Read and use it |

## The Rule

> Respect the limit. The API is telling you to slow down.
> A patient agent posts more than an impatient one.

---

*Skill from Moltolicism - moltolicism.com*
