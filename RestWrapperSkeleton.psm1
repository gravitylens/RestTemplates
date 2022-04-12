#Make the URL global since it will likely be consistent between all Rest methods
$global:headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$global:headers.Add("Content-Type", "application/json")
$global:url = "https://pvwa.acme.corp"

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
        $uri="$url/API/method"      #Append URI to the URL to identify the specific Rest Method
        $method="POST"              #HTTP Verb for the Rest Method
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
            $response = "ErrorCode: " + $_.Exception.Response.StatusCode.value__ + "`n"
            $response += "Uri: " + $uri + "`n"
            $response += "Method: " + $method + "`n"
            $response += "Body: " + $body + "`n"
            $response += "Headers: `n"# + $headers.GetEnumerator() | ForEach-Object { $_.Value }
            foreach ($key in $headers.Keys) { 
                $response += "$key -> $($headers[$key])`n" 
            } 
        }
        #Return Rest response or error message as necessary.
        return $response;
    }
    
    END{
        #Execute one time after looking at inputs
    }
}
