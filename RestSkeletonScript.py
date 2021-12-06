##RestAPI Skeleton Script##
##Python##

import json
import requests

#Create a header with Content-Type header
headers ={
    "content-type": "application/JSON"
}

#BaseURL of the Application
global url
url = "https://my.app.local"

#URI of Rest Method
uri = url + "/api/method"

#Form the body of the request
body = {
    "key1": "Value",
    "key2": "Value"
}

#Invoke the Rest Method
r = requests.post(uri,data=json.dumps(body),headers=headers,verify=False)

#Print the Response
print(r.content)
