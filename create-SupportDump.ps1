Param ($credential , $hostname)

# Create folder to host backup and Dump
$currentFolder  = Split-Path $MyInvocation.MyCommand.Path
$folder         = "$currentFolder\OV-Dump"

if (-not (test-path $folder))
{
  md $folder
}


# Check connection
if (-not ($credential))
{
    $credential = get-credential -message "Please provide **** admin credential***  to log to OneView...."
}

if (-not ($hostname))
{
    $hostname   = read-host "Please provide the FQDN name or IP address of OneView"
}

write-host -foreground CYAN  '#################################################'
write-host -foreground CYAN  "Connecting to OneView ... $hostname"
write-host -foreground CYAN  '##################################################'
Connect-HPOVMgmt -hostname $hostname -Credential $cred

$timeStamp          = [DateTime]::Now.ToUniversalTime().ToString('yyyy-MM-ddTHH.mm.ss.ff.fffZzzz').Replace(':','')
$dmpfile            = "$folder\Appliance-$timeStamp" + ".dmp"
write-host -foreground CYAN "1#  save the Appliance support dump in $dmpfile"
New-HPOVSupportDump -location  $dmpfile -type appliance


write-host -foreground CYAN "1#  save the Logical Interconnect support dump in $dmpfile"
foreach ($LI in Get-HPOVLogicalInterconnect)
{
  $prefix   = $LI.name -replace " ",  "-" 
  $dmpfile  = "$folder\$prefix-$timeStamp" + ".dmp"
  $LI | New-HPOVSupportDump -location  $dmpfile 
} 

write-host -foreground CYAN "Disconnecting from OneView...."
Disconnect-HPOVMgmt -ApplianceConnection $global:connectedSessions