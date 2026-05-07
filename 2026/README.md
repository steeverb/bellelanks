# Belinda Lanks — 2026 Portfolio Refresh

This folder contains a cleaned-up rebuild of the original `belindalanks.com`
one-pager, plus two alternate design directions for client review.

All three are self-contained static sites. Open any `index.html` directly in
a browser, or run a local server from the `2026` folder:

```bash
cd "2026"
python3 -m http.server 8080
# then visit http://localhost:8080/01-refresh/
```

## What changed (across all three)

These fixes from the prior critique are applied to every direction:

- **Broken `mailto:` JS** — replaced with a real `mailto:blanks@gmail.com` link.
- **Magenta "Most Powerful Protest Art" link** — fixed the `<a href=a href=...>` typo.
- **Custom-font fallback drift** — every direction uses Google Fonts + a real
  system fallback so Windows users see what Mac users see.
- **Hero image blur** — Direction 1 swaps in `genevieve_claisse_petit_grumeau_2.jpg`
  (the 3188px source you already have) so it's sharp on Retina. Direction 2 uses
  it as a constrained masthead plate. Direction 3 drops the image entirely.
- **Hero too short** — all directions use ~88vh / `min-height` so the hero gets
  to land before the cards arrive.
- **Card sizing inconsistency** — fixed `aspect-ratio` on thumbnails (4:3 standard,
  16:9 for feature cards) so wide and narrow cards line up visually.
- **Pink/blue card hover + raw blue links** — replaced with a single accent color
  per direction, used consistently for hover, role tags, and contact links.
- **Touch targets** — icons and tap zones bumped to 44×44.
- **Focus states** — visible `:focus-visible` outlines on every interactive
  element (huge keyboard-navigation win).
- **`target="new"` → `target="_blank" rel="noopener"`** — standards-correct,
  more secure, and more performant.
- **Heading hierarchy** — one `<h1>` per page (the hero), `<h2>` for sections,
  `<h3>` for cards. Better for screen readers and SEO.
- **Skip link** — keyboard users can skip past the nav to main content.
- **Reduced-motion respect** — animations disabled when the user has
  `prefers-reduced-motion` set.
- **Smooth scroll + `scroll-margin-top`** — sticky nav doesn't crop section
  headers when jumping via anchor links.
- **Sticky nav with section highlight** — the active section is underlined as
  you scroll (Direction 1 + 3).

## The three directions

All three are the same content, the same IA, the same one-pager rhythm. They
differ in voice, type system, and visual chrome.

### `01-refresh/` — Refresh + Modernize *(closest to today)*

A faithful upgrade of the existing card-grid layout, with all the fixes above
plus a few modern niceties.

- **Type:** Manrope (geometric sans, Google Fonts) for headlines + Inconsolata
  for body and meta — preserves the "designer-mono" character.
- **Color:** warm-paper background (`#f4f1ea`), warm brick accent (`#b34418`),
  high-contrast ink. Dark mode is included (system preference + manual toggle).
- **Hero:** the existing Claisse line drawing, now sharp, with a darker
  gradient so the type sits cleaner.
- **Cards:** same idea as today, but with locked aspect ratios and a single,
  meaningful hover state (lift + accent border).
- **Logo wall:** dimmed grayscale by default, restores to color on hover so it
  reads as one calm "names" band rather than fifteen logos shouting.
- **Scroll-spy nav** highlights the section you're currently in.

**Best for:** clients who like the current site and want a sharper, more
modern, bug-free version of it. Lowest cognitive load for returning visitors.

### `02-editorial/` — Editorial / Serif-led *(magazine sensibility)*

Treats the portfolio like an issue of a literary magazine. Serif display,
asymmetric layout, a featured-case lead, and a typographic "masthead-style"
client list instead of a logo wall.

- **Type:** Fraunces (display serif, Google Fonts) + Inter for sans details.
- **Color:** warm cream (`#f5f0e6`), deep editorial vermilion accent
  (`#872617`). One paper-feeling palette throughout.
