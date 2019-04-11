# Create Support Dump

The script generates appliance and Logical Interconnect support dumps


## Prerequisites
The script requires:
   * the latest OneView PowerShell library : https://github.com/HewlettPackard/POSH-HPOneView/releases



## Syntax

```
   # The script will generate an appliance dump 
   $cred    = get-credential   # Provide admin credential to connect to OneView
    .\create-supportDump.ps1  -hostname  <FQDN-OneView> -credential $cred 

   # The script will generate an appliance dump and a Logical Enclosure dump that is a collection of all Logical Interconnect dumps
   $cred    = get-credential   # Provide admin credential to connect to OneView
    .\create-supportDump.ps1  -hostname  <FQDN-OneView> -credential $cred -logicalenclosurename Encl3

      # The script will generate an appliance dump and a Logical Interconnect support dump
   $cred    = get-credential   # Provide admin credential to connect to OneView
    .\create-supportDump.ps1  -hostname  <FQDN-OneView> -credential $cred -logicalInterconnect LI-IC6


```

    
