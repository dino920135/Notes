- #logseq #tutorial #Admonition
- # Logseq Admonitions
	- Admonitions (also known as callouts) are a great way to highlight important information in your notes.
- ## 1. Native Admonitions
	- Logseq has built-in support for several types of admonition blocks. These work out of the box without any custom styling.
	- ### Tip
	  #+BEGIN_TIP
	  This is a native Logseq tip block.
	  #+END_TIP
	- ### Important
	  #+BEGIN_IMPORTANT
	  This is a native important block.
	  #+END_IMPORTANT
	- ### Warning
	  #+BEGIN_WARNING
	  This is a native warning block.
	  #+END_WARNING
	- ### Caution
	  #+BEGIN_CAUTION
	  This is a native caution block.
	  #+END_CAUTION
	- ### Note
	  #+BEGIN_NOTE
	  This is a native note block.
	  #+END_NOTE
	- ### Quote
	  #+BEGIN_QUOTE
	  This is a native quote block.
	  #+END_QUOTE
- ## 2. Custom Admonitions using "<"
	- Many users prefer a shorter syntax using the `<` character. While not native, you can implement this using **Custom CSS**.
	- ### Example Usage:
		- < **TIP**
		  This is a custom tip admonition triggered by the `<` character.
		- < **WARNING**
		  Custom warning box using the same trigger.
		- < **INFO**
		  Informational box with a different color.
- ## 3. How to Setup (Custom CSS)
	- Add this to your `logseq/custom.css` to style any block starting with the `<` character:
	- ```css
	  /* Custom Admonition Style for blocks starting with < */
	  div[data-refs-self*='["<"]'] {
	    background-color: #f0f7ff;
	    border-left: 5px solid #007bff;
	    padding: 10px;
	    border-radius: 4px;
	  }
	  
	  /* Optional: Specific styling for Warning */
	  div[data-refs-self*='["<"]']:has(strong:contains("WARNING")) {
	    background-color: #fff3cd;
	    border-left-color: #ffc107;
	  }
	  ```
- ## 4. Why use the Custom Method?
	- **Speed**: It is a fast, single-character trigger.
	- **Cleanliness**: It doesn't clutter the page with `#+BEGIN` and `#+END` tags.
	- **Flexibility**: You can define any colors or icons you want in your CSS.