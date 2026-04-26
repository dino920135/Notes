- #gemini #agent #ai #skills #cli #llm
- {{renderer :tocgen2}}
- ## Installation #install
	- Follow the instruction in: 
	  [Github: google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli)
	- ### Windows #windows
	  collapsed:: true
		- Install node.js first from [Node.js — Download Node.js®](https://nodejs.org/en/download)
		- Install Gemini CLI with **Command Prompt**
		  ```shell
		  npm install -g @google/gemini-cli
		  ```
	- ### WSL #wsl
	  collapsed:: true
		- #### Install node.js
			- ```bash
			  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
			  ```
			- Restart the terminal
			  ```bash
			  nvm install --lts
			  ```
		- #### Install Gemini cli
			- ```bash
			  npm install -g @google/gemini-cli
			  ```
	- ### Ubuntu (Linux) #linux
		- #### Install node.js
			- ```bash
			  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
			  ```
			- Restart the terminal
			  ```bash
			  nvm install --lts
			  ```
		- #### Install Gemini cli
			- ```bash
			  npm install -g @google/gemini-cli
			  ```
- ## Basic usage
	- ### Slash commands
		- `/stats`:
		  Check session/model/tools usage statistic
		  ![image.png](../assets/image_1774462322485_0.png)
		- `/skills` #skills
		  Manage and activate specialized agent skills.
			- **Subcommands:**
			- `list`: Displays all discovered skills and their status.
			- `enable <name>`: Enables a specific skill. Use `--scope workspace` for project-specific enablement.
			- `disable <name>`: Disables a specific skill.
			- `reload`: Refreshes the list of discovered skills.
			- `link <path>`: Links skills from a local directory.
		- `/chat` (Alias for `/resume`)
		  Toggle chat mode to interact with the AI without tool execution.
			- **Subcommands:**
			- `list`: Lists available conversation checkpoints.
			- `save <tag>`: Manually saves the current conversation state with a specific identifying tag.
			- `load` / `resume <tag>`: Resumes a conversation from a previously saved tagged checkpoint.
			- `share [filename]`: Exports the current conversation to a Markdown or JSON file.
		- `/tools`: View and manage the list of available tools.
		- `/help`: Display available commands and general help information.
		- `/bug`: Report an issue or provide feedback about the Gemini CLI.
- ## GEMINI.md
	- A project-specific configuration file that provides custom instructions, context, or rules for the Gemini CLI agent.
	- It is automatically read and applied by the agent when it starts a session in the directory containing the file.
- ## Extensions
- ## Reference
	- [安裝 Gemini Cli 筆記 – 仲佑的網誌](https://yowlab.idv.tw/wordpress/?p=3172)
	- [Github: google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli)
	-