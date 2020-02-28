function Get-KellyPea {
    param ()
    
    Begin {
        $ChosenPeas = New-Object System.Collections.Generic.List[int]
        if (Test-Path Env:\ChosenPeas) {
            foreach ($i in $env:ChosenPeas.Split(':')) {
                $ChosenPeas.Add($i)
            }
        }
    }

    Process {
        if ($ChosenPeas.Count -eq 15) {
            Write-Error "You need to reset the pea counter!!"
            break
        }

        $Pea = Get-Random -Minimum 1 -Maximum 16
        while ($ChosenPeas -contains $Pea) {
            $Pea = Get-Random -Minimum 1 -Maximum 16
        }
        $ChosenPeas.Add($Pea)
        $env:ChosenPeas = $ChosenPeas -join ':'

        Write-Host "Your pea is: $Pea"    
        Write-Host -NoNewLine 'Press any key to continue...'
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        Clear-Host
    }

    End {}
}