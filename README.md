## Génération des documents

### Prérequis

* ghostscript
* pandoc
* make

### Préparation

Chaque document à générer est constitué de plusieurs éléments à concaténer
(fichiers PDF ou Markdown qui seront convertis en PDF) dans un répertoire nommé
`20XX-XX-XX-description` à la racine du dépôt.

Au sein d'un dossier, les éléments seront concaténés dans l'ordre de leur nom
de fichier.

### Génération

Exécuter `make` à la racine du dépôt.  Les éléments Markdown sont convertis en
PDF puis un fichier `joined-20XX-XX-XX-XX.pdf` est créé à la racine pour chaque
répertoire.
