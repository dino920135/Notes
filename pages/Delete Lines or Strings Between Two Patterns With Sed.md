public:: true
#shellscript #sed #code #bash

- ## Reference
	- [Delete Lines or Strings Between Two Patterns With Sed - techStop](https://techstop.github.io/delete-lines-strings-between-two-patterns-sed/)
- ## Delete All Lines Between Two Patterns
	- Delete all the lines between PATTERN-2 and PATTERN-3 (**exclude the pattern**)
	  `sed -i '/PATTERN-2/,/PATTERN-3/{//!d}' file.txt`
	- Delete all the lines between PATTERN-2 and PATTERN-3 (**including the pattern**)
	  `sed -i '/PATTERN-2/,/PATTERN-3/d' file.txt`