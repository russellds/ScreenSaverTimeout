<#
    .Synopsis
       Prevents the screen saver from locking your screen.
    .DESCRIPTION
       Long description
    .EXAMPLE
       Example of how to use this cmdlet
    .EXAMPLE
       Another example of how to use this cmdlet
    .INPUTS
       Inputs to this cmdlet (if any)
    .OUTPUTS
       Output from this cmdlet (if any)
    .NOTES
        To prevent RDP sessions from ending, you must be focused on the RDP session.
#>
function Start-PreventScreenSaverTimeout
{
    [CmdletBinding()]
    param
    (
        # Param1 help description
        [Parameter(ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [string]$Key = "{F15}",
        [Parameter(ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [int]$Interval = 60
    )

    process
    {
        $properties = @{
            Name = 'PreventScreenSaverTimeout'
            ScriptBlock = {

                $myshell = New-Object -com "Wscript.Shell"

                while( $true ) {

                    Start-Sleep -Seconds $Interval

                    $myshell.sendkeys($Key)
                }
            }
        }

        Start-Job @properties
    }
}

<#
    .Synopsis
       Stops preventing the screen saver from locking your screen.
    .DESCRIPTION
       Stops the prevent screen saver timeout PowerShell job.
    .EXAMPLE
       Example of how to use this cmdlet
    .EXAMPLE
       Another example of how to use this cmdlet
    .INPUTS
       Inputs to this cmdlet (if any)
    .OUTPUTS
       Output from this cmdlet (if any)
    .NOTES
       General notes
#>
function Stop-PreventScreenSaverTimeout
{
    process
    {   
        Get-Job -Name 'PreventScreenSaverTimeout' |
            Remove-Job -Force
    }
}