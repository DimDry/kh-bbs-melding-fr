#!/usr/bin/env bash
# Arrête le serveur local de Forge de Commandes.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PIDFILE="$DIR/.server.pid"

MSG="Aucun serveur en cours."
if [ -f "$PIDFILE" ]; then
    PID="$(cat "$PIDFILE" 2>/dev/null)"
    if [ -n "$PID" ] && kill "$PID" 2>/dev/null; then
        MSG="Serveur arrêté."
    fi
    rm -f "$PIDFILE"
fi

if command -v notify-send >/dev/null 2>&1; then
    notify-send "Forge de Commandes" "$MSG" 2>/dev/null || true
fi
