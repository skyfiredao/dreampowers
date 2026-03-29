# Dreampowers

**[中文文档](README_zh.md)**

A complete AI skill set for **Chinese novel writing**, built on the [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) framework. 13 specialized skills covering every stage of fiction creation, from story ideation to manuscript completion, with core innovations in **preventing worldbuilding info-dumps**, **reader-perspective testing**, and **AI-flavor elimination**.

## What It Does

Dreampowers provides a disciplined, skill-driven workflow for writing Chinese fiction with AI. Instead of dumping all worldbuilding details into chapter one, it enforces gradual reveal through quantified rules and multi-stage review.

- **13 specialized skills** covering the full fiction writing lifecycle
- **Three-stage review** for every chapter (plot, reveal check, prose)
- **External review loop**: reader + consistency review after three-stage pass, up to 3 iterations with TBD fallback for human review
- **Six Iron Rules** preventing info-dumps with zero-tolerance enforcement
- **Foreshadowing tracking** of setup/payoff across the entire manuscript
- **Scene-type directing** with sub-modes for action, emotional, and dialogue scenes
- **Four continuous writing modes**: per-chapter confirmation, batch N chapters, pause-at-act-break, full-auto
- **Narrative timeline techniques**: sequential/reverse/interpolated/supplementary with POV selection rules
- **Description methodology**: camera-language system integrated into scene directing
- **External content import**: bring in existing world set, character cards, outlines, and handwritten chapters
- **Mid-story outline revision**: 7-step freeze-and-revise workflow for course corrections
- **Reader-perspective testing**: cold-read simulation scoring page-turning desire, cognitive load, empathy, and pacing feel
- **AI-flavor detection**: quantified pattern matching to eliminate formulaic AI writing habits
- **Writing style definition**: 7-dimension questionnaire (narrative distance, sentence rhythm, sensory density, vocabulary register, metaphor strategy, emotional expression, dialogue ratio) with 54+ reference authors across 9 genres
- **Opt-in mature content**: intimate scene craft direction, installed separately via `--all` flag
- **Three-layer isolation** from coding skills (entry switching + `dp-` prefix + directory isolation)
- **Git-based version management** for manuscripts

## Skill Overview

### Set Skills (Setup Phase)

| Skill | Purpose |
|---|---|
| `dp-using-dreampowers` | Entry skill: mode switching, skill routing, workflow overview |
| `dp-tool-research` | Story premise brainstorming, logline formula, platform comparison, internet-assisted worldbuilding research, author tuning |
| `dp-set-style` | Work-level writing style definition via 7-dimension questionnaire, style reference library (54+ authors across 9 genres), generates style.md voice profile |
| `dp-set-concept` | World/character set with iceberg annotations (50%+ underwater), concept isolation via file-level physical separation, story-level timeline construction, external content import |
| `dp-set-outline` | Act/chapter structure, 5 models, 6 iron rules with concept budget, foreshadowing tracking, theme weaving, narrative timeline techniques, POV rules, mid-story outline revision |

### Chapter Skills (Writing Phase)

| Skill | Purpose |
|---|---|
| `dp-chapter-draft` | Chapter writing with pre-draft gate, 3-stage review, 4 continuous writing modes, timeline execution, handwritten chapter integration, era-accurate writing (period-correct objects and perspective), outline-as-skeleton discipline |
| `dp-chapter-summary` | Plain-text chapter summary (≤300 chars, no formatting) from `output/chapter-NNN.md` only, for cross-chapter continuity |
| `dp-chapter-direct` | Scene-type directing (action/emotional/dialogue sub-modes) + narrative pacing control, tension-relief law, camera-language description methodology |
| `dp-chapter-adult` | **Opt-in**: Intimate scene craft direction with intensity levels and emotional-depth rules |

### Tool Skills

| Skill | Purpose |
|---|---|
| `dp-character-style` | Character voice profiles, name-cover test, dialogue rules, subtext crafting |
| `dp-tool-version` | Git-based version management: structured commits, milestone tags, rollback, diff comparison |

### Review Skills

| Skill | Purpose |
|---|---|
| `dp-review-reader` | Reader-perspective experience testing: page-turning desire, cognitive load, empathy verification, pacing feel |
| `dp-review-consistency` | Cross-chapter consistency verification (8 dimensions) + prose revision and AI-flavor detection/elimination + final completion checklist with full-book consistency scan |

## Key Innovations

### Lore Reveal Pacing (dp-set-outline)

Six Iron Rules enforced with zero tolerance:

