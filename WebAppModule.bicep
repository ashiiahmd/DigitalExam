param webAppName1 string
param webAppName2 string
param webAppName3 string

module webApp1 'WebAppDeploy.bicep' = {
  name: 'webApp1'
  params: {
    webAppName: webAppName1
    timezone: 'AUS Eastern Standard Time' // Set the desired timezone
  }
}

module webApp2 'WebAppDeploy.bicep' = {
  name: 'webApp2'
  params: {
    webAppName: webAppName2
    timezone: 'UTC' // Set the desired timezone (UTC for default)
  }
}

module webApp3 'WebAppDeploy.bicep' = {
  name: 'webApp3'
  params: {
    webAppName: webAppName3
    timezone: 'UTC' // Set the desired timezone (UTC for default)
  }
}

output webApp1Endpoint string = webApp1.outputs.webAppEndpoint
output webApp2Endpoint string = webApp2.outputs.webAppEndpoint
output webApp3Endpoint string = webApp3.outputs.webAppEndpoint
