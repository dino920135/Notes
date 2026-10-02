- #Git #Logseq #[[Dev/Git]]
- {{renderer :tocgen2}}
- ## Problem
	- The Notes repo's `.git` folder grew to **281 MB**, but the actual content (all `main` history + `gh-pages` site) was only ~57 MB compressed
	- Since the repo lives in OneDrive, the whole `.git` folder gets synced too
- ## Cause
	- **Logseq publish replaces `gh-pages` each time** with a new single commit, so old versions of the published site pile up locally as unreachable objects
	- **Packs never consolidated**: 10 separate pack files + 372 loose objects
	- The 48 unused images in `assets/` were only ~5 MB, so they weren't the main problem
- ## Check repo size
	- ```bash
	  du -sh .git
	  git count-objects -vH   # size-pack = packed size, count = loose objects
	  ```
	- Find the biggest files in history
	  ```bash
	  git rev-list --objects --all \
	    | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
	    | awk '$1=="blob"' | sort -k3 -n -r | head -20
	  ```
- ## What `git gc` does
	- **Compacts storage**: merges pack files into one, delta-compressing similar files
	- **Removes unreachable objects**: data no branch, tag or reflog points to anymore (e.g. old `gh-pages` builds)
	- **Packs loose objects** into the pack file
	- Does **NOT** change commits, history, working files or the remote (local only)
	- Keeps unreachable objects from the last ~2 weeks by default, just in case
- ## Fix
	- ```bash
	  git gc
	  ```
	- Result:
		- | | Before | After |
		  |---|---|---|
		  | `.git` size | 281 MB | 64 MB |
		  | packs | 10 | 2 |
		  | loose objects | 372 | 0 |
- ## Notes
	- Run `git gc` every few months, since each Logseq publish adds new `gh-pages` leftovers
	- Removing files from history entirely needs `git-filter-repo` + force-push, which changes every commit ID. Not worth it here since `gc` already got most of the savings
