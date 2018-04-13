consultation.gouv.fr catalogue les outils de consultations offerts aux administrations. À chaque outil est associée une courte description fonctionnelles, une documentation technique, d'éventuelles ressources supplémentaires et des cas d'usages.


## Public visé

consultation.gouv.fr s'adresse avant tout aux administrations française susceptibles de lancer des consulations
NG.md#ajouter-un-service) !


## Sous-domaines

Le nom de domaine `consultation.gouv.fr` héberge un catalogue d'outils et de cas d'usage.

Les sous-domaines en `*.consultation.gouv.fr` hébergent les outils catalogués sur `consultation.gouv.fr` et maintenus par la <abbr title="Direction interministérielle du numérique et du système d'information et de communication">DINSIC</abbr>.


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
La gestion et le déploiement du contenu du site se font via l'outil en
ligne [Forestry.io](https://forestry.io) (la documentation est
disponible sur http://forestry.io/docs/), couplé à
[CircleCI](https://circleci.com).

Forestry gère deux sites :
* le site de production http://consultation.etalab.gouv.fr via la branche "production"
* le site de pré-production/test http://pprod.consultation.etalab.gouv.fr via la branche "pprod"

À chaque édition de contenu depuis son interface graphique, Forestry
crée un commit git représentant ces modifications, et le pousse dans la
branche correspondante.

De son côté, CircleCI démarre un build dès qu'une modification est
poussée sur GitHub: après avoir construit le site statique, il le
déploie sur la machine qui correspond à la branche.

[Forestry.io]: https://forestry.io
[Jekyll]: http://jekyllrb.com/
[Ruby]: https://www.ruby-lang.org
[heroku]: https://dashboard.heroku.com/
