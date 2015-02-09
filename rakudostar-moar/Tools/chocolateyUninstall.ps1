$rakudoFolder = "C:\rakudo"
$updateExe = Join-Path $atomFolder "Update.exe"

Start-Process -FilePath $updateExe -ArgumentList "--uninstall" -Verb "RunAs" -Wait
