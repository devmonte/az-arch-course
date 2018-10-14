#!/bin/bash

SOLUTION_NAME=$1
ENVIRONMENT=$2 
RESOURCE_GROUP="${SOLUTION_NAME}-${ENVIRONMENT}-rg"
DEPLOYMENT="deployment-${RESOURCE_GROUP}"
az.cmd group deployment create --name $DEPLOYMENT --resource-group $RESOURCE_GROUP --template-file infrastructure.json --parameters ./infrastructure.parameters.json --debug