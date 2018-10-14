#!/bin/bash

RG_POLICY="rg-naming-convention"
RG_ASSIGNMENT="check-rg-naming-convention"

VNET_POLICY="vnet-naming-convention"
VNET_ASSIGNMENT="check-vnet-naming-convention"

VMDISK_POLICY="vmdisk-naming-convention"
VMDISK_ASSIGNMENT="check-vmdisk-naming-convention"

STORAGE_POLICY="storage-naming-convention"
STORAGE_ASSIGNMENT="chec-storage-naming-convention"

VM_POLICY="vm-naming-convention"
VM_ASSIGNMENT="check-vm-naming-convention"



az.cmd policy definition create --name $RG_POLICY --rules vnet-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $RG_ASSIGNMENT --policy $RG_POLICY

az.cmd policy definition create --name $VNET_POLICY --rules vnet-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $VNET_ASSIGNMENT --policy $VNET_POLICY

az.cmd policy definition create --name $VMDISK_POLICY --rules vnet-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $VMDISK_ASSIGNMENT --policy $VMDISK_POLICY

az.cmd policy definition create --name $STORAGE_POLICY --rules vnet-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $STORAGE_ASSIGNMENT --policy $STORAGE_POLICY

az.cmd policy definition create --name $VM_POLICY --rules vnet-naming-convention-policy.json --mode All
az.cmd policy assignment create --name $VM_ASSIGNMENT --policy $VM_POLICY
