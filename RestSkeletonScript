##RestAPI Skeleton Script##

#Create a global header with Content-Type header
$global:headers = @{"Content-Type"="application/json"}

#BaseURL of the Application
$global:url="https://my.app.local"

#URI of Rest Method
$uri="$url/api/Method"

#HTTP Verb
$verb="POST"

#Form the body of the request
$body=@{
    key1 = "Value"
    key2 = "Value"
    array1 = @(
        "value1"
        "value2"
        "value3"
    )
} | ConvertTo-json

#Invoke the RestMethod.  The Response will contain the Authorization Key
$response = Invoke-RestMethod -uri $uri -Method $verb -Headers $headers -Body $body

write-host $response
