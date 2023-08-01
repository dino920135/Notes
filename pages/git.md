public:: true

- ### Changing the order of commit
  Start with **rebase**:
  Rebase on the last commit before all the commits you want to edit
  ```bash
  git rebase -i [the last commit not editing]
  ```
  Then change the order of commits
-