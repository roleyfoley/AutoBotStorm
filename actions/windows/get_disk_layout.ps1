$CimPartInfo = get-partition 
foreach ($CimPart in $CimPartInfo) {
    if ($CimPart.Guid -eq $null) {
        $PartGUID = [regex]::match($CimPart.AccessPaths, 'Volume({[^}]+})').Groups[1].Value
    }
    else {
        $PartGUID = $CimPart.Guid
    }
    "Volume GUID $PartGUID"
    "`tDisk #     :`t$($CimPart.DiskNumber)"
    "`tPartition #:`t$($CimPart.PartitionNumber)"
    "`tDriveLetter:`t$($CimPart.DriveLetter)"
}