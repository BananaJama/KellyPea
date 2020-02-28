function Reset-KellyPea {
    param ()
    
    Begin {}

    Process {
        Remove-Item Env:\ChosenPeas
    }

    End {}
}