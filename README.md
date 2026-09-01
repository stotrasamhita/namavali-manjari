# नामावलिमञ्जरी · Nāmāvali-mañjarī

A LaTeX/Devanāgarī collection of *nāmāvaḷis* — litanies of a deity's names, each name
followed by *namaḥ* (॥नमः॥), used for *arcana* (worship with individual flower/name offerings)
and japa. Part of the [StotraSamhita](https://github.com/stotrasamhita) family of Sanskrit-text
projects.

## What's here

The nāmāvaḷis are grouped by length into three source folders, plus one for shorter/miscellaneous lists:

| Folder | Length | Contents |
|---|---|---|
| `1000/` | Sahasranāma (1000 names, or 1008 *aṣṭottara-sahasra*) | 7 nāmāvaḷis: Gakārādi Gaṇapati, Vakratuṇḍa Mahāgaṇapati, Rāma, Viṣṇu, Śiva (1008), Ṣaṇmukha, Sarasvatī (1008) — see [`1000/README.md`](1000/README.md). |
| `300/` | Triśatī (300 names) | Lalitā Triśatī, and Rudra Triśatī (in both a regular and a `_compact` layout) — see [`300/README.md`](300/README.md). |
| `100/` | Śatanāma / Aṣṭottara-śatanāma (100 or 108 names) | 45 nāmāvaḷis across many deities — see [`100/README.md`](100/README.md). |
| `small/` | Shorter lists | `SundaraHanuman_27` (27 names) — see [`small/README.md`](small/README.md). |

Each `.tex` file under these folders is `\chapt`-ed and `\input` by `nAmAvalis.tex`, the master
file that assembles all of them (grouped by length, as the three parts above) into the compiled
book.

Also at the root:

- `Vishnu_1000_annotated.tex` — a **standalone** edition of the Viṣṇu-sahasranāmāvali, each name
  prefixed with ॐ (unlike `1000/Vishnu_1000.tex`, see [`1000/README.md`](1000/README.md)). It
  embeds its own preamble rather than `\input`-ing the shared `preamble.tex`/`frontmatter.tex`, so
  it can be built independently, and it is not `\input` by `nAmAvalis.tex`.
- `nAmAvalis.tex` — the master file that `\input`s every nāmāvali into the compiled book, in three
  parts (sahasranāmāvaḷyaḥ, triśatī-nāmāvaḷyaḥ, śata-nāmāvaḷyaḥ).
- `frontmatter.tex`, `preamble.tex`, `shloka.sty`, `autocols.sty` — shared title page/colophon,
  LaTeX preamble, verse-typesetting macros, and an adaptive multi-column environment.

## Editions

| Source | Output | Notes |
|---|---|---|
| `nAmA.tex` | [`nAmA.pdf`](https://github.com/stotrasamhita/namavali-manjari/blob/master/nAmA.pdf) | Default digital edition (A5, twoside). |
| `nAmA-print.tex` | [`nAmA-print.pdf`](https://github.com/stotrasamhita/namavali-manjari/blob/master/nAmA-print.pdf) | Same A5 page, with wider gutter margins for physical binding. |
| `nAmA-kindle.tex` | [`nAmA-kindle.pdf`](https://github.com/stotrasamhita/namavali-manjari/blob/master/nAmA-kindle.pdf) | Kindle paperback size (126×168mm). |
| `nAmA-kindle-scribe.tex` | [`nAmA-kindle-scribe.pdf`](https://github.com/stotrasamhita/namavali-manjari/blob/master/nAmA-kindle-scribe.pdf) | Larger page (140×185mm) for the Kindle Scribe's screen. |

All four `\input` the same `frontmatter.tex`, `preamble.tex`, and `nAmAvalis.tex` — they differ only in page geometry.

## Per-deity single PDFs

`namavalis-pdf/`, `namavalis-kindle-pdf/`, and `namavalis-kindle-scribe-pdf/` are **mechanically generated mirrors** of `100/`, `300/`, and `1000/` — one standalone PDF per nāmāvali (handy for printing or sharing just one), in the same three page-size variants as the full book. They're built by each folder's `tex2pdf.sh`, which wraps every source `.tex` file in `nama-template.tex` and compiles it on its own; `namavalis-pdf/genFileListMd.sh` generates a Markdown index of all of them with download links, used for the StotraSamhita website. These folders aren't hand-edited — the source of truth is always `100/`, `300/`, and `1000/`.

## Building

The documents are written for **XeLaTeX** (`% !TeX program = XeLaTeX` at the top of each file), using `fontspec` for Devanāgarī, primarily the **Sanskrit 2003** font (`\setmainfont` in each top-level file; a commented-out `Siddhanta` alternative is also present). To build, for example:

```sh
xelatex nAmA.tex
xelatex nAmA.tex   # run twice for the table of contents
```

To regenerate the per-deity single PDFs: `cd namavalis-pdf && ./tex2pdf.sh` (and similarly for the `-kindle-pdf`/`-kindle-scribe-pdf` folders) — it only rebuilds files whose source `.tex` is newer than the existing PDF.

## Usage

The colophon in `frontmatter.tex` states the book is available online at the StotraSamhita site and is "For Personal Use Only — Not For Commercial Printing/Distribution."

---

*The README.md files on this repo were generated and beautified with Claude.*
