#!/usr/bin/env bash
# Bascule la Forge de Commandes : l'ouvre si elle est fermée, la ferme si elle tourne déjà.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PIDFILE="$DIR/.server.pid"
PORT=8000

notify() {
    command -v notify-send >/dev/null 2>&1 && notify-send "Forge de Commandes" "$1" 2>/dev/null || true
}

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE" 2>/dev/null)" 2>/dev/null; then
    kill "$(cat "$PIDFILE")" 2>/dev/null
    rm -f "$PIDFILE"
    notify "Application fermée."
else
    cd "$DIR"
    nohup python3 -m http.server "$PORT" > "$DIR/.server.log" 2>&1 &
    echo $! > "$PIDFILE"
    sleep 0.5
    xdg-open "http://localhost:$PORT/" >/dev/null 2>&1 &
    notify "Application ouverte sur http://localhost:$PORT/"
fi
