#!/bin/bash

export VAULT_ADDR="https://vlt.rwx.dev"

vault policy write listmonk - <<EOF
path "secrets/data/listmonk" {
  capabilities = ["read", "list"]
}
EOF

vault write auth/k8s-skydive/role/listmonk \
    bound_service_account_names=listmonk \
    bound_service_account_namespaces=listmonk \
    policies=listmonk \
    ttl=24h

# vault secrets enable -version=2 -path=secrets kv

vault kv put secrets/listmonk @secret.json
