#!/bin/bash
# destroy-emergency.sh
# Uso: ./destroy-emergency.sh
set -euo pipefail

echo "⚠ Isso vai destruir TODA a infraestrutura gerenciada por Terraform."
read -p "Digite 'DESTROY' para confirmar: " confirm
if [ "$confirm" != "DESTROY" ]; then
  echo "Cancelado."
  exit 1
fi

cd terraform/aws  && terraform destroy -auto-approve
cd ../oci          && terraform destroy -auto-approve

echo "Destroy concluído."