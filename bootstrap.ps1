
# The following may need to run

#Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

# Need to run this as administrator
# Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service
ssh-add $Env:HOMEDRIVE$Env:HOMEPATH\.ssh\id_ed25519
exit 0
ssh-keygen -t ed25519



winget install vim.vim
winget install JetBrains.PyCharm.Community
winget install Microsoft.Git

Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

