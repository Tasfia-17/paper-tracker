# paper-tracker

<p align="center">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 160" width="600" height="160">
    <defs>
      <linearGradient id="bg" x1="0%" y1="0%" x2="100%" y2="0%">
        <stop offset="0%" style="stop-color:#667eea;stop-opacity:1" />
        <stop offset="100%" style="stop-color:#764ba2;stop-opacity:1" />
      </linearGradient>
      <linearGradient id="shine" x1="0%" y1="0%" x2="0%" y2="100%">
        <stop offset="0%" style="stop-color:#ffffff;stop-opacity:0.15" />
        <stop offset="100%" style="stop-color:#ffffff;stop-opacity:0" />
      </linearGradient>
    </defs>
    <rect width="600" height="160" rx="16" fill="url(#bg)"/>
    <rect width="600" height="80" rx="16" fill="url(#shine)"/>
    <!-- book icon -->
    <rect x="36" y="44" width="52" height="68" rx="4" fill="#fff" opacity="0.95"/>
    <rect x="40" y="48" width="44" height="60" rx="3" fill="#e8d5f5"/>
    <line x1="62" y1="48" x2="62" y2="108" stroke="#764ba2" stroke-width="2"/>
    <line x1="46" y1="60" x2="58" y2="60" stroke="#764ba2" stroke-width="1.5" stroke-linecap="round"/>
    <line x1="46" y1="68" x2="58" y2="68" stroke="#764ba2" stroke-width="1.5" stroke-linecap="round"/>
    <line x1="46" y1="76" x2="58" y2="76" stroke="#764ba2" stroke-width="1.5" stroke-linecap="round"/>
    <line x1="66" y1="60" x2="80" y2="60" stroke="#764ba2" stroke-width="1.5" stroke-linecap="round"/>
    <line x1="66" y1="68" x2="80" y2="68" stroke="#764ba2" stroke-width="1.5" stroke-linecap="round"/>
    <line x1="66" y1="76" x2="74" y2="76" stroke="#764ba2" stroke-width="1.5" stroke-linecap="round"/>
    <!-- radar pulse -->
    <circle cx="88" cy="52" r="10" fill="none" stroke="#fff" stroke-width="1.5" opacity="0.4"/>
    <circle cx="88" cy="52" r="6" fill="none" stroke="#fff" stroke-width="1.5" opacity="0.6"/>
    <circle cx="88" cy="52" r="3" fill="#fff" opacity="0.9"/>
    <!-- title -->
    <text x="112" y="88" font-family="'Segoe UI', system-ui, sans-serif" font-size="38" font-weight="700" fill="#ffffff" letter-spacing="-1">paper-tracker</text>
    <text x="114" y="118" font-family="'Segoe UI', system-ui, sans-serif" font-size="15" fill="#e0d0f5" letter-spacing="0.5">git-native autonomous research agent</text>
  </svg>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/gitagent-0.1.0-667eea?style=flat-square" alt="gitagent"/>
  <img src="https://img.shields.io/badge/gitclaw-runtime-764ba2?style=flat-square" alt="gitclaw"/>
  <img src="https://img.shields.io/badge/arXiv-live-e53e3e?style=flat-square" alt="arxiv"/>
  <img src="https://img.shields.io/badge/license-MIT-38a169?style=flat-square" alt="license"/>
  <img src="https://img.shields.io/badge/node-%3E%3D18-dd6b20?style=flat-square" alt="node"/>
</p>

---

paper-tracker is a git-native AI agent that lives inside your repository. Every day it browses arXiv, reads abstracts, scores papers against your research profile, tracks who cites your work, monitors rival labs, detects field trends, and manages your reading queue. Everything it learns is committed to git. Your entire research history is version-controlled.

---

## How it works

