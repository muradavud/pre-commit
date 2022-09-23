#!/bin/sh

curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.49.0 &&

cp ./pre-commit.sh ../.git/hooks/pre-commit &&
cp ./commit-msg.sh ../.git/hooks/commit-msg &&

chmod 755 ../.git/hooks/pre-commit &&
chmod 755 ../.git/hooks/commit-msg &&

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
" > ../.golangci.yaml
