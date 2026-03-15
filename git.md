* **Files changed (audit-friendly list)**

  ```bash
  FIRST=$(git rev-list --max-parents=0 HEAD)
  git diff --name-status $FIRST..HEAD | sed 's/^/ - /'
  ```

* **Same list, but grouped into Added/Modified/Deleted**

  ```bash
  FIRST=$(git rev-list --max-parents=0 HEAD)
  git diff --name-status $FIRST..HEAD | awk '
  $1=="A"{a=a"\n  - "$2}
  $1=="M"{m=m"\n  - "$2}
  $1=="D"{d=d"\n  - "$2}
  END{
    print "ADDED:" a "\n\nMODIFIED:" m "\n\nDELETED:" d
  }'
  ```

* **What changed, in human summary form (line counts per file)**

  ```bash
  FIRST=$(git rev-list --max-parents=0 HEAD)
  git diff --stat $FIRST..HEAD
  ```

* **Audit-focused diff (hide noisy uploads / binaries)**

  ```bash
  FIRST=$(git rev-list --max-parents=0 HEAD)
  git diff $FIRST..HEAD -- . \
    ':(exclude)public/uploads' ':(exclude)public/uploads/**'
  ```

* **One-liner “what features you added” (commit-style summary from the diff)**

  ```bash
  FIRST=$(git rev-list --max-parents=0 HEAD)
  git diff --compact-summary $FIRST..HEAD
  ```

If you want the *best* auditor handout, run these two and paste the output here:

```bash
FIRST=$(git rev-list --max-parents=0 HEAD)
git diff --name-status $FIRST..HEAD
git diff --stat $FIRST..HEAD
```
