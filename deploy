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
    HOST="pprod.consultation.etalab.gouv.fr" ;;
  production)
    USER="ogptoolbox"
    HOST="consultation.etalab.gouv.fr" ;;
  *)
    usage
    exit 3 ;;
esac

echo "Start deploy"

ssh -tq ${USER}@${HOST} "bash -lc 'cd consultation.gouv.fr && git pull && bundle exec jekyll doctor && bundle exec jekyll build'"
rc=$?

if [ $? == 0 ] ; then
  echo "Deploy successful"
else
  echo "Deploy failed"
fi

exit $rc