1. **CURIOSITY_BEFORE_EXPLANATION**: Mystery first, answers later
2. **SENSE_BEFORE_SYSTEM**: Sensory experience before rules explanation
3. **EXPAND_DONT_ADD**: Deepen existing concepts before introducing new ones
4. **CONCEPT_BUDGET**: Ch.1 max 3 new concepts (can be 0), subsequent max 2/chapter (can be 0)
5. **NO_NARRATOR_LECTURES**: All world info through character action/dialogue only
6. **JUST_IN_TIME**: Reveal only what serves the current conflict

### Foreshadowing Tracking

Individual Markdown files in `docs/dreampowers/tracking/` (prefixed with `thread-`) tracking all foreshadowing threads with:
- Thread recovery pacing determined by outline planning, verified by consistency review
- Claremont Coefficient (CC = introduced - resolved), warning at CC > 2
- Overdue thread detection

### Concept Isolation (dp-set-concept)

Physical file-level isolation preventing AI from seeing future worldbuilding concepts or character states:

- **One concept per file** in `docs/dreampowers/set/concept/`
- **One character per file or directory** in `docs/dreampowers/set/character/`
- **Chapter workspace folders** (`docs/dreampowers/chapters/chapter-NNN/`) as fully self-contained writing units
- **Chapter folders contain**: symlinks to concepts/characters/foreshadowing threads + `spec.md` (concept budget, gating criteria, dependency graph, reader assessment requirements)
- **Iron rules** symlinked from `docs/dreampowers/tracking/iron-rules.md` into each chapter folder
- **Previous chapter summaries** symlinked (1-3 prior chapters as needed) for continuity
- **AI reads only the chapter folder contents** during writing, never the source directories directly
- **Serial chapter writing**: chapters must be written one at a time, in order

### Three-Stage Chapter Review

Every chapter passes through three sequential review stages:
1. **Plot Review**: Conflict progression, character consistency, outline adherence
2. **Reveal Check**: Zero-tolerance info-dump detection against the 6 Iron Rules
3. **Prose Review**: Style consistency, dialogue voice, sensory detail, rhythm

### External Review Loop

After passing the three-stage review, every chapter enters an external review loop:
1. **Reader review** (dp-review-reader): cold-reader experience testing across four dimensions
2. **Consistency review** (dp-review-consistency): eight-dimension consistency check + prose revision with AI-flavor detection + writing style verification against style.md
3. **Fix and repeat**: issues from both reports are merged and fixed, then the loop repeats (max 3 iterations)
4. **TBD fallback**: if issues persist after 3 iterations, the output file is saved as `chapter-NNN-TBD.md` for human review

### Narrative Techniques

Integrated across skills for consistent technique application:

- **Timeline Methods** (dp-set-outline, dp-chapter-draft): sequential, reverse, interpolated, supplementary with decision tree for selection and chapter-level execution guidance
- **POV Rules** (dp-set-outline): First/third-limited/third-omniscient comparison, 5 hard rules for POV switching (scene-boundary only, emotional anchor, no info-smuggling, consistent within scene, signal transitions)
- **Description Methodology** (dp-chapter-direct): Camera-language system integrated with the three scene sub-modes

### Continuous Writing and Outline Revision

- **Four writing modes**: per-chapter confirmation (default), batch N chapters, pause-at-act-break, full-auto (with quality gate)
- **Mid-story outline revision**: 7-step freeze-and-revise workflow

### Reader-Perspective Testing (dp-review-reader)

Simulates a "cold reader" who has no access to outlines, world set, or character cards, only the accumulated text of published chapters. Four test dimensions:

- **Page-Turning Desire**: Does the reader want to keep reading? (1-5 scale, flag at 2 or below)
- **Cognitive Load**: Is the reader confused or overwhelmed? (inverted scale, more than 3 unfamiliar elements in 500 words = overload)
- **Empathy Verification**: "Why should I care?" test for character motivation clarity
- **Subjective Pacing Feel**: "Want to skip this?" (dragging) vs "Wait, what happened?" (rushing)

### AI-Flavor Detection (dp-review-consistency)

Quantified pattern matching across 6 layers to eliminate AI writing habits:

- **Lexical**: Simile-word flooding, emotion labeling, degree-adverb stacking
- **Syntactic**: Triple-parallelism reflex, uniform sentence length, subject repetition
- **Structural**: Fixed three-paragraph pattern per scene, formulaic transitions, every ending is an epiphany
- **Rhetorical**: Synesthesia overuse, metaphor density, universal personification, false antiquity (nostalgia filter on period settings), era-anachronism detection (objects that don't belong to the story's time period)
- **Formatting**: Hyphen/em-dash intrusion (zero tolerance), emoji in prose (zero tolerance), Markdown asterisk marks (zero tolerance), HTML entity characters (zero tolerance)
- **Register**: Technical terminology density, definition-style sentences, passive/agentless constructions, enumeration patterns, over-explicit causal chains