<p align="center">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 700 200" width="700" height="200">
    <defs>
      <marker id="arrow" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
        <path d="M0,0 L0,6 L8,3 z" fill="#667eea"/>
      </marker>
    </defs>
    <!-- boxes -->
    <rect x="10" y="70" width="110" height="60" rx="10" fill="#ebf4ff" stroke="#667eea" stroke-width="1.5"/>
    <text x="65" y="96" text-anchor="middle" font-family="system-ui,sans-serif" font-size="11" font-weight="600" fill="#3c366b">arXiv</text>
    <text x="65" y="112" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#553c9a">listing pages</text>

    <rect x="155" y="70" width="110" height="60" rx="10" fill="#faf5ff" stroke="#9f7aea" stroke-width="1.5"/>
    <text x="210" y="96" text-anchor="middle" font-family="system-ui,sans-serif" font-size="11" font-weight="600" fill="#3c366b">arxiv-browse</text>
    <text x="210" y="112" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#553c9a">score 1-5</text>

    <rect x="300" y="70" width="110" height="60" rx="10" fill="#fff5f5" stroke="#fc8181" stroke-width="1.5"/>
    <text x="355" y="96" text-anchor="middle" font-family="system-ui,sans-serif" font-size="11" font-weight="600" fill="#3c366b">paper-digest</text>
    <text x="355" y="112" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#553c9a">structured entry</text>

    <rect x="445" y="70" width="110" height="60" rx="10" fill="#f0fff4" stroke="#68d391" stroke-width="1.5"/>
    <text x="500" y="96" text-anchor="middle" font-family="system-ui,sans-serif" font-size="11" font-weight="600" fill="#3c366b">knowledge</text>
    <text x="500" y="112" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#276749">git commit</text>

    <rect x="590" y="70" width="100" height="60" rx="10" fill="#fffaf0" stroke="#f6ad55" stroke-width="1.5"/>
    <text x="640" y="96" text-anchor="middle" font-family="system-ui,sans-serif" font-size="11" font-weight="600" fill="#3c366b">report</text>
    <text x="640" y="112" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#744210">weekly digest</text>

    <!-- arrows -->
    <line x1="120" y1="100" x2="152" y2="100" stroke="#667eea" stroke-width="1.5" marker-end="url(#arrow)"/>
    <line x1="265" y1="100" x2="297" y2="100" stroke="#667eea" stroke-width="1.5" marker-end="url(#arrow)"/>
    <line x1="410" y1="100" x2="442" y2="100" stroke="#667eea" stroke-width="1.5" marker-end="url(#arrow)"/>
    <line x1="555" y1="100" x2="587" y2="100" stroke="#667eea" stroke-width="1.5" marker-end="url(#arrow)"/>

    <!-- cron label -->
    <text x="350" y="25" text-anchor="middle" font-family="system-ui,sans-serif" font-size="12" fill="#718096">runs every day at 8am via cron schedule</text>
    <line x1="350" y1="32" x2="350" y2="68" stroke="#cbd5e0" stroke-width="1" stroke-dasharray="4,3"/>
  </svg>
</p>

---

## Skills

