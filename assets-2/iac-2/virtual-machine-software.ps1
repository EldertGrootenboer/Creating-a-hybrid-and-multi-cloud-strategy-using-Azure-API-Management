Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install dotnetcore-sdk --version=2.1.803 -n allowGlobalConfirmation
choco install dotnetcore-sdk -n allowGlobalConfirmation
choco install git -n allowGlobalConfirmation
choco install nodejs-lts -n allowGlobalConfirmation
choco install docker-desktop -n allowGlobalConfirmation
choco install sql-server-express -n allowGlobalConfirmation
choco install ssms -n allowGlobalConfirmation
choco install vscode -n allowGlobalConfirmation