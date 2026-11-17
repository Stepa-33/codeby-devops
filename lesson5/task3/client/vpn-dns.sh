#!/bin/sh
set -eu

case "${script_type:-}" in
  up)
    resolvectl dns "$dev" 1.1.1.1
    resolvectl domain "$dev" '~.'
    resolvectl default-route "$dev" yes
    ;;
  down)
    resolvectl revert "$dev" || true
    ;;
esac
