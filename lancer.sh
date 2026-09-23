#!/usr/bin/env bash
# Linux uniquement (sous Windows : « Windows - creer le raccourci.bat »).
# Ouvre la Forge de Commandes dans une nouvelle fenêtre du navigateur par défaut.
# Aucun serveur nécessaire : index.html est autonome.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
URL="file://$DIR/index.html"

desktop_id="$(xdg-settings get default-web-browser 2>/dev/null)"
if [ -n "$desktop_id" ]; then
    desktop_file="$(find /usr/share/applications "$HOME/.local/share/applications" /var/lib/flatpak/exports/share/applications -name "$desktop_id" 2>/dev/null | head -n1)"
    if [ -n "$desktop_file" ]; then
        bin="$(grep -m1 '^Exec=' "$desktop_file" | sed 's/^Exec=//; s/ %[a-zA-Z]//g' | awk '{print $1}')"
    fi
fi
if [ -n "$bin" ] && command -v "$bin" >/dev/null 2>&1; then
    "$bin" --new-window "$URL" >/dev/null 2>&1 &
elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$URL" >/dev/null 2>&1 &
else
    open "$URL"  # macOS
fi
