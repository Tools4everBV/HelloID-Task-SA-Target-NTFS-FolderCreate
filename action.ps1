# HelloID-Task-SA-Target-NTFS-FolderCreate
##########################################
# Form mapping
$formObject = @{
    DisplayName = $form.DisplayName
    Path        = $form.Path
}

try {
    Write-Information "Executing NTFS action: [FolderCreate] for: [$($formObject.DisplayName)]"

    if (-not [System.IO.Directory]::Exists($formObject.Path)) {
        throw "[Parent] Folder Location [$($formObject.Path)] not exits"
    }

    $fullName = "$($formObject.Path)\$($formObject.DisplayName)"
    $createdFolder = New-Item -Path $fullName -ItemType Directory -Force -ErrorAction Stop

    $auditLog = @{
        Action            = 'CreateResource'
        System            = 'NTFS'
        TargetIdentifier  = "$($createdFolder.FullName)"
        TargetDisplayName = "$($createdFolder.FullName)"
        Message           = "NTFS action: [FolderCreate] for: [$($formObject.DisplayName)] executed successfully"
        IsError           = $false
    }
    Write-Information -Tags 'Audit' -MessageData $auditLog
    Write-Information "NTFS action: [FolderCreate] for: [$($formObject.DisplayName)] executed successfully"
} catch {
    $ex = $_
    $auditLog = @{
        Action            = 'CreateResource'
        System            = 'NTFS'
        TargetIdentifier  = "$($createdFolder.FullName)"
        TargetDisplayName = "$($createdFolder.FullName)"
        Message           = "Could not execute NTFS action: [FolderCreate] for: [$($formObject.DisplayName)], error: $($ex.Exception.Message)"
        IsError           = $true
    }
    Write-Information -Tags 'Audit' -MessageData $auditLog
    Write-Error "Could not execute NTFS action: [FolderCreate] for: [$($formObject.DisplayName)], error: $($ex.Exception.Message)"
}
##########################################
