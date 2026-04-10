dev:
    hugo server -D

deploy:
    #!/usr/bin/env bash
    set -euo pipefail
    nix build
    DEPLOY_DIR=$(mktemp -d)
    git worktree add --orphan -b gh-pages "$DEPLOY_DIR" 2>/dev/null || \
        git worktree add "$DEPLOY_DIR" gh-pages
    rm -rf "$DEPLOY_DIR"/*
    cp -r result/. "$DEPLOY_DIR/"
    cd "$DEPLOY_DIR"
    git add .
    git commit -m "Deploy $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    git push origin gh-pages --force
    git worktree remove --force "$DEPLOY_DIR"
