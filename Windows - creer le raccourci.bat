@echo off
rem Cree un raccourci "Forge de Commandes" sur le Bureau, puis ouvre l'application.
rem A lancer une seule fois : ensuite, utilise le raccourci du Bureau.
set "APPDIR=%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$d=$env:APPDIR; $desk=[Environment]::GetFolderPath('Desktop');" ^
  "$s=(New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $desk 'Forge de Commandes.lnk'));" ^
  "$s.TargetPath=(Join-Path $d 'index.html'); $s.IconLocation=(Join-Path $d 'icon.ico'); $s.WorkingDirectory=$d;" ^
  "$s.Description='Calculateur de fusions Kingdom Hearts Birth by Sleep'; $s.Save();" ^
  "Start-Process (Join-Path $d 'index.html')"
