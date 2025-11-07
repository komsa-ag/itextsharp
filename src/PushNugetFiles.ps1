$ErrorActionPreference = "stop"
Set-StrictMode -Version Latest

[xml]$propsXml = Get-Content -Path "$PSScriptRoot\Directory.Build.props"
$currentVersion = $propsXml.SelectSingleNode("Project/PropertyGroup/KomsaITextSharpPackageVersion").InnerText

&dotnet nuget push -s "https://tfs-01/DefaultCollection/_packaging/Komsa/nuget/v3/index.json" -k AzureDevOps "$PSScriptRoot\Build\Release\Komsa.*.$currentVersion.nupkg"
pause