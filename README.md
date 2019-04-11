# Create Support Dump

The script generates appliance and Logical Interconnect support dumps


## Prerequisites
The script requires:
   * the latest OneView PowerShell library : https://github.com/HewlettPackard/POSH-HPOneView/releases



## Syntax

```
   $cred    = get-credential   # Provide admin credential to connect to OneView
    .\create-supportDump.ps1  -hostname  <FQDN-OneView> -credential $cred 

```

    
