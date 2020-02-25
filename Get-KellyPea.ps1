function Get-KellyPea {
    param (
        
    )
    
    Begin {
        if (-not (Get-Variable -Name ChosenPeas -ErrorAction SilentlyContinue)) {
            $Global:ChosenPeas = New-Object System.Collections.Generic.List[Int]
        }

        if ($Global:ChosenPeas.Count -eq 15) {
            Write-Error "You have no Peas.  Please run Reset-KellyPea!!"
            break
        }
    }

    Process {
        $Pea = Get-Random -Minimum 1 -Maximum 16

        while ($ChosenPeas -contains $Pea) {
            $Pea = Get-Random -Minimum 1 -Maximum 16
        }

        $Global:ChosenPeas.Add($Pea)
        Write-Host "Your pea is: $Pea"
        Write-Host -NoNewLine 'Press any key to continue...'
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        Clear-Host
        Remove-Variable Pea
    }

    End {}
}