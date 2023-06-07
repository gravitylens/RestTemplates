##RestAPI Skeleton Script##

# Headers
$headers = @{"content-type" = "application/json"}

# URI
$uri="$https://pvwa.cyberark.local/api/Method"

# HTTP Verb
$method="POST"

# Body
$body=@{
    key1 = "Value"
    key2 = "Value"
    array1 = @(
        "value1"
        "value2"
        "value3"
    )
} | ConvertTo-json

# Invoke the RestMethod.
$response = Invoke-RestMethod -uri $uri -Method $method -Headers $headers -Body $body

# Do something with the result
write-host $response
