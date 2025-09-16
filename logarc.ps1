$config = Import-PowerShellDataFile -Path .\logarc.psd1
function  write-log {
    param (
        [string]$message
    )
$timestamp = Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
    if (-not(Test-Path $config.logdir)){
        new-item -Path $config.logdir -ItemType Directory -Force|Out-Null
    }
    if (-not(test-path $config.logpath)){
        new-item -path $config.logpath -ItemType File|Out-Null
    }
    $entry = "$timestamp - $message"
    $entry|Out-File -FilePath $config.logpath -Append

return $entry
}
function get-file {
    param (
        [string]$directory
    )
    Get-childItem -path $directory|Where-Object {$_.Extension -eq ".log" -or $_.Name -like "*log*"}
}
function log-archive {
    param ([string]$path ="",
            [string]$filepath = ""
    )
        if ([string]::IsNullOrEmpty($filepath)){
            $filepath=$config.slogpath
        }
        if ([string]::IsNullOrEmpty($path)){
            $path= $config.slog
        }
$timestamp = Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
$files = get-file -directory $path
    $backupfile = Join-Path $filepath ("archivelog_$timestamp.tar.gz")
    if (-not($files))
    {write-log "megadott mappa üres"
    return
    }
    if($files){
        tar -czf $backupfile -C $path $($files.Name)
    }
    foreach ($i in $files){
        write-log "A fájlok sikeresen archiválva $($i.name) "}
        write-log $backupfile
    }
log-archive -filepath C:\Atika\logarch