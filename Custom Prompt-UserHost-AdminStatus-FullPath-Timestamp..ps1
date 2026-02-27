function prompt {

    $user = $env:USERNAME
    $computer = $env:COMPUTERNAME
    $path = (Get-Location).Path
    $time = Get-Date -Format "dd-MM-yyyy HH:mm:ss"

    # Safe Admin Check (single line, no parser issue)
    $identity  = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    $isAdmin   = $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    if ($isAdmin) {
        $role = "ADMIN"
        $roleColor = "Red"
    }
    else {
        $role = "USER"
        $roleColor = "Green"
    }

    Write-Host "[$user@$computer]" -NoNewline -ForegroundColor Cyan
    Write-Host " [$role]" -NoNewline -ForegroundColor $roleColor
    Write-Host " [$time]" -NoNewline -ForegroundColor Yellow
    Write-Host "`n[$path]" -NoNewline -ForegroundColor Magenta
    Write-Host "`n> " -NoNewline -ForegroundColor White

    return " "
}

cls