## Prerequisites

- [OpenCode](https://opencode.ai) with [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) installed

## Installation

```bash
# Clone or copy the skill_dreampowers directory
cd skill_dreampowers

# Install default skills (12 skills, excludes opt-in)
chmod +x install.sh
./install.sh

# Or install ALL skills including opt-in (e.g. dp-chapter-adult)
./install.sh --all
```

This creates symlinks from each `dp-*` skill directory to `~/.config/opencode/skills/`. Opt-in skills (like `dp-chapter-adult`) are skipped by default; use `--all` or manually symlink them.

## Uninstallation

```bash
./uninstall.sh
```

Removes all `dp-*` symlinks from `~/.config/opencode/skills/`.

## Usage

### Getting Started

Switch to creative writing mode in an OpenCode session:

```
Use skill dp-using-dreampowers
```

This activates the Dreampowers routing table. The AI will now use `dp-*` skills for all tasks.

**Starting a new novel from scratch**, follow the full workflow:

```
我想写一个仙侠小说
```

The AI loads `dp-tool-research` and walks you through story premise brainstorming (genre, logline, platform fit). After you confirm a premise (stored as `overview.md`), it transitions automatically:

```
dp-tool-research --> dp-set-style --> dp-set-concept --> dp-set-outline --> dp-chapter-draft (loop)
```

Each stage produces artifacts and flows into the next. You don't need to manually invoke skills; the routing table handles transitions.

### Importing Existing Materials

If you already have worldbuilding documents, character cards, outlines, or written chapters, use the import entry point:

```
我有一份已经写好的世界观设定，帮我导入
```

The AI loads `dp-set-concept`, identifies the content type, and processes it accordingly:

| What you provide | What happens |
|---|---|
| World set document | Iceberg annotation (50%+ marked "underwater"), stored in `docs/dreampowers/set/world/` |
| Character cards | Voice profile extraction, stored in `docs/dreampowers/set/character/` |
| Story outline | Structure validation, foreshadowing planning via `dp-set-outline` |
| Written chapters | Metadata injection, foreshadowing backfill, continuity check |
| Mixed document | Auto-split by type, each piece processed separately |

### Importing Handwritten Chapters (Mid-Story Pickup)

When the AI has written chapters 1-5 and you've handwritten chapters 6-8, you need the AI to continue from chapter 9:

```
AI 写到了第5章，第6到第8章是我自己写的，请接入后从第9章继续
[provide chapters 6-8]
```

The AI will:

1. Create chapter workspace folders for your chapters
2. Scan for foreshadowing threads and create/update tracking files
3. Run continuity checking against existing chapters
4. Generate chapter summaries via `dp-chapter-summary`
5. Build a handoff context card summarizing where the story stands
6. Enter the normal `dp-chapter-draft` Pre-Draft Gate for chapter 9

Your handwritten chapters are never modified, only analyzed.

### Choosing a Writing Mode

Before the first chapter (or at any chapter break), the AI asks you to choose a writing pace:

| Mode | Behavior | Best for |
|---|---|---|
| **Per-chapter confirmation** (default) | Write, 3-stage review, you confirm, next chapter | Fine-grained control over every chapter |
| **Batch N chapters** | Write N chapters (each still reviewed), deliver all at once | Batch progress, review later |
| **Pause at act break** | Write until the current act ends, then pause | Managing progress by story arcs |
| **Full-auto** | Write all remaining chapters, deliver complete draft | Maximum trust in the workflow |

Mode switches take effect immediately. You can change anytime.

### Interrupting and Resuming

You can stop the AI at any point:

```
停
暂停
```

To resume:

```
继续写
从第12章开始重写
```

### Revising the Outline Mid-Story

```
第二幕的走向不对，我想改大纲
```

This triggers the 7-step outline revision workflow in `dp-set-outline`.

### Using Quality Skills On-Demand

Quality-layer skills can be invoked anytime:

```
帮我检查第3章到第7章的连续性
用读者视角测试一下第5章
检查最近三章的AI味
```

| Request | Skill invoked |
|---|---|
| Continuity check | `dp-review-consistency` |
| Reader-perspective test | `dp-review-reader` |
| AI-flavor detection + prose polishing | `dp-review-consistency` |
| Scene direction help | `dp-chapter-direct` |
| Character voice audit | `dp-character-style` |

### Author Tuning

After reading completed chapters, you may want to adjust the direction of upcoming chapters:

```
我看完前五章了，后面节奏太慢，想调整
作者调优
```

The AI loads `dp-tool-research` in author tuning mode, walks you through which unwritten chapters to adjust, collects your feedback (pacing, foreshadowing timing, character focus, tone shifts, etc.), and writes a `tuning.md` directive file into each target chapter's workspace folder. The `tuning.md` takes priority over outline defaults during drafting — only the Iron Rules outrank it.

Already-completed chapters are not affected; use the revision workflow for those.

### Version Management

```
提交当前进度
给第一幕打个里程碑标签
第3章改坏了，回滚到审查通过的版本
```

See `dp-tool-version` for the full commit convention.

### Switching Back to Coding Mode

```
Use skill using-superpowers
```

This deactivates all `dp-*` skills. Your manuscript and all Dreampowers artifacts remain in the project directory.

### Quick Reference

| You want to... | Say... |
|---|---|
| Start a new novel | `我想写一个[genre]小说` |
| Import existing materials | `导入我的世界观/角色卡/大纲/章节` |
| Continue writing | `继续写` / `从第N章继续` |
| Pause | `停` / `暂停` |
| Change writing mode | `改成连写N章` / `改成逐章确认` |
| Revise the outline | `我想改大纲` |
| Check continuity | `检查第X到第Y章的连续性` |
| Test reader experience | `用读者视角测试第N章` |
| Remove AI flavor | `检查AI味` |
| Tune upcoming chapters | `作者调优` / `我想调整后面的方向` |
| Manage versions | `提交` / `打标签` / `回滚` |
| Switch to coding | `Use skill using-superpowers` |

## Project Structure

```
skill_dreampowers/
├── install.sh                        # Symlink installer
├── uninstall.sh                      # Symlink remover
├── README.md                         # English documentation
├── README_zh.md                      # Chinese documentation
└── skills/
    ├── dp-using-dreampowers/         # Entry skill
    ├── dp-tool-research/             # Story brainstorming + research
    ├── dp-set-style/                 # Writing style definition + voice profile
    ├── dp-set-concept/               # World/character set + concept isolation + import
    ├── dp-set-outline/               # Outline + reveal pacing + theme weaving
    ├── dp-chapter-draft/             # Chapter writing + review
    ├── dp-chapter-summary/           # Chapter summary generation
    ├── dp-chapter-direct/            # Scene directing + pacing control
    ├── dp-character-style/           # Character voice profiles + subtext
    ├── dp-tool-version/              # Git version management
    ├── dp-review-reader/             # Reader-perspective testing
    ├── dp-review-consistency/        # Continuity + revision + final check
    └── dp-chapter-adult/             # Opt-in: intimate scene craft
```

## Artifact Paths

When used in a project, Dreampowers creates the following directory structure:

```
docs/dreampowers/
├── input/                           # User-imported raw data (temp area)
├── set/
│   ├── world/                       # World overview (logic, background)
│   ├── concept/                     # Concept source files (one per file)
│   └── character/                   # Character source files/directories
├── tracking/                        # Cross-chapter persistent tracking
│   ├── overview.md                  # One-line story summary
│   ├── iron-rules.md               # Iron rules (symlinked to chapter folders)
│   ├── style.md                     # Writing style profile (symlinked to chapter folders)
│   └── thread-NNN-*.md              # Foreshadowing threads (thread- prefix)
├── timeline/                        # Timeline + chapter summaries
│   ├── timeline.md                  # Initial timeline definition
│   └── summary-NNN.md              # Per-chapter summaries
├── outlines/                        # Outlines + full-book reviews
│   ├── outline-*.md
│   └── review-*.md
└── chapters/                        # Chapter workspaces
    └── chapter-NNN/
        ├── spec.md                 # Metadata (budget, gating, dependencies)
        ├── draft.md                 # Draft (work in progress)
        ├── review.md                # Chapter-level review report
        ├── tuning.md                # Author tuning directives (optional, high priority when present)
        ├── *.md -> set/concept/*    # Concept symlinks
        ├── *.md -> set/character/*  # Character symlinks
        ├── thread-*.md -> tracking/*# Foreshadowing symlinks
        ├── iron-rules.md -> tracking/iron-rules.md
        ├── style.md -> tracking/style.md
        └── summary-*.md -> timeline/summary-*.md  (prev 1-3 chapters)

output/                              # Final versions
└── chapter-NNN.md
```

Chapter folders (`docs/dreampowers/chapters/chapter-NNN/`) are fully self-contained writing units. During writing, the AI reads only the chapter folder contents, never the source directories directly. Only invisible information is guaranteed unused.

## Coexistence with Superpowers

Dreampowers and [Superpowers](https://github.com/obra/superpowers) (the coding skill set) are completely independent. Three-layer isolation ensures no interference:

1. **Entry switching**: `dp-using-dreampowers` and `using-superpowers`
2. **Namespace**: All Dreampowers skills prefixed with `dp-`
3. **Directory**: Installed via symlinks, separate from Superpowers source

## License

GPL-3.0
