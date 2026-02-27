"# Custom-PowerShell" 
if (!(Test-Path $PROFILE)) {
    New-Item -ItemType Directory -Path (Split-Path $PROFILE) -Force
    New-Item -ItemType File -Path $PROFILE -Force
}
notepad $PROFILE
