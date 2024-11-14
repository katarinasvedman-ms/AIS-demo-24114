# AIS-demo-24114
    2. Deploy function code to Azure and choose the Function app you just provisioned above (named func-kapeltol2)
    3. Configure CORS for Function by adding '*'
    4. Test Function with payload from HubSpot to make sure you get 200 OK:
```
    [ { "eventId": 2939981204, "subscriptionId": 2925666, "portalId": 48111389, "appId": 4552876, "occurredAt": 1731605033992, "subscriptionType": "contact.propertyChange", "attemptNumber": 0, "objectId": 76943993468, "propertyName": "email", "propertyValue": "katarina.svedman@microsoft.com", "changeSource": "CRM_UI", "sourceId": "userId:74322246" } ]
```
    6. Navigate to ADF-integration/infra/la. 
    7. Add Environment variable to the Logic App deployed;"servicebus_connectionString" with value from your service bus, "azureFunctionOperation_functionAppKey" with a key from your Azure Function but also add variables from local.settings.json in
    8. Go to project for LA Workflow and deploy to Logic App workflow (C:\Users\kapeltol\src\LA-Hubspot-ASB\HS-BQ-ASB)
    9. Fill in values in settings.json (teanant and subscrition etc)
    10. Deploy to Logic app (for some reason I have to restart VS Code to find the logick app in Azure)
    11. Add environment variables as found in local.settings.json
    12. Navigate t othe logic app workflow and open designer. Edit "Send message" step with the connection the the service bus.
    13. Test Logic app with payload:
```
    [ { "eventId": 2939981204, "subscriptionId": 2925666, "portalId": 48111389, "appId": 4552876, "occurredAt": 1731605033992, "subscriptionType": "contact.propertyChange", "attemptNumber": 0, "objectId": 76943993468, "propertyName": "email", "propertyValue": "katarina.svedman@microsoft.com", "changeSource": "CRM_UI", "sourceId": "userId:74322246" } ]
```
    14. Verify that the message is in the service bus queue.
    15. Go to HubSpot and set up a webhook to your Logic app, test by changing email in a contact for instance
Add your Google BigQuery key in App Settings of the function: key=GoogleCloudKey (NOTE! The code for this is not tested and needs to be changed!)