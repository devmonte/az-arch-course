#!/bin/bash

SOLUTION_NAME=$1 #4letters
ENVIRONMENT=$2 #4letters
LOCATION=$3
USERNAME=$4
PASSWORD=$5
STORAGE="ppllstorage"

echo "Start deploying azure infrastructure for homework of week-3!"
echo "Solution: $SOLUTION_NAME"
echo "Env: $ENVIRONMENT"
echo "Location: $LOCATION"

RESOURCE_GROUP="${SOLUTION_NAME}-${ENVIRONMENT}-rg"
DEPLOYMENT="deployment-${RESOURCE_GROUP}"

echo "Resource group: $RESOURCE_GROUP"
echo "Deployment name: $DEPLOYMENT"

az.cmd group create --name $RESOURCE_GROUP --location $LOCATION
# az.cmd storage account create -n $STORAGE --resource-group abcd-dcba-rg -l $LOCATION --sku Standard_LRS --kind StorageV2
az.cmd group deployment create --name $DEPLOYMENT --resource-group $RESOURCE_GROUP --template-file infrastructure.json --parameters adminUsername=$USERNAME adminPassword=$PASSWORD dns1LabelPrefix=$SOLUTION_NAME dns2LabelPrefix="${SOLUTION_NAME}2" vnetName=test-test-vnet subnet1Name=subnet1 subnet2Name=subnet2 storageAccountName=$STORAGE vmName1="pppp-${ENVIRONMENT}-vm" vmName2="qqqq-${ENVIRONMENT}-vm" --debug