- **Hero:** a cover composition — kicker, large statement headline, a byline,
  and a constrained image plate with a caption. Reads like the cover of a quarterly.
- **Featured case:** a full editorial treatment of Samsung Explore — drop cap,
  deck, photo, role/client/output meta. Demonstrates "editorial strategy"
  through the page itself.
- **Bylines:** a lead byline followed by a grid — modeled on a magazine's
  contents page.
- **Client list:** typographic, two columns, alternating roman/italic. Reads
  as voice rather than logo wall.

**Best for:** clients who want the page itself to be a writing sample. Most
distinctive of the three. Strongest if Belinda's positioning is "editor first,
strategist second."

### `03-minimal/` — Minimal / Typographic *(brutalist-lite)*

No hero image. Mono-driven, list-based, voice-forward. Heavy whitespace,
single accent color, heavy reliance on type and rhythm.

- **Type:** JetBrains Mono for structure + Instrument Serif for display
  moments. The mono carries the editor/coder dual identity well.
- **Color:** dark default (`#0d0e10`) with burnt-orange accent (`#ff5c2b`);
  light variant included via system preference.
- **Hero:** numbered word stack — "01 Editor / 02 Strategist / 03 Writer" —
  followed by a paragraph signoff and an info-key/value strip. No image.
- **Work:** numbered list (001…007) with role + year in tabular numerals.
  Dense, high-information, scannable.
- **Clients:** a single typeset paragraph instead of a logo wall.
- **Writing:** date · title · publication tabular list. The whole archive in
  one read.

**Best for:** clients who want to feel "of right now" — designer-y, restrained,
and very easy to maintain (almost no images to update). Strongest if Belinda's
audience skews tech/design-product.

## Tradeoffs to discuss with the client

- **Direction 1 vs. 2** — does the page look like the work, or does the page
  *demonstrate* the work? If she's pitching editorial strategy, Direction 2's
  case-study-as-cover is a stronger argument; Direction 1 is safer.
- **Imagery vs. words** — Direction 3 is gorgeous and easy to maintain, but
  it asks the visitor to do more reading and to trust the type. The client
  list is just words; there are no pretty pictures of past work. Some hiring
  managers want logos.
- **Mode** — Direction 1 has both light + dark; Direction 2 is light-only
  (cream paper); Direction 3 is dark-default with light fallback. We can
  align all three to whichever the client prefers.
- **Hero image** — when Belinda has her own redrawn artwork, dropping it into
  any direction is a one-line CSS change in `style.css` (look for
  `--hero-bg` or `.hero__art` background-image). Direction 3 is the easiest
  to leave image-less indefinitely.
- **Mobile** — all three are responsive, but Direction 1's card grid handles
  middling viewports best. Direction 2's column-based "masthead list"
  collapses to a single column under 720px. Direction 3 was designed
  mobile-up; expect the cleanest narrow-viewport behavior.

## Known things still to do

- **Hero artwork** — currently the same Claisse line drawing. Replace with
  Belinda's redrawn artwork when ready (drop new files in
  `/2026/assets/images/` and update the path in each direction's style.css).
- **Self-host the chosen display face** if you want full performance independence
  from Google Fonts — easy follow-up.
- **Open Graph + Twitter meta tags** — not yet added; the original didn't have
  them either. Worth a 10-minute follow-up before the page goes live.
- **Favicon** — none in any direction yet.

## File layout

```
2026/
├── README.md                   ← this file
├── assets/
│   └── images/                 ← shared images (work, clients, icons, hero source)
├── 01-refresh/
│   ├── index.html
│   └── style.css
├── 02-editorial/
│   ├── index.html
│   └── style.css
└── 03-minimal/
    ├── index.html
    └── style.css
```

Each direction is fully self-contained in its folder and references shared
images via `../assets/images/`. Pull any one folder out, drop it next to the
`assets/` folder somewhere else, and it'll just work.