<p align="center">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 680 320" width="680" height="320">
    <defs>
      <linearGradient id="g1" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#667eea"/>
        <stop offset="100%" style="stop-color:#764ba2"/>
      </linearGradient>
      <linearGradient id="g2" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#f093fb"/>
        <stop offset="100%" style="stop-color:#f5576c"/>
      </linearGradient>
      <linearGradient id="g3" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#4facfe"/>
        <stop offset="100%" style="stop-color:#00f2fe"/>
      </linearGradient>
      <linearGradient id="g4" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#43e97b"/>
        <stop offset="100%" style="stop-color:#38f9d7"/>
      </linearGradient>
      <linearGradient id="g5" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#fa709a"/>
        <stop offset="100%" style="stop-color:#fee140"/>
      </linearGradient>
      <linearGradient id="g6" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#a18cd1"/>
        <stop offset="100%" style="stop-color:#fbc2eb"/>
      </linearGradient>
      <linearGradient id="g7" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#ffecd2"/>
        <stop offset="100%" style="stop-color:#fcb69f"/>
      </linearGradient>
      <linearGradient id="g8" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#a1c4fd"/>
        <stop offset="100%" style="stop-color:#c2e9fb"/>
      </linearGradient>
      <linearGradient id="g9" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#d4fc79"/>
        <stop offset="100%" style="stop-color:#96e6a1"/>
      </linearGradient>
    </defs>
    <!-- row 1 -->
    <rect x="10" y="10" width="190" height="80" rx="12" fill="url(#g1)"/>
    <text x="105" y="42" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#fff">arxiv-browse</text>
    <text x="105" y="60" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#e9d8fd">Scans cs.LG / CL / CV daily</text>
    <text x="105" y="76" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#e9d8fd">scores papers 1-5</text>

    <rect x="215" y="10" width="190" height="80" rx="12" fill="url(#g2)"/>
    <text x="310" y="42" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#fff">paper-digest</text>
    <text x="310" y="60" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#fff">Structured entry per paper</text>
    <text x="310" y="76" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#fff">linked to your open problems</text>

    <rect x="420" y="10" width="250" height="80" rx="12" fill="url(#g3)"/>
    <text x="545" y="42" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#fff">citation-alert</text>
    <text x="545" y="60" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#fff">Monitors Semantic Scholar</text>
    <text x="545" y="76" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#fff">alerts when your papers are cited</text>

    <!-- row 2 -->
    <rect x="10" y="110" width="190" height="80" rx="12" fill="url(#g4)"/>
    <text x="105" y="142" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#1a4731">trend-radar</text>
    <text x="105" y="160" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#1a4731">Detects surging topics</text>
    <text x="105" y="176" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#1a4731">and field convergence</text>

    <rect x="215" y="110" width="190" height="80" rx="12" fill="url(#g5)"/>
    <text x="310" y="142" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#fff">reading-queue</text>
    <text x="310" y="160" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#fff">Prioritized unread pipeline</text>
    <text x="310" y="176" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#fff">tracks reading velocity</text>

    <rect x="420" y="110" width="250" height="80" rx="12" fill="url(#g6)"/>
    <text x="545" y="142" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#44337a">rival-tracker</text>
    <text x="545" y="160" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#44337a">Monitors specific authors and labs</text>
    <text x="545" y="176" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#44337a">alerts on new publications</text>

    <!-- row 3 -->
    <rect x="10" y="210" width="190" height="80" rx="12" fill="url(#g7)"/>
    <text x="105" y="242" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#744210">connection-finder</text>
    <text x="105" y="260" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#744210">Finds hidden links between</text>
    <text x="105" y="276" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#744210">new and existing papers</text>

    <rect x="215" y="210" width="190" height="80" rx="12" fill="url(#g8)"/>
    <text x="310" y="242" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#2a4365">knowledge-update</text>
    <text x="310" y="260" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#2a4365">Persists everything to git</text>
    <text x="310" y="276" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#2a4365">with timestamped commits</text>

    <rect x="420" y="210" width="250" height="80" rx="12" fill="url(#g9)"/>
    <text x="545" y="242" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#1a4731">weekly-report</text>
    <text x="545" y="260" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#1a4731">Scannable Monday digest</text>
    <text x="545" y="276" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#1a4731">must-reads highlighted</text>
  </svg>
</p>

---

## File structure

```
paper-tracker/
├── agent.yaml                    # gitagent manifest
├── SOUL.md                       # agent identity and values
├── RULES.md                      # hard behavioral constraints
├── demo.js                       # run the agent directly
├── memory/
│   ├── MEMORY.md                 # your research profile (edit this)
│   ├── rivals.md                 # authors and labs to monitor (edit this)
│   ├── seen-papers.md            # deduplication log
│   ├── citation-log.md           # citation alert history
│   └── rival-log.md              # rival publication history
├── knowledge/
│   ├── papers.md                 # growing knowledge base
│   └── connections.md            # discovered paper connections
├── queue/
│   ├── unread.md                 # prioritized reading queue
│   ├── reading.md                # currently reading
│   ├── read.md                   # completed with your takeaways
│   └── skipped.md                # consciously skipped
├── reports/                      # weekly digest reports
├── schedules/
│   ├── daily-arxiv-scan.yaml     # runs every day at 8am
│   └── weekly-digest.yaml        # runs every Monday at 9am
├── skills/
│   ├── arxiv-browse/SKILL.md
│   ├── paper-digest/SKILL.md
│   ├── citation-alert/SKILL.md
│   ├── trend-radar/SKILL.md
│   ├── reading-queue/SKILL.md
│   ├── rival-tracker/SKILL.md
│   ├── connection-finder/SKILL.md
│   ├── knowledge-update/SKILL.md
│   └── weekly-report/SKILL.md
└── tools/
    ├── fetch-page.yaml
    └── download-pdf.yaml
```

