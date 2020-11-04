Clear-Host
$ErrorActionPreference= 'silentlycontinue'
Write-Host "This will remove all installed printers from the user's profile! Are you sure you want to continue?"  -BackgroundColor Red
Write-Host ""
Write-Host "Remove Printers? (y/n) "
$key = $Host.UI.RawUI.ReadKey()
if ($key.character -eq "y"){
    Clear-Host
    Get-Printer | Remove-Printer 
    Write-Host "Printers removed from user's profile!"
    Write-Host ""
    Write-Host "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 
}

if ($key.character -eq "n"){
    Clear-Host
    Write-Host "No printer changes were made!" -BackgroundColor black -ForegroundColor yellow
    Write-Host ""
    Write-Host "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 
}


