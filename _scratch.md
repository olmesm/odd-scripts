# Concurrently Shell

```bash
(trap 'kill 0' SIGINT; 
  (cd apps/api; SOME_SCRIPT.sh) & 
  (cd apps/backend; SOME_OTHER_SCRIPT.sh)
)
```
