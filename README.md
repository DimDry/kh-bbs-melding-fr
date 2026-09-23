# Forge de Commandes

Calculateur et explorateur des fusions de commandes de *Kingdom Hearts: Birth by Sleep*, en français et en anglais.

*[English version below](#english).*

Données recopiées depuis les tableaux de mixage de [Kingdom Hearts Destiny](https://www.khdestiny.fr/kingdom-hearts-birth-by-sleep-mixage.html) (khdestiny.fr).

## Fonctionnalités

- **Sélection du personnage** (Terra / Ventus / Aqua / Tous) : filtre l'ensemble de l'app sur ce que ce personnage peut réellement mixer.
- **Onglet « Mixer des commandes »** : un calculateur (2 commandes + cristal optionnel → résultat exact) et un explorateur filtrable/triable de toutes les recettes.
- **Onglet « Partir d'une capacité »** : choisis la capacité que tu veux obtenir, l'app te montre les paires de commandes à mixer et le cristal nécessaire.
- **Onglet « Obtenir une commande »** : choisis la commande que tu veux obtenir, l'app te montre les paires de commandes à mixer pour y arriver, et la capacité produite si tu ajoutes un cristal.
- **Onglet « Avancement »** : comme le menu « Capacités » du jeu, coche par personnage les capacités rendues permanentes, y compris les cumuls (ex. Attraction ×5, Booster Objet ×3). Maximums tirés de [KHWiki](https://www.khwiki.com/Abilities_(KHBBS)), recoupés avec [Destiny Islands](https://www.destinyislands.com/bbs-fm/abilities/). La progression est enregistrée dans le navigateur (localStorage), avec export/import (un code à copier, ou la même progression dans un fichier .json à télécharger) pour la sauvegarder ou la transférer sur un autre appareil.

- **Deux langues** : drapeaux 🇫🇷 / 🇬🇧 en haut à droite. En anglais, les noms de commandes, de capacités et de cristaux sont les noms officiels de la version anglaise du jeu (voir [plus bas](#english)). La sauvegarde et l'export gardent les noms français, donc une progression s'importe dans les deux langues.
- **Valider l'avancement sans quitter l'onglet** : dans les trois onglets de recherche, dès qu'une capacité est en jeu (cristal inséré, ou capacité recherchée) et qu'un personnage est sélectionné en haut, un bandeau « Valider (+1) » met à jour son avancement.

## Démarrage rapide

**En ligne, sans rien installer :** https://dimdry.github.io/kh-bbs-melding-fr/

**Ou en local**, sans installation, sans serveur ni Python. Testé sous **Linux** et **Windows**. macOS n'a pas été testé, mais devrait fonctionner de la même façon.

### Windows

1. [**Télécharger l'app (ZIP, V.1)**](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/tags/v1.0.zip).
2. **Extraire le ZIP** : clic droit sur le fichier téléchargé → *Extraire tout…* → *Extraire*.
   ⚠️ Étape obligatoire : si tu ouvres le ZIP et lances un fichier depuis l'intérieur, Windows ne copie que ce fichier dans un dossier temporaire, et l'app ou le raccourci ne fonctionnent pas.
3. Dans le **dossier extrait**, au choix :
   - double-cliquer sur **`index.html`** pour ouvrir l'app dans le navigateur ;
   - ou double-cliquer une fois sur **`Windows - creer le raccourci.bat`** : un raccourci « Forge de Commandes » avec son icône est créé sur le Bureau, et l'app s'ouvre. Ensuite, utilise ce raccourci.
     Si Windows affiche « Windows a protégé votre ordinateur », clique sur *Informations complémentaires* puis *Exécuter quand même* (le script est lisible dans un éditeur de texte).

Ne déplace pas le dossier après avoir créé le raccourci, sinon le raccourci ne le trouvera plus. Si tu le déplaces, relance le `.bat`.

### Linux

1. [Télécharger le ZIP](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/tags/v1.0.zip) et l'extraire (ou `git clone` le dépôt).
2. Double-cliquer sur **`index.html`**.
3. Optionnel : lancer une fois `bash installer-linux.sh` pour ajouter l'app au menu des applications et au Bureau (elle s'ouvre alors dans une nouvelle fenêtre).

### macOS (non testé)

Extraire le ZIP, puis double-cliquer sur **`index.html`**. Pour un raccourci : clic droit sur `index.html` → *Créer un alias*, puis glisser l'alias sur le Bureau ou dans le Dock.

### Bon à savoir

- `index.html` est autonome : toutes les données sont intégrées. Hors connexion, l'app fonctionne aussi ; seules les polices changent.
- Ta progression (onglet « Avancement ») est enregistrée dans le navigateur. La version en ligne et la version locale ont chacune leur propre sauvegarde. Pour la sauvegarder ou la passer d'une version ou d'un appareil à l'autre, utilise les boutons « Exporter » et « Importer » de l'onglet (le bouton « ? » explique le fonctionnement).

## Régénérer index.html après une modification des données ou du gabarit

`index.html` est un fichier généré, il ne doit pas être édité à la main. Les sources sont :

- `template.html` — gabarit HTML/CSS/JS, avec les marqueurs `__RECIPES_JSON__` et `__I18N_EN_JSON__` à la place des données.
- `recipes.json` — les 296 recettes de fusion (résultat, ingrédients, personnages autorisés, taux de réussite, capacités par cristal).
- `i18n-en.json` — noms anglais officiels des commandes et des capacités, et descriptions anglaises des capacités.

```bash
python3 build.py
```

Un mode `--fragment` existe aussi pour produire une version sans `<html>/<head>/<body>` (utile pour republier sur un artefact qui fournit déjà son propre squelette) :

```bash
python3 build.py --fragment fragment.html
```

---

<a id="english"></a>

# Forge de Commandes (English)

Command melding calculator and explorer for *Kingdom Hearts: Birth by Sleep*, in French and English.

Recipe data originally copied from the melding tables of [Kingdom Hearts Destiny](https://www.khdestiny.fr/kingdom-hearts-birth-by-sleep-mixage.html) (khdestiny.fr). English names are the official ones from the English version of the game: all 296 recipes were matched one by one against the [KH BBS Melding Calculator](https://khbbsmelding.com/) (same ingredients, success rates, characters and crystal abilities), and ability descriptions come from [KHWiki](https://www.khwiki.com/Abilities_(KHBBS)).

## Features

- **Character selection** (Terra / Ventus / Aqua / All): filters the whole app down to what that character can actually meld.
- **"Meld Commands" tab**: a calculator (2 commands + optional crystal → exact result) and a filterable/sortable explorer of every recipe.
- **"Start from an Ability" tab**: pick the ability you want, the app shows which pairs of commands to meld and the crystal to add.
- **"Get a Command" tab**: pick the command you want, the app shows which pairs of commands to meld to get it, and the ability produced if you add a crystal.
- **"Progress" tab**: like the in-game Abilities menu, tick for each character the abilities you've made permanent, stacks included (e.g. Treasure Magnet ×5, Item Boost ×3). Maximums from [KHWiki](https://www.khwiki.com/Abilities_(KHBBS)), cross-checked with [Destiny Islands](https://www.destinyislands.com/bbs-fm/abilities/). Progress is saved in the browser (localStorage), with export/import (a code to copy, or the same progress as a .json file to download) to back it up or move it to another device.
- **Two languages**: 🇫🇷 / 🇬🇧 flags at the top right. Saves and exports keep the French names, so progress can be imported in either language.
- **Record progress without leaving the tab**: in all three search tabs, as soon as an ability is involved (crystal added, or ability searched) and a character is selected at the top, a "Confirm (+1)" bar updates their progress.

## Quick start

**Online, nothing to install:** https://dimdry.github.io/kh-bbs-melding-fr/

**Or locally**, with no installation, server or Python. Tested on **Linux** and **Windows**. macOS hasn't been tested, but should work the same way.

### Windows

1. [**Download the app (ZIP, V.1)**](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/tags/v1.0.zip).
2. **Extract the ZIP**: right-click the downloaded file → *Extract All…* → *Extract*.
   ⚠️ Required step: if you open the ZIP and run a file from inside it, Windows only copies that one file to a temporary folder, and the app or the shortcut won't work.
3. In the **extracted folder**, either:
   - double-click **`index.html`** to open the app in your browser;
   - or double-click **`Windows - creer le raccourci.bat`** once: a "Forge de Commandes" shortcut with its icon is created on the Desktop, and the app opens. Use that shortcut from then on.
     If Windows shows "Windows protected your PC", click *More info* then *Run anyway* (the script can be read in any text editor).

Don't move the folder after creating the shortcut, or the shortcut won't find it anymore. If you do move it, run the `.bat` again.

### Linux

1. [Download the ZIP](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/tags/v1.0.zip) and extract it (or `git clone` the repository).
2. Double-click **`index.html`**.
3. Optional: run `bash installer-linux.sh` once to add the app to the applications menu and the Desktop (it then opens in a new window).

### macOS (untested)

Extract the ZIP, then double-click **`index.html`**. For a shortcut: right-click `index.html` → *Make Alias*, then drag the alias to the Desktop or the Dock.

### Good to know

- `index.html` is self-contained: all the data is built in. It also works offline; only the fonts change.
- Your progress ("Progress" tab) is saved in the browser. The online and local versions each keep their own save. To back it up or move it between versions or devices, use the "Export" and "Import" buttons in that tab (the "?" button explains how it works).

## Rebuilding index.html after changing the data or the template

`index.html` is a generated file and must not be edited by hand. The sources are:

- `template.html` — HTML/CSS/JS template, with `__RECIPES_JSON__` and `__I18N_EN_JSON__` markers in place of the data.
- `recipes.json` — the 296 melding recipes, in French (result, ingredients, allowed characters, success rate, ability per crystal).
- `i18n-en.json` — official English names of the commands and abilities, and the English ability descriptions.

```bash
python3 build.py
```

A `--fragment` mode also produces a version without `<html>/<head>/<body>` (useful to republish on an artifact that already provides its own skeleton):

```bash
python3 build.py --fragment fragment.html
```
