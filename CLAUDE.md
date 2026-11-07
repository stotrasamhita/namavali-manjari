# Nāmāvali-mañjarī: stotra + nāmāvali project

Working notes for Claude on this repo. The repo is one book in the StotraSamhita
family; sibling clones live next to it in `/data1/karthik_data/StotraSamhita/`
(`stotra-sangrahah`, `puja-vidhanam`, `RamayanaRatnakara`, `vedamantra-book`,
`proofreader`, `stotrasamhita.github.io`, …). What the book is and how it builds:
`README.md`.

## The goal

Make each nāmāvali appear with the nāma-stotra it comes from, as Gita Press does:
the stotra (e.g. the aṣṭottaraśata-nāma-stotra) followed by the nāmāvali derived
from it. Three steps, each reviewed by the editor (Karthik) before the next:

1. **Inventory and mapping. Done 2026-10-21, awaiting review.**
   `docs/stotra-namavali-mapping.csv`, one row per text: `text, deity, names,
   namavali_file, in_book, stotra_source, match, status, notes`. The editor may
   edit it by hand; re-read it before acting on it, and treat it as the authority
   once approved.
2. **Fill the gaps** (after the mapping is approved).
   - Stotra exists, nāmāvali missing: derive the nāmāvali (name in the dative +
     नमः, see Conventions). Flag every name whose derivation is not mechanical
     (sandhi to undo, ambiguous word boundary, a name that could be read two
     ways, a variant reading) for review. Never guess silently.
   - Nāmāvali exists, stotra missing: list it for the editor to source. Never
     reconstruct a stotra from a nāmāvali.
   - Check each derived nāmāvali's name count against the expected count
     (108, 1000, 300, …) and report any mismatch.
3. **Restructure the book**: each entry = stotra, then its nāmāvali; a
   consistent layout and a clean TOC; typesetting at least as good as now.

**Ask before deciding** the order of deities, any editorial convention, or which
source to follow between variant readings. Present choices, don't pick.

## What Step 1 found (details in the CSV)

How pairs were found: `proofreader/corpus-checks/namastotra.py NAMAVALI STOTRA`,
run for every nāmāvali against every candidate stotra (2,352 runs), best match
kept. Match = share of names found in the stotra. Divyasthānīya lists score low
(40–53%) because each name is place + name; their pairings are still certain.

- **Paired (34).** Most at 89–100%. Weaker: Vakratuṇḍa 1000 (77%), Durgā 108
  (81.5%, a different recension from the stotra: source choice needed), Śiva
  1008 (85.7%, Mahābhārata recension). Rudra Triśatī pairs with the Vedic
  `vedamantra-book/mantras/RudraPrashnah.tex` (accents; not machine-checked).
