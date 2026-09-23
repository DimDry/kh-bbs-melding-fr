# Forge de Commandes

Calculateur et explorateur des fusions de commandes de *Kingdom Hearts: Birth by Sleep*, entièrement en français.

Données recopiées depuis les tableaux de mixage de [Kingdom Hearts Destiny](https://www.khdestiny.fr/kingdom-hearts-birth-by-sleep-mixage.html) (khdestiny.fr).

## Fonctionnalités

- **Sélection du personnage** (Terra / Ventus / Aqua / Tous) : filtre l'ensemble de l'app sur ce que ce personnage peut réellement mixer.
- **Onglet « Mixer des commandes »** : un calculateur (2 commandes + cristal optionnel → résultat exact) et un explorateur filtrable/triable de toutes les recettes.
- **Onglet « Avancement »** : comme le menu « Capacités » du jeu, coche par personnage les capacités rendues permanentes, y compris les cumuls (ex. Attraction ×5, Booster Objet ×3). Maximums tirés de [KHWiki](https://www.khwiki.com/Abilities_(KHBBS)), recoupés avec [Destiny Islands](https://www.destinyislands.com/bbs-fm/abilities/). La progression est enregistrée dans le navigateur (localStorage), avec export/import (code à copier ou fichier .json) pour la sauvegarder ou la transférer sur un autre appareil.
- **Onglet « Partir d'une capacité »** : choisis la capacité que tu veux obtenir, l'app te montre les paires de commandes à mixer et le cristal nécessaire.

## Démarrage rapide

**En ligne, sans rien installer :** https://dimdry.github.io/kh-bbs-melding-fr/

**Ou en local :**

1. [**Télécharger l'app (ZIP)**](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/heads/main.zip), puis extraire le dossier.
2. Double-cliquer sur **`index.html`**.

C'est tout : pas d'installation, pas de serveur, pas de Python. Ça marche sous Windows, Linux et macOS, dans n'importe quel navigateur récent. `index.html` est autonome (toutes les données sont intégrées). Hors connexion, l'app fonctionne aussi, seules les polices changent.

> Ta progression (onglet « Avancement ») est enregistrée dans le navigateur. Pour la sauvegarder ou la passer sur un autre appareil, utilise les boutons « Exporter » et « Importer » de l’onglet (le bouton « ? » explique le fonctionnement).

### Raccourci sur le Bureau (optionnel)

- **Windows** : double-cliquer une fois sur `Windows - creer le raccourci.bat`. Un raccourci « Forge de Commandes » avec son icône apparaît sur le Bureau. Si Windows affiche « Windows a protégé votre ordinateur », cliquer sur *Informations complémentaires* puis *Exécuter quand même* (le script est lisible dans un éditeur de texte).
- **Linux** : lancer une fois `bash installer-linux.sh`. L'app est ajoutée au menu des applications et au Bureau, et s'ouvre dans une nouvelle fenêtre.
- **macOS** : clic droit sur `index.html` → *Créer un alias*, puis glisser l'alias sur le Bureau ou dans le Dock.

## Régénérer index.html après une modification des données ou du gabarit

`index.html` est un fichier généré, il ne doit pas être édité à la main. Les sources sont :

- `template.html` — gabarit HTML/CSS/JS, avec un marqueur `__RECIPES_JSON__` à la place des données.
- `recipes.json` — les 296 recettes de fusion (résultat, ingrédients, personnages autorisés, taux de réussite, capacités par cristal).

```bash
python3 build.py
```

Un mode `--fragment` existe aussi pour produire une version sans `<html>/<head>/<body>` (utile pour republier sur un artefact qui fournit déjà son propre squelette) :

```bash
python3 build.py --fragment fragment.html
```
