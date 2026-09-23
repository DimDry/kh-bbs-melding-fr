#!/usr/bin/env bash
# Bascule la Forge de Commandes : l'ouvre si elle est fermée, la ferme si elle tourne déjà.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PIDFILE="$DIR/.server.pid"
PORT=8000

notify() {
    command -v notify-send >/dev/null 2>&1 && notify-send "Forge de Commandes" "$1" 2>/dev/null || true
}

# Ouvre l'URL dans une nouvelle fenêtre du navigateur par défaut (pas un nouvel onglet).
open_new_window() {
    local url="$1" desktop_id desktop_file bin
    desktop_id="$(xdg-settings get default-web-browser 2>/dev/null)"
    if [ -n "$desktop_id" ]; then
        desktop_file="$(find /usr/share/applications "$HOME/.local/share/applications" -name "$desktop_id" 2>/dev/null | head -n1)"
        if [ -n "$desktop_file" ]; then
            bin="$(grep -m1 '^Exec=' "$desktop_file" | sed 's/^Exec=//; s/ %[a-zA-Z]//g' | awk '{print $1}')"
        fi
    fi
    if [ -n "$bin" ] && command -v "$bin" >/dev/null 2>&1; then
        "$bin" --new-window "$url" >/dev/null 2>&1 &
    else
        xdg-open "$url" >/dev/null 2>&1 &
    fi
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
    open_new_window "http://localhost:$PORT/"
    notify "Application ouverte sur http://localhost:$PORT/"
fi
