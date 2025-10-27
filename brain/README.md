---
always_apply: true
---

# Brain - The Single Source of Truth

## What is This?
The `/brain` folder is the **permanent memory** of this project. Code may change, but brain remembers everything—decisions, tests, bugs, experiments, failures, and evolution.

## Why Brain Exists
Even after a year away, anyone (including AI assistants) can read brain and instantly have full context, as if work was never interrupted.

## How to Use Brain

### For Cursor (AI Assistant)
1. **Before making changes:** Read relevant brain docs
2. **While working:** Update brain docs as you code
3. **After completing:** Commit code + brain changes together
4. **Definition of Done:** Code + Tests + Brain docs + Commit

### For Human Developers
1. **Starting work:** Check `/brain/project-memory/state-of-project.md`
2. **New feature:** Create brain folder in `/brain/features/[feature-name]/`
3. **Making decisions:** Document in relevant brain docs
4. **Encountering bugs:** Log in `bugs.md`
5. **Questions:** Document in `/brain/project-memory/open-questions.md`

## Structure Overview

### `/brain/INDEX.md`
Master navigation - start here to find anything

### `/brain/product/`
Product vision, roadmap, metrics, user research

### `/brain/architecture/`
System design, tech stack, patterns, decisions

### `/brain/design/`
Design system, accessibility, user flows, UI mockups

### `/brain/engineering/`
Coding standards, best practices, performance benchmarks

### `/brain/qa/`
Testing strategy, coverage reports, bug tracking

### `/brain/security/`
Threat models, security policies, vulnerability tracking

### `/brain/operations/`
Deployment process, monitoring, incident response

### `/brain/features/[feature-name]/`
Feature-specific docs (README, journal, tests, bugs, decisions)

### `/brain/project-memory/`
Timeline, state of project, open questions, rejected ideas, trade-offs

### `/brain/retrospectives/`
Monthly team retrospectives

## Core Principles

### 1. Brain Is Mandatory
If it's not in brain, it doesn't exist. Every decision, test, bug, or idea MUST be documented.

### 2. Update Brain With Code
Never commit code changes without updating relevant brain docs. They are part of the same work.

### 3. Nothing Is Deleted
Outdated content moves to `/brain/archives/[year]/`, never deleted. History is preserved.

### 4. Bidirectional Linking
- Code → Brain: Every source file should have a comment pointing to its brain doc
- Brain → Code: Every brain doc links to actual source files

### 5. Seven-Perspective Thinking
For every significant decision, consider:
- 🎯 Product (why?)
- 🏗️ Architecture (how to build for scale?)
- 🎨 Design (how do users interact?)
- 💻 Engineering (cleanest implementation?)
- 🧪 QA (what can break?)
- 🔒 Security (what are the threats?)
- 🚀 Operations (how to deploy/monitor?)

## Template Files
Check `/brain/INDEX.md` for links to template files for:
- Features (README, journal, tests, bugs, decisions)
- Architecture (ADRs)
- Design (design system, accessibility checklist)
- And more...

## Quick Start Checklist
- [ ] Read `/brain/project-memory/state-of-project.md` (current state)
- [ ] Read `/brain/project-memory/timeline.md` (recent history)
- [ ] Check `/brain/project-memory/open-questions.md` (pending decisions)
- [ ] Review `/brain/architecture/system-overview.md` (tech stack)
- [ ] Read relevant feature docs in `/brain/features/[feature-name]/`

---

**Last Updated:** 2025-01-27  
**Project Type:** Flutter  
**Status:** Initialized ✅

