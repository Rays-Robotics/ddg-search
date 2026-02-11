# ddg-search.sh

A tiny Bash helper script that performs quick DuckDuckGo web searches from the command line.

## Features

- Uses DuckDuckGo HTML results (no API keys required)
- Prints a compact list: result index, title, and URL
- Simple, dependency-light (curl, grep, sed, awk, paste)

## Requirements

- Bash
- `curl`
- Standard Unix tools: `grep`, `sed`, `awk`, `paste`, `head`

Most Linux distributions already include everything you need.

## Installation

Clone the repository:

```bash
git clone https://github.com/Rays-Robotics/ddg-search.git
cd ddg-search
```

Make the script executable:

```bash
chmod +x ddg-search.sh
```

(Optional) Add it to your PATH:

```bash
# From inside the repo
sudo cp ddg-search.sh /usr/local/bin/ddg-search
# or
cp ddg-search.sh "$HOME/bin/ddg-search"  # if you have ~/bin on your PATH
```

## Usage

Basic usage:

```bash
./ddg-search.sh "query" [count]
```

- `query` — the search string (required)
- `count` — number of results to show (optional, default: 5)

Example:

```bash
./ddg-search.sh "bitcoin price" 3
```

Sample output:

```text
[1] Bitcoin price today, BTC to USD live price, marketcap and chart ...
    https://example.com/link1

[2] Bitcoin USD Price (BTC-USD) - Yahoo Finance
    https://example.com/link2

[3] Current Bitcoin Price - Bitcoin Account Set Up
    https://example.com/link3
```

## Script Details

The script:

- Builds a DuckDuckGo HTML search URL for the given query
- Fetches the page with `curl`
- Extracts result titles and URLs from `<a class="result__a" ...>` links
- Pairs them into numbered entries with a simple, readable layout

Because it scrapes HTML, it may occasionally break if DuckDuckGo significantly changes their markup, but it’s easy to tweak in that case.

## Limitations

- HTML scraping only — no official API usage
- Text results only (no images, videos, or rich metadata)
- Best-effort parsing; not guaranteed to be stable forever

## License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.

See the [LICENSE](LICENSE) file for full details.
