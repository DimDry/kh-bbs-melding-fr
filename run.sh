#!/usr/bin/env bash
# Démarre le serveur local de Forge de Commandes (si besoin) et l'ouvre dans le navigateur.
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PIDFILE="$DIR/.server.pid"
PORT=8000

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE" 2>/dev/null)" 2>/dev/null; then
    : # déjà lancé
else
    cd "$DIR"
    nohup python3 -m http.server "$PORT" > "$DIR/.server.log" 2>&1 &
    echo $! > "$PIDFILE"
    sleep 0.5
fi

xdg-open "http://localhost:$PORT/" >/dev/null 2>&1 &

if command -v notify-send >/dev/null 2>&1; then
    notify-send "Forge de Commandes" "Application ouverte sur http://localhost:$PORT/" 2>/dev/null || true
fi