- **Nāmāvali only (20)**: Rāma 1000, Ṣaṇmukha 1000; 108s of Candraśekharendra,
  Dakṣiṇāmūrti, Devasenā, Kāmākṣī, Kāverī, Kubera, Vallī, Mṛtyuñjaya, Nṛsiṃha
  (`Nrisimha_108`), Sūrya (`Surya_108`), Subrahmaṇya-astrāyudha, Veṅkaṭeśa
  (Varāha Purāṇa), Gaṇapati-2 (`Ganesha_108`), Gaṅgā-2 (`Ganga_108_2`), the three
  Rāmarahasya lists; Jagadānandakāraka 100 (from Tyāgarāja's kṛti).
- **Stotra only (22)**: 108s of Āditya, Gaṇeśa, Gaurī, Hariharaputra, Hayagrīva,
  Lakṣmī-Nārāyaṇa, Nṛsiṃha; Śrīraṅgarāja 108 (inside
  `TulaKaveriMahatmyam/TulaKaveriMahatmyam.tex`, adhyāya 16); Sūrya 1000, Śiva
  1000 (Viṣṇu-kṛta); and 12 short nāma-stotras (navagraha 21–28 names, 16- and
  12-name stotras), scope undecided.
- **Uncertain**: Lakṣmī-Nṛsiṃha 108 vs the Nṛsiṃha stotram (55%, out of order).

Open questions put to the editor (unanswered as of writing):
1. Do the 12 short nāma-stotras get nāmāvalis in this book?
2. Is the Rudra-praśna the "stotra" for Rudra Triśatī, and does it join the book?
3. Which of the 9 files not in the book come in (Durgā, Gaṇeśa-2, Gaṅgā-2,
   Kāmākṣī, Kāverī, Vyāsa, Rudra 300 and its `_compact` copy, Sundara-Hanumān 27)?
4. Durgā: follow the nāmāvali's recension or the stotra's?
5. Lakṣmī-Nṛsiṃha: pair with the Nṛsiṃha stotram or not?
6. Order of deities in the restructured book.

Known anomalies (from Phase D round 1; mostly kept on purpose, don't "fix"):
Rāma 1000 and Vakratuṇḍa 1000 have 1018 names; Dhanvantari 111, Godā 112,
Rāma 108 113, Sītā 111, Viṣṇu-divyasthānīya 112, Kubera 109; Śiva-divyasthānīya
has 100; `Nrisimha_108` has a `---` placeholder at name 92 (D1 row 31 open;
D1 rows 23 Veṅkaṭeśa णगवेङ्कटाय/गणवेङ्कटाय and 24 Gakārādi गीरसज्ञाय/गीरसन्नाय
also open) and carries the Lakṣmī-Nṛsiṃha title; `small/SundaraHanuman_27`
is titled हनुमदष्टोत्तरशतनामावलिः.

## Other books depend on these file paths

Moving or renaming any nāmāvali file breaks them. Keep the paths, or change
those repos in the same piece of work (and say so):
- `puja-vidhanam/pujas/*.tex`: 39 `\input{../namavali-manjari/...}` in 25
  files, using 30 nāmāvalis (Shiva_108 and Lakshmi_108 four times each; also
  Vishnu_1000, Shanmukha_1000, `300/Rudra_300_compact`, Vyasa_108, Ganga_108_2,
  Kamakshi, Kaveri, Durga, …). List them with
  `grep -rn "input{../namavali-manjari" ../puja-vidhanam/pujas/`.
- `RamayanaRatnakara/ramayana-ratnakara-mulam.tex`: Rama, Sita, Anjaneya and the
  three Rāmarahasya 108s.
- The website (`stotrasamhita.github.io`, `scripts/sync_content.py`) builds a page
  per nāmāvali from this repo; a restructure must keep it working (check the
  sync after pushing).

A natural Step 3 design that keeps all of this: leave each nāmāvali file where it
is, and have the book's master file `\input` the stotra from
`../stotra-sangrahah/stotras/...` and then the nāmāvali. Propose it; don't assume.

## Conventions

**A nāmāvali file** (see `100/Goda_108.tex`):
```
% !TeX program = XeLaTeX
% !TeX root = ../nAmA.tex
\chapt{गोदाष्टोत्तरशतनामावलिः}
\begin{multicols}{2}            % \maxColumns in the 1000s
\begin{flushleft}
श्रीरङ्गनायक्यै~नमः\\
...
श्रीधन्विपुरवासिन्यै~नमः\hfill\devanumber{10}\\   % every tenth name
...
\end{flushleft}
\end{multicols}
॥इति श्री-गोदाष्टोत्तरशतनामावलिः सम्पूर्णा॥
```
No ॐ before each name in the book files (the standalone
`Vishnu_1000_annotated.tex` has it). The Rudra Triśatī keeps its Vedic svaras.

**A stotra file** in stotra-sangrahah: a `% --meta--` block (deity, type,
chandas, source, wiki_title), `\sect{…}`, optional `\dnsub{ध्यानम्}` /
`\dnsub{स्तोत्रम्}`, verses in `\twolineshloka{…}{…}` or
`\fourlineindentedshloka{…}{…}{…}{…}` with `%N` verse numbers, a closing
`{॥इति …सम्पूर्णम्॥}`. This repo's `shloka.sty` defines the same macros
(\twolineshloka, \fourlineindentedshloka, \dnsub, \sect, \chapt, \uvacha,
\devanumber), so stotra files can be `\input` here. The two `shloka.sty` copies
have drifted slightly (verse spacing, verse-number placement); compare the
typeset result before relying on either.

**Deriving a name** (Step 2): the name as it stands in the stotra, sandhi undone
at its edges, in the dative singular of its gender (राम → रामाय, गोदा → गोदायै,
लक्ष्मी → लक्ष्म्यै, हरि → हरये, विष्णु → विष्णवे, भूभृत् → भूभृते), then `~नमः`.
Compounds stay joined. Which words form one name, and a name's gender, are
exactly the non-mechanical calls to flag.

**House style** (the whole corpus):
- Avagraha: ā+a → ाऽ; a+ā and ā+ā → ाऽऽ; a+a unmarked.
- A consonant-final word is written apart from the next (एतत् ते, यत् ते,
  कुर्यात् तस्य); -न् before न/म apart, except doubling before a vowel
  (राजन्नेतावत्) and त्→न् nasal sandhi (घोरान्मुच्यते); त्+ह → द्ध stays joined;
  fixed compounds stay joined (परात्पर, तत्तटे, तत्तादृश).
- Variant spellings are not standardised (कार्त्तिक and कार्तिक are both right).
  A reading the editor keeps is never "corrected" elsewhere as a side effect.
- The Gītā (`gita/`) is the super-gold reference; surface any disagreement.

## Tools

- `../proofreader/corpus-checks/namastotra.py NAMAVALI.tex STOTRAM.tex [OUT.tsv]`:
  checks a nāmāvali name by name against its stotra (stem search in the stotra's
  letter stream; out-of-order and nearest-match reporting). The pairing tool for
  Step 1 and the check for Step 2.
- `../proofreader/proof.py check FILE` (word and metre flags against the gold
  corpus); `../proofreader/corpus-checks/METHODS.md` describes every check.
  Save any new check there with a METHODS.md entry.
- Phase D review page (name-level decisions, DB collection `decisions`):
  https://claude.ai/artifact/KFJ5atKx2hN4Phk8QdrDdw. Use the same review-page
  pattern for Step 2's flagged names: rows with current/proposed/note, the
  editor accepts, rejects or edits each.
- No XeLaTeX on this machine: the editor builds the PDFs (`nAmA*.tex`) locally
  and commits them. Hand over clean `.tex`; say what needs a build.

## Working rules

- Commit and push only with the editor's OK. Identity:
  `git -c user.name="Karthik Raman" -c user.email=karthikraman@users.noreply.github.com`
  on commit and on `pull --rebase` / `rebase --continue`. The editor commits too:
  pull with rebase before pushing; push with
  `for i in 1 2 3; do timeout 90 git push -q && break; done`.
- After pushing content, sync the site:
  `gh workflow run "Sync corpus content" -R StotraSamhita/stotrasamhita.github.io`,
  then watch it and "Build and deploy site" with `gh run watch ID --exit-status`.
- Some `.tex` files are CRLF. Edit bytes (or `newline=''`) so line endings
  survive; check `git diff --stat` for diffs far larger than the edit.
- Never send the editor's email address to any service.
- Avoid `pkill -f` / `pgrep -f`, and `rm -rf` on paths built from variables.
- The scratchpad can be wiped by a reboot: keep anything that must survive
  (round files, builders) under `../proofreader/review/` (git-ignored) or here.
