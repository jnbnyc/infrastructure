#!/usr/bin/env bash
# set -x
# check for missing variables
[ -n $DEPLOY_INVENTORY_PATH ] || exit 1
# [ -n $DEPLOY_APP_NAME ]       || exit 2

# exec ansible-playbook deploy.yml \
#        --vault-password-file=/vault/password.txt \
#        -i inventory/$DEPLOY_INVENTORY_PATH \
#        --extra-vars "deploy_app_name=$DEPLOY_APP_NAME deploy_app_version=master-0123456"

set -x
exec ansible-playbook playbooks/kubernetes.yml \
       -i inventory/$DEPLOY_INVENTORY_PATH \
       --tags deploy
# kubernetes-namespaces,kubernetes-secrets
