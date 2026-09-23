# Forge de Commandes

Calculateur et explorateur des fusions de commandes de *Kingdom Hearts: Birth by Sleep*, entièrement en français.

Données recopiées depuis les tableaux de mixage de [Kingdom Hearts Destiny](https://www.khdestiny.fr/kingdom-hearts-birth-by-sleep-mixage.html) (khdestiny.fr).

## Fonctionnalités

- **Sélection du personnage** (Terra / Ventus / Aqua / Tous) : filtre l'ensemble de l'app sur ce que ce personnage peut réellement mixer.
- **Onglet « Mixer des commandes »** : un calculateur (2 commandes + cristal optionnel → résultat exact) et un explorateur filtrable/triable de toutes les recettes.
- **Onglet « Partir d'une capacité »** : choisis la capacité que tu veux obtenir, l'app te montre les paires de commandes à mixer et le cristal nécessaire.

## Utiliser le site

Le fichier `index.html` est autonome (toutes les données sont intégrées dedans) : il peut être ouvert directement dans un navigateur, ou servi par n'importe quel serveur statique.

```bash
python3 -m http.server 8000
# puis ouvrir http://localhost:8000
```

### Lancement en un clic (Linux, avec environnement de bureau)

`./toggle.sh` bascule l'app : démarre le serveur local et l'ouvre dans le navigateur s'il est fermé, l'arrête s'il tourne déjà.

Un raccourci bureau (`~/Bureau/Forge de Commandes.desktop`) appelle ce script — pratique pour ouvrir/fermer l'app d'un double-clic, sans terminal.

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
