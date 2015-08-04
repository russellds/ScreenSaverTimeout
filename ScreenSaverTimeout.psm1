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
       General notes
    .COMPONENT
       The component this cmdlet belongs to
    .ROLE
       The role this cmdlet belongs to
    .FUNCTIONALITY
       The functionality that best describes this cmdlet
    .Notes
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
        $Key = "{F15}"
    )

    process
    {
        $properties = @{
            Name = 'PreventScreenSaverTimeout'
            ScriptBlock = {

                $myshell = New-Object -com "Wscript.Shell"

                while( $true ) {

                    Start-Sleep -Seconds 60

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
       General notes
    .COMPONENT
       The component this cmdlet belongs to
    .ROLE
       The role this cmdlet belongs to
    .FUNCTIONALITY
       The functionality that best describes this cmdlet
#>
function Stop-PreventScreenSaverTimeout
{
    process
    {   
        Get-Job -Name 'PreventScreenSaverTimeout' |
            Remove-Job -Force
    }
}