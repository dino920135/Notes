- This guide explains how to automatically publish your Logseq graph to GitHub Pages using GitHub Actions, based on the configuration in `.github/workflows/blank.yml`.
	- ## Overview
		- The automation process uses a GitHub Action to convert your Markdown files into a Single Page Application (SPA) and then deploys that SPA to a special branch called `gh-pages`.
	- ## Workflow Configuration
		- The following configuration is located in `.github/workflows/blank.yml`:
		- ```yaml
		  name: CI
		  
		  on:
		  push:
		    branches: [main]
		  workflow_dispatch:
		  
		  jobs:
		  build:
		    runs-on: ubuntu-latest
		  
		    steps:
		      - uses: actions/checkout@v4.1.7
		      
		      - name: Logseq Publish
		        uses: logseq/publish-spa@main
		        
		      - name: add a nojekyll file
		        run: touch $GITHUB_WORKSPACE/www/.nojekyll
		        
		      - name: Deploy
		        uses: JamesIves/github-pages-deploy-action@v4.8.0
		        with:
		          branch: gh-pages
		          folder: www
		          clean: true
		          single-commit: true
		  ```
	- ## Step-by-Step Breakdown
		- ### 1. Triggers
			- **The workflow defines the specific events that initiate the automated publishing process.** The workflow starts automatically when:
				- You **push** changes to the `main` branch.
				- You manually trigger it via the **Actions** tab in GitHub (**workflow_dispatch**).
		- ### 2. Checkout
			- **The virtual environment prepares itself by pulling your latest code from the repository.** `actions/checkout@v4.1.7` downloads your repository's files to the GitHub runner.
		- ### 3. Build (Logseq Publish)
			- **Your Markdown-based Logseq notes are converted into a web-ready Single Page Application (SPA).** `logseq/publish-spa@main` is the official action that processes your notes. It generates a static site in a folder named `www`.
		- ### 4. Nojekyll File
			- **A special configuration file is created to ensure GitHub Pages correctly handles Logseq's internal folder structure.** `touch $GITHUB_WORKSPACE/www/.nojekyll` creates an empty file named `.nojekyll`. This tells GitHub Pages **not** to use the Jekyll processing engine, which is necessary because Logseq's output includes directories starting with underscores (like `_next`) that Jekyll would otherwise ignore.
		- ### 5. Deployment
			- **The final website files are pushed to a dedicated branch to make them live on the internet.** `JamesIves/github-pages-deploy-action@v4.8.0` takes the contents of the `www` folder and pushes them to a branch named `gh-pages`.
				- **clean: true**: Removes old files from the destination branch that are no longer in the `www` folder.
				- **single-commit: true**: Keeps the `gh-pages` branch history clean by overwriting it with a single commit.
	- ## GitHub Repository Settings
		- After the workflow runs for the first time:
			- Go to your repository on GitHub.
			  logseq.order-list-type:: number
			- Click on **Settings** > **Pages**.
			  logseq.order-list-type:: number
			- Under **Build and deployment** > **Branch**, select `gh-pages` and the `/(root)` folder.
			  logseq.order-list-type:: number
			- Click **Save**.
			  logseq.order-list-type:: number
				- Your site should soon be live at `https://<username>.github.io/<repository-name>/`.