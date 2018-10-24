#!/bin/bash

RESOURCE_GROUP=$1
LOCATION=$2
VMSS_NAME=$3
IMAGE=$4
ADMIN=$5

az.cmd group create --name RESOURCE_GROUP --location LOCATION
az.cmd vmss create --resource-group RESOURCE_GROUP --name VMSS_NAME --image IMAGE --upgrade-policy-mode automatic --admin-username ADMIN