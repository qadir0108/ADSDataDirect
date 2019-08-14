SonarScanner.MSBuild.exe begin /k:"adsdatadirect"

MsBuild.exe /t:Rebuild

SonarScanner.MSBuild.exe end