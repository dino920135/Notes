---
name: logseq-research-brainstormer
description: Analyzes Logseq technical notes to extract ideas from journals, identify orphaned journal entries, and synthesize research pillars (Radar, GNSS, INS). Use when the user wants to turn brainstorming into actionable tasks or find gaps in their research graph.
---

# Logseq Research Brainstormer

## Overview
This skill transforms Logseq from a passive note-taking tool into an active research architect. It specializes in finding "lost" thoughts in daily journals and bridging the gaps between technical pillars (Radar, GNSS, INS).

## Core Capabilities

### 1. The Discovery Engine
Scans recent journal entries to find:
- **Questions as Tasks**: Any block ending in `?` that isn't already a task.
- **Explicit Ideas**: Any block starting with `Idea:` or containing `#brainstorm`.
- **Orphan Journals**: Daily entries that have content but **zero links** to non-journal pages (like `[[Radar]]` or `[[Coding]]`). These are "lost" contexts.

### 2. Actionable Conversion
When an idea is found, this skill:
- Converts the block to `LATER` (Logseq's task marker).
- Infers the correct **Research Pillar** (Radar, GNSS, INS, or Coding) based on keywords.
- Tags the block with `type:: #research` and `focus:: [[Pillar]]`.

### 3. Synthesis & Bridge Building
Analyzes the structure of the graph to:
- **Find Orphaned Literature**: Identify `@` prefixed pages that are not linked to any concept page.
- **Propose Bridge Topics**: Suggest "Intersection" pages where your pillars overlap (e.g., "Radar-Inertial Fusion" if you have both Radar and INS notes but no page linking them).

## Workflows

### Workflow: Weekly Brainstorm Review
**Trigger**: "Review my brainstorms from the last week."
1. Use `mcp_logseq_get_current_page` to identify the last 7 journal entries.
2. For each journal:
   - Identify questions (`?`) and `Idea:` blocks.
   - Check if the journal contains any `[[links]]`. If not, flag it as an **Orphan Journal**.
3. Present a summary table of "Lost Ideas" and "Isolated Contexts."

### Workflow: Pillar Synthesis
**Trigger**: "Synthesize my research pillars."
1. Fetch the content of `Contents` and main pillars (`[[Radar]]`, `[[GNSS]]`, `[[INS]]`).
2. Identify "Dark Data": Find `@` papers that aren't linked to these pillars.
3. Generate 3 "Bridge Questions" that force you to connect the separate technologies (e.g., "How does EKF inconsistency in [[SLAM]] affect your [[GNSS]] integration?").

## Guidelines for Output
- **Be Surgical**: Don't just list things; suggest specific links.
- **Respect the Workflow**: Always use the `:now` workflow (`LATER` marker).
- **Technical Precision**: Use the specific hardware names (e.g., `AWR1843`, `F9P`) when suggesting links.
