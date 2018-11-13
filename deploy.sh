#! /bin/bash

# functions
usage() {
  echo "Usage: $0 <environment>"
  echo "  where <environment> is either pprod or production"
}

# main

if [[ $# != 1 ]] ; then
  usage
  exit 2
fi

ENV="$1"

case $1 in
  pprod)
    USER="consultation"
    HOST="pprod.consultation.etalab.gouv.fr"
    DIRECTORY="consultation-website" ;;
  production)
    USER="ogptoolbox"
    HOST="consultation.etalab.gouv.fr"
    DIRECTORY="consultation.gouv.fr" ;;
  *)
    usage
    exit 3 ;;
esac

echo "Start deploy"

ssh -o StrictHostKeyChecking=no -tq ${USER}@${HOST} "{ source .bash_profile || source /etc/profile ; } && cd ${DIRECTORY} && git pull && bundle install && bundle exec jekyll doctor && bundle exec jekyll build"
rc=$?

if [ $? == 0 ] ; then
  echo "Deploy successful"
else
  echo "Deploy failed"
fi

exit $rc
