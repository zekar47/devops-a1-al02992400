#!/bin/sh

set -e
# Variables
BUCKET_NAME="${BUCKET_NAME:-"al02992400-a1"}"
REGION="${REGION:-"us-east-1"}"

# Crear bucket si no existe
aws s3 mb "s3://$BUCKET_NAME" --region "$REGION" 2>/dev/null || true

# Configurar hosting estatico
aws s3 website "s3://$BUCKET_NAME" \
    --index-document index.html

aws s3 cp index.html "s3://$BUCKET_NAME"
aws s3 cp style.css "s3://$BUCKET_NAME"

echo "Sitio desplegado en:"
echo "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
