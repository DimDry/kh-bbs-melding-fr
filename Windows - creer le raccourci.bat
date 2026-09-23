@echo off
rem Windows uniquement (sous Linux : installer-linux.sh).
rem Cree un raccourci "Forge de Commandes" sur le Bureau, puis ouvre l'application.
rem A lancer une seule fois : ensuite, utilise le raccourci du Bureau.
set "APPDIR=%~dp0"
if not exist "%APPDIR%index.html" (
  echo.
  echo  Fichiers introuvables : le dossier n'a pas ete extrait du ZIP.
  echo  Fais un clic droit sur le fichier ZIP, puis "Extraire tout...",
  echo  et relance ce script depuis le dossier extrait.
  echo.
  pause
  exit /b 1
)
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$d=$env:APPDIR; $desk=[Environment]::GetFolderPath('Desktop');" ^
  "$s=(New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $desk 'Forge de Commandes.lnk'));" ^
  "$s.TargetPath=(Join-Path $d 'index.html'); $s.IconLocation=(Join-Path $d 'icon.ico'); $s.WorkingDirectory=$d;" ^
  "$s.Description='Calculateur de fusions Kingdom Hearts Birth by Sleep'; $s.Save();" ^
  "Start-Process (Join-Path $d 'index.html')"
