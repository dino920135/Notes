## Source
	- [Size of font for filenames/headings - Questions & Help - Logseq](https://discuss.logseq.com/t/size-of-font-for-filenames-headings/14714/5)
- ## custom.css
	- ```css
	  /*******************************/
	  /* Tone down headings a little */
	  /*******************************/
	  
	  .ls-block h1{
	      font-size: 1.6em;
	  }
	  
	  .editor-inner .h1.uniline-block,.ls-block h1 {
	      font-size: 1.6em;
	  }
	  
	  .ls-block h2{
	      font-size: 1.4em;
	  }
	  
	  .editor-inner .h2.uniline-block,.ls-block h2 {
	      font-size: 1.4em;
	  }
	  
	  
	  /* Re-assert this stock CSS so that refs don't get huge */
	  .block-ref :is(h1,h2,h3,h4,h5,h6) {
	      border-bottom: none;
	      font-size: 1rem
	  }
	  ```