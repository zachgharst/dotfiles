# You must set scripts to be unsigned to use this profile:
#   Set-ExecutionPolicy Unrestricted

### Prompt ###
function prompt {
    $path = ($pwd.Path -eq $home) ? "~" : (Split-Path -Path $pwd -Leaf)

    Write-Host $path -NoNewline -ForegroundColor Cyan

    if (Test-Path .git) {
        Write-BranchName
    }

    return " "
}

function Write-BranchName() {
    try {
        $branch = git rev-parse --abbrev-ref HEAD
        $color = "Green"

        if ($branch -eq "HEAD") {
            $branch = git rev-parse --short HEAD
        }
        elseif ($branch -eq "main") {
            $color = "Red"
        }
    } catch {
        $branch = "no branches yet"
        $color = "Yellow"
    }
    Write-Host " ($branch)" -NoNewline -ForegroundColor $color
}

### Environment Variables ###
$repos = "$HOME/repos"
$githubUsername = "zachgharst"
$githubDirectory = "$repos/github.com/$githubUsername"
$downloads = "$HOME/downloads"

### Remove Pre-Existing Aliases ###
Remove-Alias gp -Force

### Git Functions ###
function gs { git status }
function gac { git add . && git commit }
function gp { git push }
function graphme { git log --oneline --graph --decorate }

function nbom {
    [CmdletBinding()]
    param (
        [parameter(position = 0)]
        [string]$branchName
    )
    git checkout main && git pull && git checkout -b user/$githubUsername/$branchName
}

### CD Aliases ###
function gh { Set-Location -Path $githubDirectory }
function repos { Set-Location -Path $repos }

function .. { Set-Location -Path ".." }
function ... { Set-Location -Path "../.." }
function .... { Set-Location -Path "../../.." }
function ..... { Set-Location -Path "../../../.." }
function ...... { Set-Location -Path "../../../../.." }

### Aliases ###
function which { Get-Command }
function profile { . $env:EDITOR $PROFILE }

function vim() {
    param (
        [Parameter(position = 0, Mandatory = $False)]
        [string] $path
    )

    nvim $path
}

function mkcd() {
    param (
        [Parameter(position = 0, Mandatory = $True)]
        [string] $directory
    )

    New-Item -Path $directory -ItemType Directory
    Set-Location -Path $directory
}

function sln() {
    if ((Get-ChildItem *.sln | Measure-Object).Count -eq 1) {
        . .\*.sln
    }
    else {
        Write-Host "Multiple solutions found. Opening the first one."

        Get-ChildItem *.sln | Select-Object -First 1 | % { . $_ }
    }
}

function gimmeguid() {
    $guid = New-Guid
    Set-Clipboard $guid

    return $guid
}

### Imports ###
$imports = @(
    "~/.config/powershell/microsoft_profile.ps1"
)

foreach ($import in $imports) {
    if (Test-Path $import) {
        . $import
    }
}
