function Reset-KellyPea {
    param ()
    
    Begin {}

    Process {
        if (Get-Variable ChosenPeas -ErrorAction SilentlyContinue) {
            Remove-Variable -Name ChosenPeas -Scope Global
        }
    }

    End {}
}