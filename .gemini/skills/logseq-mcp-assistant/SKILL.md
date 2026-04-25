---
name: logseq-mcp-assistant
description: Foundational skill for maintaining Logseq MCP server stability and executing advanced Datalog queries. Use when the MCP server freezes, times out, or when complex data retrieval is needed.
---

# Logseq MCP Assistant

## Overview
This skill provides the foundational stability for Logseq-Gemini interactions. it handles "self-healing" for the MCP server and provides a library of high-performance queries for technical research graphs.

## Core Capabilities

### 1. Stability & Self-Healing
If the Logseq MCP tools (e.g., `list_pages`) report "Not connected" or timeout:
- **Action**: Run the bundled cleanup script: `powershell.exe -ExecutionPolicy Bypass -File scripts/mcp_cleanup.ps1`.
- **Diagnosis**: Check if Logseq is running and if the HTTP API (port 12315) is enabled in `Settings > Features`.

### 2. Block Management Best Practices
When using `mcp_logseq_insert_nested_block` or `mcp_logseq_update_block`:
- **Granularity**: DO NOT insert multiple headings or unordered list items in a single block. This causes Logseq rendering errors (truncated content).
- **Strategy**: Insert each heading and list item as a separate block call. Use the `parent_block_uuid` and `sibling` parameters to build the hierarchy step-by-step.
- **Wait for Previous**: When inserting multiple blocks sequentially in one turn, ALWAYS set `wait_for_previous: true` on subsequent calls to maintain correct order.

### 3. Advanced Research Queries (Datalog)
Use these Datalog recipes for `mcp_logseq_query`:
- **Unlinked Literature**: Finds pages starting with `@` that have no references.
  `[:find (pull ?p [*]) :where [?p :block/name ?n] [(clojure.string/starts-with? ?n "@")] (not [?b :block/path-refs ?p])]`
- **Recent Technical Tasks**: Finds `LATER` tasks from the last 14 days.
  `[:find (pull ?b [*]) :where [?b :block/marker "LATER"] [?b :block/page ?p] [?p :block/journal? true] [?p :block/journal-day ?d] [(>= ?d :14d)]]`

### 3. Namespace Management
When creating or renaming pages, adhere to the user's established hierarchy:
- `Dev/`: Tools, languages, and coding environments (e.g., `Dev/Docker`, `Dev/Vim`).
- `Ti/mmWave/`: Texas Instruments specific hardware documentation.
- `Serial/`: Communication protocols.

## Troubleshooting Workflow
If a "Freeze" occurs:
1. Identify if the response size is large (e.g., `list_pages` on 300+ pages).
2. Verify the `LOGSEQ_API_TOKEN` in the `.env` file at `C:\PROJECT\gemini-logseq-mcp\mcp-logseq\.env`.
3. Terminate zombie processes using the cleanup script.
4. If Unicode errors occur, avoid logging raw `response.text` from the Logseq API.

## Guidelines for Tools
- **Surgical Reads**: Prefer `get_page_content` over `list_pages` for performance.
- **Datalog First**: Use `mcp_logseq_query` for complex filtering instead of fetching all pages and filtering in Python.
