#!/bin/bash

RESOURCE_GROUP=$1
LOCATION=$2
KEY_VAULT_NAME=$3

SECRET_ONE_NAME=$4
SECRET_ONE_VALUE=$5
SECRET_TWO_NAME=$6
SECRET_TWO_VALUE=$7

az.cmd group create --name $RESOURCE_GROUP --location $LOCATION
az.cmd keyvault create --name $KEY_VAULT_NAME --resource-group $RESOURCE_GROUP --location $LOCATION --enabled-for-template-deployment true

az.cmd keyvault secret set --vault-name $KEY_VAULT_NAME --name $SECRET_ONE_NAME --value $SECRET_ONE_VALUE
az.cmd keyvault secret set --vault-name $KEY_VAULT_NAME --name $SECRET_TWO_NAME --value $SECRET_TWO_VALUE

