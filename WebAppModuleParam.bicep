param webAppNames object = {
  webApp1: 'mywebapp1'
  webApp2: 'mywebapp2'
  webApp3: 'mywebapp3'
}

module webApps './WebAppModule.bicep' = {
  name: 'webApps'
  params: {
    webAppName1: webAppNames.webApp1
    webAppName2: webAppNames.webApp2
    webAppName3: webAppNames.webApp3
  }
}

output webApp1Endpoint string = webApps.outputs.webApp1Endpoint
output webApp2Endpoint string = webApps.outputs.webApp2Endpoint
output webApp3Endpoint string = webApps.outputs.webApp3Endpoint
