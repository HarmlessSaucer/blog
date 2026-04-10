# balharrie.uk

Personal website and blog at [balharrie.uk](https://balharrie.uk), built with [Hugo](https://gohugo.io) and the [Stack theme](https://github.com/CaiJimmy/hugo-theme-stack).

## Development

This repo uses a [Nix flake](flake.nix) to provide a reproducible development environment.

### Prerequisites

- [Nix](https://nixos.org/download/) with flakes enabled, or NixOS

### Getting started

Enter the dev environment:

```sh
nix develop
```

Start the local dev server (includes draft posts):

```sh
just dev
```

Then visit [http://localhost:1313](http://localhost:1313).

## Building

```sh
nix build
```

The output is written to `result/`.

## Deploying to GitHub Pages

### Automated (recommended) — GitHub Actions

1. In your GitHub repo, go to **Settings → Pages** and set the source to **GitHub Actions**.

2. Create `.github/workflows/deploy.yml` with the following:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          submodules: true

      - uses: cachix/install-nix-action@v27
        with:
          nix_path: nixpkgs=channel:nixos-unstable
          extra_nix_config: |
            experimental-features = nix-command flakes

      - name: Build
        run: nix build

      - uses: actions/upload-pages-artifact@v3
        with:
          path: result/

      - uses: actions/deploy-pages@v4
        id: deployment
```

Every push to `main` will build and deploy automatically.

### Manual

Build the site and deploy to the `gh-pages` branch in one step using the justfile:

```sh
just deploy
```

Or manually:

```sh
nix build

git checkout --orphan gh-pages
git rm -rf .
cp -r result/. .
git add .
git commit -m "Deploy"
git push origin gh-pages --force
```

Then in **Settings → Pages**, set the source to the `gh-pages` branch, root folder.
