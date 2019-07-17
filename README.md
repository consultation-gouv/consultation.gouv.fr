[![Build Status](https://api.travis-ci.org/consultation-gouv/deploiement.consultation.svg?branch=master)](https://travis-ci.org/consultation-gouv/deploiement.consultation)

https://consultation.etalab.gouv.fr catalogue les outils de consultations offerts aux administrations. À chaque outil est associée une courte description fonctionnelles, une documentation technique, d'éventuelles ressources supplémentaires et des cas d'usages.


## Public visé

https://consultation.etalab.gouv.fr s'adresse avant tout aux administrations française susceptibles de lancer des consulations.

## Sous-domaines

Le nom de domaine `consultation.etalab.gouv.fr` pointe vers un catalogue d'outils et de cas d'usage.

Les sous-domaines en `*.consultation.etalab.gouv.fr` hébergent les outils catalogués sur `consultation.etalab.gouv.fr` et maintenus par la <abbr title="Direction interministérielle du numérique et du système d'information et de communication">DINSIC</abbr>.


## Installation locale

Il est nécessaire de récupérer les sources avec la commande :

``` sh
git clone https://github.com/consultation-gouv/consultation.gouv.fr
cd consultation.gouv.fr
```

Il existe ensuite deux manières de lancer le site sur sa machine :

* Utiliser Jekyll directement.
* Utiliser Docker.

Ces deux méthodes sont indépendantes et détaillées ci-dessous.

### Jekyll

Le site utilise [Jekyll], un générateur de site statique en [Ruby].

#### Dépendances

* [Ruby](https://www.ruby-lang.org/en/downloads/). Il est recommandé d'utiliser un système de virtualisation comme [RVM](https://rvm.io/) ou [RbEnv](https://github.com/rbenv/rbenv). La version à utiliser est : `2.3`
* [bundle](http://bundler.io/). La commande a lancer est : `gem install bundle`

#### Commandes

* `bundle install` pour installer toutes les dépendances nécessaires
* `bundle exec jekyll serve` pour lancer un serveur de développement. Il suffit de se rendre sur l'URL indiquée à l'exécution de la commande.
* `bundle exec jekyll build` pour générer le site dans le répertoire `_site`.
* `bundle update` pour mettre à jour les dépendances et le `Gemfile.lock`

### Docker

#### Dépendances

* [Docker](https://docs.docker.com/engine/installation/) (version > 1.10)
* [docker-compose](https://docs.docker.com/compose/install/) (version > 1.6)

#### Commandes

* `docker-compose up`. Il suffit de se rendre sur l'URL indiquée à l'exécution de la commande.

## Hébergement 

Le site est hébergé sur un VPS.

## Déploiement

La gestion du contenu du site se fait manuellement, en clonant le dépôt
et en éditant les fichiers nécessaires (l'outil en ligne
[Forestry.io](https://forestry.io) ne supporte plus, depuis mi-2018,
l'édition en ligne de contenu HTML).

Les déploiements sont quant à eux automatisés via
[CircleCI](https://circleci.com): ce dernier démarre un build dès qu'une
modification est poussée sur GitHub. Après avoir construit le site
statique, il est potentiellement déployé :

  - si la branche est pprod ou production, CircleCI déploie aussi le
    site sur la machine correspondante
  - si la branche est master, le site est uniquement construit mais
    aucun déploiement n'est effectué

Les modifications centrales, n'ayant pas trait à du contenu, doivent
donc être préférentiellement réalisées sur master, afin de bénéficier de
la validation automatique.

Une fois le contenu et l'aspect du site validés sur le site de
pré-production, les mises en production s'effectuent simplement en
créant une PullRequest GitHub, depuis la branche pprod vers la branche
production :

  1. Ouvrir https://github.com/consultation-gouv/consultation.gouv.fr
  2. Choisir la branche "pprod"
  3. Cliquer sur "New pull request"
  4. Dans la page qui s'ouvre, laisser "pprod" à droite de la flèche
     (origine de la pull request), et choisir "production" à gauche
     (destination de la pull request), puis valider
  5. Laisser l'intégration continue CircleCI se terminer
  6. Une fois qu'elle est validée, vous pouvez cliquer sur "Merge" pour
     finaliser la pull request
  7. CircleCI va lancer le déploiement en production, ce qui prendra
     quelques minutes

[Forestry.io]: https://forestry.io
[Jekyll]: http://jekyllrb.com/
[Ruby]: https://www.ruby-lang.org
[heroku]: https://dashboard.heroku.com/
## Auteur et licence

2017-2019 DINSIC/Etalab

Le code source de ce dépôt est publié sous licence GNU Affero General
Public License (voir [LICENSE](LICENSE)).