---

## Setup

**1. Install gitclaw**

```bash
npm install -g gitclaw
```

**2. Edit your research profile**

Open `memory/MEMORY.md` and fill in:
- Your research areas and keywords
- Your current open problems (papers addressing these get score 5)
- Your own papers for citation tracking

**3. Add rivals to monitor**

Open `memory/rivals.md` and add authors or labs you want to track.

**4. Run it now**

```bash
export ANTHROPIC_API_KEY="sk-ant-..."
node demo.js "Run the full daily paper tracking pipeline"
```

**5. Start the scheduler**

```bash
gitclaw schedule start
```

The agent now runs every day at 8am and every Monday at 9am automatically.

---

## Schedules

<p align="center">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 560 130" width="560" height="130">
    <rect x="0" y="0" width="560" height="130" rx="12" fill="#f7fafc"/>
    <!-- daily -->
    <rect x="20" y="20" width="240" height="90" rx="10" fill="#ebf4ff" stroke="#667eea" stroke-width="1.5"/>
    <text x="140" y="48" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#3c366b">Daily  --  8:00am</text>
    <text x="140" y="66" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#553c9a">arxiv-browse + rival-tracker</text>
    <text x="140" y="82" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#553c9a">paper-digest + connection-finder</text>
    <text x="140" y="98" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#553c9a">citation-alert + knowledge-update</text>
    <!-- weekly -->
    <rect x="300" y="20" width="240" height="90" rx="10" fill="#f0fff4" stroke="#68d391" stroke-width="1.5"/>
    <text x="420" y="48" text-anchor="middle" font-family="system-ui,sans-serif" font-size="13" font-weight="700" fill="#1a4731">Weekly  --  Monday 9am</text>
    <text x="420" y="66" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#276749">trend-radar analysis</text>
    <text x="420" y="82" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#276749">weekly-report generation</text>
    <text x="420" y="98" text-anchor="middle" font-family="system-ui,sans-serif" font-size="10" fill="#276749">reading-queue velocity stats</text>
  </svg>
</p>

---

## The git angle

Every paper added, every citation found, every rival publication detected is a git commit. Your research history is permanently version-controlled.

```bash
git log --oneline              # every day's harvest
git diff HEAD~7                # what was added this week
git log --grep="score:5"       # all must-read papers ever found
git log --grep="RIVAL ALERT"   # every rival publication ever tracked
git log --grep="NEW CITATION"  # every time someone cited your work
```

Fork this repo to share your knowledge base with your lab. Branch it for a new research direction. Tag it at submission deadlines. The agent definition is the repo.

---

## On-demand commands

Talk to the agent directly at any time:

```bash
node demo.js "What should I read next?"
node demo.js "Mark 2501.12345 as read -- takeaway: proposes linear attention variant"
node demo.js "Show my reading stats"
node demo.js "Find connections for the last 3 papers added"
node demo.js "Run the rival-tracker skill"
node demo.js "Generate this week's trend report"
```

---

## Validation

```bash
npx @open-gitagent/gitagent validate
npx @open-gitagent/gitagent info
```

---

## Built with

- [gitagent](https://github.com/open-gitagent/gitagent) -- git-native agent standard
- [gitclaw](https://github.com/open-gitagent/gitclaw) -- agent runtime and SDK
- [arXiv API](https://arxiv.org) -- paper source
- [Semantic Scholar API](https://api.semanticscholar.org) -- citation data

---

## License

MIT
