Import-Module posh-git

function Get-GitOneliner { & git log --oneline --graph --decorate }
Set-Alias -Name glog -Value Get-GitOneliner
Set-Alias -Name gll -Value Get-GitOneliner

function Get-DbtDep([string]$DbtModel) { & dbt ls --resource-type model -s "$DbtModel" }
Set-Alias -Name dbtdep -Value Get-DbtDep


$Env:PYENV = "$Env:USERPROFILE\.pyenv\pyenv-win\"
$Env:PYENV_ROOT = "$Env:USERPROFILE\.pyenv\pyenv-win\"
$Env:PYENV_HOME = "$Env:USERPROFILE\.pyenv\pyenv-win\"

$Env:PATH = "$Env:PYENV\bin;$Env:PYENV/shims;C:\Program Files\Vim\vim90;$Env:PATH"


$Env:AWS_DEFAULT_PROFILE = 'production-dwh'

Register-ArgumentCompleter -Native -CommandName aws -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        $env:COMP_LINE=$wordToComplete
        if ($env:COMP_LINE.Length -lt $cursorPosition){
            $env:COMP_LINE=$env:COMP_LINE + " "
        }
        $env:COMP_POINT=$cursorPosition
        aws_completer.exe | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
        Remove-Item Env:\COMP_LINE
        Remove-Item Env:\COMP_POINT
}
