Configuration Diskconfig
{
  Import-DscResource -ModuleName PSDesiredStateConfiguration     
  Node localhost
  {
    # Leaves a timestamp indicating the last time this script was run on the node (this resource is intentionally not idempotent)
    Script DataDiskSettoF
    {
      SetScript = {
      # DataDisk Set to F:
Initialize-Disk -Number 2 -PartitionStyle GPT 
Write-Host "Initializing the Data Disk..."
New-Partition -DiskNumber 2 -DriveLetter F -UseMaximumSize
start-sleep 10 
Write-Host "Creating a new partition on the Data Disk and setting it to Drive Letter F..."
Format-Volume -DriveLetter F -FileSystem NTFS -NewFileSystemLabel "Data" -Confirm:$false
Write-Host "Format F drive to NTFS and Setting the name of the Drive to Data..."
    }
    TestScript = {
      $false
    }
    GetScript = {
      # Do Nothing
    }
  }
   Script LogDiskSettoG
    {
      SetScript = {
      # Log Disk Set to G:
Initialize-Disk -Number 3 -PartitionStyle GPT 
Write-Host "Initializing the Log Disk..."
New-Partition -DiskNumber 3 -DriveLetter G -UseMaximumSize
start-sleep 10 
Write-Host "Creating a new partition on the Log Disk and setting it to Drive Letter G..."
Format-Volume -DriveLetter G -FileSystem NTFS -NewFileSystemLabel "Log" -Confirm:$false
Write-Host "Format G drive to NTFS and Setting the name of the Drive to Log..."
    }
    TestScript = {
      $false
    }
    GetScript = {
      # Do Nothing
    }
  }
  Script TempDBDiskSettoH
    {
      SetScript = {
      # TempDB Disk Set to H:
Initialize-Disk -Number 4 -PartitionStyle GPT 
Write-Host "Initializing the TempDB Disk..."
New-Partition -DiskNumber 4 -DriveLetter H -UseMaximumSize
start-sleep 10 
Write-Host "Creating a new partition on the Log Disk and setting it to Drive Letter H..."
Format-Volume -DriveLetter H -FileSystem NTFS -NewFileSystemLabel "TempDB" -Confirm:$false
Write-Host "Format H drive to NTFS and Setting the name of the Drive to TempDB..."
    }
    TestScript = {
      $false
    }
    GetScript = {
      # Do Nothing
    }
  }
  }
  }

  
  

 