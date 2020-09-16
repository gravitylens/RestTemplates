$global:url="https://my.app.local":
$global:headers=@{"Content-Type","application/json"}

function FunctionName {
    param (
        #Collect first parameter from command line or pipeline
        [Parameter(
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            Mandatory=$true
        )]
        [string]$Param1,

        #Collect second parameter from command line or pipeline
        [Parameter(
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            Mandatory=$true
        )]
        [string]$Param2
    )
    
    BEGIN{                          #Execute one time before looking at inputs
        $uri="$url/API/method"      #Complete the URI
        $method="POST"              #HTTP Verb
    }

PROCESS{                            #Do this once for each input
        $body=@{                    #Assemble body from parameters
            "Attribute1" = $Param1
            "Attribute2" = $Param2
        } | ConvertTo-Json          #Convert to JSON for Rest

        TRY{
            #Invoke the Rest Method and assign the response to $response
            $response=Invoke-RestMethod -Uri $uri -Method $method -Headers $headers -Body $body
        }
        CATCH{
            #If the Rest Method fails, assign an appropriate error message to $response
            $response="An Error Has Occured"
        }
        #Return Rest response or error message as necessary.
        return $response;
    }
}
