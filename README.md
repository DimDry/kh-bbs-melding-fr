# Forge de Commandes

Calculateur et explorateur des fusions de commandes de *Kingdom Hearts: Birth by Sleep*, entièrement en français.

Données recopiées depuis les tableaux de mixage de [Kingdom Hearts Destiny](https://www.khdestiny.fr/kingdom-hearts-birth-by-sleep-mixage.html) (khdestiny.fr).

## Fonctionnalités

- **Sélection du personnage** (Terra / Ventus / Aqua / Tous) : filtre l'ensemble de l'app sur ce que ce personnage peut réellement mixer.
- **Onglet « Mixer des commandes »** : un calculateur (2 commandes + cristal optionnel → résultat exact) et un explorateur filtrable/triable de toutes les recettes.
- **Onglet « Partir d'une capacité »** : choisis la capacité que tu veux obtenir, l'app te montre les paires de commandes à mixer et le cristal nécessaire.
- **Onglet « Obtenir une commande »** : choisis la commande que tu veux obtenir, l'app te montre les paires de commandes à mixer pour y arriver.
- **Onglet « Avancement »** : comme le menu « Capacités » du jeu, coche par personnage les capacités rendues permanentes, y compris les cumuls (ex. Attraction ×5, Booster Objet ×3). Maximums tirés de [KHWiki](https://www.khwiki.com/Abilities_(KHBBS)), recoupés avec [Destiny Islands](https://www.destinyislands.com/bbs-fm/abilities/). La progression est enregistrée dans le navigateur (localStorage), avec export/import (un code à copier, ou la même progression dans un fichier .json à télécharger) pour la sauvegarder ou la transférer sur un autre appareil.

## Démarrage rapide

**En ligne, sans rien installer :** https://dimdry.github.io/kh-bbs-melding-fr/

**Ou en local**, sans installation, sans serveur ni Python. Testé sous **Linux** et **Windows**. macOS n'a pas été testé, mais devrait fonctionner de la même façon.

### Windows

1. [**Télécharger l'app (ZIP)**](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/heads/main.zip).
2. **Extraire le ZIP** : clic droit sur le fichier téléchargé → *Extraire tout…* → *Extraire*.
   ⚠️ Étape obligatoire : si tu ouvres le ZIP et lances un fichier depuis l'intérieur, Windows ne copie que ce fichier dans un dossier temporaire, et l'app ou le raccourci ne fonctionnent pas.
3. Dans le **dossier extrait**, au choix :
   - double-cliquer sur **`index.html`** pour ouvrir l'app dans le navigateur ;
   - ou double-cliquer une fois sur **`Windows - creer le raccourci.bat`** : un raccourci « Forge de Commandes » avec son icône est créé sur le Bureau, et l'app s'ouvre. Ensuite, utilise ce raccourci.
     Si Windows affiche « Windows a protégé votre ordinateur », clique sur *Informations complémentaires* puis *Exécuter quand même* (le script est lisible dans un éditeur de texte).

Ne déplace pas le dossier après avoir créé le raccourci, sinon le raccourci ne le trouvera plus. Si tu le déplaces, relance le `.bat`.

### Linux

1. [Télécharger le ZIP](https://github.com/DimDry/kh-bbs-melding-fr/archive/refs/heads/main.zip) et l'extraire (ou `git clone` le dépôt).
2. Double-cliquer sur **`index.html`**.
3. Optionnel : lancer une fois `bash installer-linux.sh` pour ajouter l'app au menu des applications et au Bureau (elle s'ouvre alors dans une nouvelle fenêtre).

### macOS (non testé)

Extraire le ZIP, puis double-cliquer sur **`index.html`**. Pour un raccourci : clic droit sur `index.html` → *Créer un alias*, puis glisser l'alias sur le Bureau ou dans le Dock.

### Bon à savoir

- `index.html` est autonome : toutes les données sont intégrées. Hors connexion, l'app fonctionne aussi ; seules les polices changent.
- Ta progression (onglet « Avancement ») est enregistrée dans le navigateur. La version en ligne et la version locale ont chacune leur propre sauvegarde. Pour la sauvegarder ou la passer d'une version ou d'un appareil à l'autre, utilise les boutons « Exporter » et « Importer » de l'onglet (le bouton « ? » explique le fonctionnement).

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
