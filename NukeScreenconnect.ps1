# from this process https://silentinstallhq.com/connectwise-control-screenconnect-silent-uninstall-powershell/ used to nuke malicious embedded screenconnects
# Built to uninstall the sticky malicious screeenconnect instances, when they are locked to system processes
# Modified to a run click program by Ethan Dykes

# Setup paths
$workDir = "C:\Downloads\Uninstall-ConnectWise_Control"
$zipPath = "C:\Downloads\PSADT.zip"
$extractPath = "C:\Downloads\PADT"
$location = "${env:ProgramFiles(x86)}\ScreenConnect Client*"

# Download Powershell App Deployment Toolkit
Write-Host "Downloading deployment toolkit..." -ForegroundColor Cyan
$downloadUrl = "https://github.com/PSAppDeployToolkit/PSAppDeployToolkit/releases/download/3.8.4/PSAppDeployToolkit_v3.8.4.zip"
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath
Unblock-File -Path $zipPath

# Extract and Organize
Write-Host "Extracting toolkit..." -ForegroundColor Cyan
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
Copy-Item -Path "C:\Downloads\PADT\Toolkit\AppDeployToolkit" -Destination "C:\Downloads\Uninstall-ConnectWise_Control\AppDeployToolkit" -Recurse
Remove-Item -Path $extractPath -Recurse -Force
Remove-Item -Path $zipPath -Force

# Copy the full Nuke from provided files to the detonator
Copy-Item -Path "C:\Downloads\NukePayload.ps1" -Destination "C:\Downloads\Uninstall-ConnectWise_Control\Uninstall-ConnectWise_Control.ps1"


# Once payload is in detonator position, run. 
Powershell.exe -ExecutionPolicy Bypass .\Uninstall-ConnectWise_Control\Uninstall-ConnectWise_Control.ps1 -DeploymentType "Uninstall" -DeployMode "NonInteractive"

# Confirm cleaned up
if (Test-Path $location) {
    Write-Host "Program Failed, Screenconnect still existent."
} else {
    Write-Host "Program Successful!"
}   

# Cleanup
Remove-Item -Path "C:\Downloads\*" -Recurse
