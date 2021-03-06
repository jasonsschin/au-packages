﻿$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.10955/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.10955/Teams_windows_x64.exe'
$checksum32 = '9efbd5c85fd9d2938cf63ddfdfc3856ac9610a892657b48cedaa6eca8199e3c6'
$checksum64 = '63455d2330ff228882c4fa06b1b94128f7c4bbe0552edcbfeb878773008acfdf'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'microsoft-teams*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "-s"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
