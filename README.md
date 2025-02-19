# SwiftTitanSDK

All encompassing ServiceTitan SDK in pure Swift. ServiceTitan is a massive and popular enerprise resource planning software used by many businesses, and they are generous enough to provide an API to interact with their platform. This library completely encapsulates their entire API for easier development.

## Usage
```swift
let ST = SwiftTitanSDK(appKey: "<your key>", tenant: 1234, clientId: "<your id>", clientSecret: "<your secret>") {}

switch await ST.crm.customersGetList(tenant: ST.tenant) {
    case .success(let res):
        // Do something cool
    case .failure(let error):
        // Work through the issue
}
```
The SDK automatically handles authentication with respect to rate limits. 

## Test Suite

This is a work in progress, but the way you run the tests is by taking the `env.default` template and copying it to `.env`, then filling in your test data. Some tests require preparation on the server in order to run correctly. 

## Roadmap

- Complete reporting API
- Write unit tests
- Handle binary payloads
- Iron out error handling
- Test everything thoroughly
- Include better code documentation 

This library is currently in alpha and subject to changes in the future. The data structures are all fairly concrete, but once handling binary payloads is completed it may involve changes to how requests are made. 

## Special Thanks

- https://github.com/gohanlon/swift-memberwise-init-macro

## Disclaimer

SwiftTitanSDK is an independent project and is not affiliated with, endorsed by, or associated with ServiceTitan, Inc. in any way. **ServiceTitan** is a registered trademark of ServiceTitan, Inc. The use of the name is solely for descriptive purposes, and no rights to the trademark are claimed.
