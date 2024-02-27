# Cryptiz - Display Crypto Currencies (iOS)

This is an iOS app that displays the 200 latest crypto currencies from [https://coinmarketcap.com/api/documentation/v1/#operation/getV1CryptocurrencyListingsLatest](CoinMarketCap.com API lastest listing endpoint). 

The user can choose to display the exchange currency in USD, SEK or EUR for the crypto currencies in the list. It is also possible for the user to display more details of the crypto currency by pressing the on the crypto currency in the list, and if a user cannot easily find the currency of interest - there's a search function.

The user also have the option to change the language of the app, and can choose between English (default) and Swedish. The user needs to restart the app for the language to take an effect.

The user can update the value of the crypto currency with Pull to Refresh, but it is only possible to get fresh values once every minute (60s update rate).

## Getting Started
There are two builds for this project, Debug and Release. Debug uses CoinMarketCap's sandbox endpoint to display dummy data. Release uses the real endpoint, so an API-key is needed to be added in the file `release.xcconfig` in the path `./Cryptiz/Resources`.

To get an API-key, register a free tier account at CoinMarketCap and paste the API key you receive there, or if you already have access to one - use it. 

### Simple run
To just check that the app runs, use the Debug target and you'll be able to check out the functionalities of the app.
To display the crypto currencies, add your API key and choose the Release target. Now the list should be populated with crypto currencies from the Latest Listings endpoint of CoinMarketCap.com's API.

## Technologies used
This app is built with Swift and SwiftUI for the latest iOS target (iOS 17 at this time). 

