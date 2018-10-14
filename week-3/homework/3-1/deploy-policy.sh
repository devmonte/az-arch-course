#!/bin/bash

RG_POLICY="rg-naming-convention"
RG_ASSIGNMENT="check-rg-naming-convention"

VNET_POLICY="vnet-naming-convention"
VNET_ASSIGNMENT="check-vnet-naming-convention"

VMDISK_POLICY="vmdisk-naming-convention"
VMDISK_ASSIGNMENT="check-vmdisk-naming-convention"

STORAGE_POLICY="storage-naming-convention"
STORAGE_ASSIGNMENT="check-storage-naming-convention"

VM_POLICY="vm-naming-convention"
VM_ASSIGNMENT="check-vm-naming-convention"


echo "Start executing az commands!"
az.cmd policy definition create --name $RG_POLICY --rules rg-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $RG_ASSIGNMENT --policy $RG_POLICY

az.cmd policy definition create --name $VNET_POLICY --rules vnet-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $VNET_ASSIGNMENT --policy $VNET_POLICY

az.cmd policy definition create --name $VMDISK_POLICY --rules vmdisk-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $VMDISK_ASSIGNMENT --policy $VMDISK_POLICY

az.cmd policy definition create --name $STORAGE_POLICY --rules storage-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $STORAGE_ASSIGNMENT --policy $STORAGE_POLICY

az.cmd policy definition create --name $VM_POLICY --rules vm-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $VM_ASSIGNMENT --policy $VM_POLICY
echo "Stop executing az commands!"