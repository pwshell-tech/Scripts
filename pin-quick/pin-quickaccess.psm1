function Pin-QuickAccess {
param(
		[Parameter(Mandatory, ValueFromPipeline)]
		[string]$Path
	)
    $load_com = New-Object -ComObject shell.application
    $load_quickaccess = $load_com.Namespace("shell:::{679F85CB-0220-4080-B29B-5540CC05AAB6}").Items() | Select-Object Path
    $test_pin_path = Test-Path -Path $Path
    if ($test_pin_path -eq $false) {
        Write-Host "Path does not exist. Please check your path!!"
        Break
    }
    if ($load_quickaccess.path -contains $Path ){
        Write-Host "Path already exists in Quick access"
    }
    if ($load_quickaccess.path -notcontains $Path ){
        Write-Host "Added path to Quick access"
        $load_com.Namespace($path).Self.InvokeVerb("pintohome")
    }
}