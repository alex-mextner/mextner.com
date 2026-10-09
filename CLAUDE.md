# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a multilingual Hugo-based website for Mextner Lab, a consulting company focused on RAG-powered solutions. The site supports Russian and English languages, with English as the default language.

## Commands

### Development

```bash
# Start Hugo development server (don't do it, usually it's already runned)
hugo server -D

# Build the site and check everything (must have utility)
hugo

# Build with drafts included
hugo -D
```

### Common Hugo Commands

```bash
# Create new content
hugo new content/en/blog/new-post.md
hugo new content/ru/blog/new-post.md

# List all content
hugo list all

# Check configuration
hugo config
```

## Architecture

### Directory Structure

- `content/` - Multilingual content (en/ and ru/ subdirectories)
- `themes/mextner/` - Custom Hugo theme
- `static/` - Static assets
- `i18n/` - Translation files
- `memory-bank/` - Project documentation and style guides

### Theme Structure

The custom theme is located in `themes/mextner/` with:

- `layouts/` - Template files
- `assets/` - Processed CSS and JS
- `static/` - Static theme assets
- `i18n/` - Theme translations

### Key Configuration

- Base URL: <https://mextner.com/>
- Languages in subdirectories: /ru/ and /en/
- Custom theme: mextner

### Content Types

- Services (`/services/`)
- Workshops (`/workshops/`)
- Cases (`/cases/`)
- CTO services (`/cto/`)
- Blog (`/blog/`)

### Important Files

- `memory-bank/style-guide.md` - Brand voice and writing guidelines (use "we/our team" instead of "I/my")
- `themes/mextner/layouts/cases/section.html` - Custom case listing template
- `config/_default/languages.*.toml` - Language-specific configuration

### Development Notes

- When creating content, always use "we/our team" voice as per style guide
- Multilingual content should be created in both `/en/` and `/ru/` directories
- The theme uses custom partials for head, header, footer components
- Goldmark renderer is set to unsafe mode for HTML in markdown

## Deployment

Push to `main` → `.github/workflows/deploy.yml`: Hugo builds on a GitHub-hosted runner, then the
`deploy` job runs on the self-hosted runner `odroid-mextner` (home server) and rsyncs `public/` to
`/var/www/mextner.com`. `Caddyfile` is the origin config for `caddy-mextner.service`
(plain HTTP on `127.0.0.1:8081`, reloaded on change). TLS and public traffic go through
Cloudflare Tunnel `odroid-home` (DNS for mextner.com is on Cloudflare). Manual redeploy: `./deploy.sh`.
