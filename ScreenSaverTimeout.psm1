<#
    .Synopsis
       Prevents screen savers from locking your screen.
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
function Suspend-ScreenSaverTimeout
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
        # Will prevent screen savers from locking your screen.
        #
        # To prevent RDP sessions from ending, you must be focused on the RDP session.

        $properties = @{
            Name = 'DisableScreenSaver'
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
       Prevents screen savers from locking your screen.
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
function Resume-ScreenSaverTimeout
{
    [CmdletBinding()]
    process
    {   
        # Will prevent screen savers from locking your screen.
        #
        # To prevent RDP sessions from ending, you must be focused on the RDP session.

        $properties = @{
            Name = 'DisableScreenSaver'
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

Disable-ScreenSaver