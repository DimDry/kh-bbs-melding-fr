#!/usr/bin/env bash
# Linux uniquement (sous Windows : « Windows - creer le raccourci.bat »).
# Ajoute « Forge de Commandes » au menu des applications et sur le Bureau.
# À lancer une seule fois :  bash installer-linux.sh
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
chmod +x "$DIR/lancer.sh"
ENTRY="[Desktop Entry]
Type=Application
Name=Forge de Commandes
Comment=Calculateur de fusions Kingdom Hearts Birth by Sleep
Exec=\"$DIR/lancer.sh\"
Icon=$DIR/icon.svg
Terminal=false
Categories=Game;Utility;"

mkdir -p "$HOME/.local/share/applications"
printf '%s\n' "$ENTRY" > "$HOME/.local/share/applications/forge-de-commandes.desktop"

DESKTOP="$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")"
if [ -d "$DESKTOP" ]; then
    rm -f "$DESKTOP/Forge de Commandes.desktop"  # ancien nom
    printf '%s\n' "$ENTRY" > "$DESKTOP/forge-de-commandes.desktop"
    chmod +x "$DESKTOP/forge-de-commandes.desktop"
    command -v gio >/dev/null 2>&1 && gio set "$DESKTOP/forge-de-commandes.desktop" metadata::trusted true 2>/dev/null
fi
echo "Raccourci installé (menu des applications et Bureau)."
"$DIR/lancer.sh"
