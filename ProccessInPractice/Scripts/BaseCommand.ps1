#
# BaseCommand.ps1
#
#function buildVS
#{
#    # param
#    # (
#    #     [parameter(Mandatory=$true)]
#    #     [String] $path,

#    #     [parameter(Mandatory=$false)]
#    #     [bool] $nuget = $true,

#    #     [parameter(Mandatory=$false)]
#    #     [string] $clean = $true
#    # )
#    process
#    {
        $msBuildExe = 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'
        #$path = 'Freestyle_ProcessInPractice/ProccessInPractice.sln'
		$path = 'D:\Process_In_Practice\Source\ProccessInPractice.sln'

        #if($nuget){
            Write-Host "Restoring NuGet packages" -ForegroundColor Green
            nuget restore "$($path)"
        #}

        #if($clean){
            Write-Host "Cleaning $($path)" -ForegroundColor Green
            & "$($msBuildExe)" "$($path)" /t:Clean /m
        #}

        Write-Host "Building $($path)" -ForegroundColor Green
        & "$($msBuildExe)" "$($path)" /t:Build /m
#    }
#}