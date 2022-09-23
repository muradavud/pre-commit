#!/bin/sh

echo "$PWD"/.git/hooks/pre-commit

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.49.0 &&

cp "$BASEDIR"/pre-commit.sh "$PWD"/.git/hooks/pre-commit &&
cp "$BASEDIR"/commit-msg.sh "$PWD"/.git/hooks/commit-msg &&

chmod 755 "$PWD"/.git/hooks/pre-commit &&
chmod 755 "$PWD"/.git/hooks/commit-msg &&

echo "
linters:
  disable-all: false
  enable:
  - errcheck
  - gosimple
  - govet
  - ineffassign
  - staticcheck
  - typecheck
  - unused
" > "$PWD"/.golangci.yaml
