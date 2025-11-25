//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Apple on 23/11/25.
// GOCheck API
/*
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 86825,
 "market_cap": 1732439309236,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 1732439309236,
 "total_volume": 46636073477,
 "high_24h": 87088,
 "low_24h": 84051,
 "price_change_24h": 2343.6,
 "price_change_percentage_24h": 2.77409,
 "market_cap_change_24h": 46643283270,
 "market_cap_change_percentage_24h": 2.76684,
 "circulating_supply": 19952637,
 "total_supply": 19952637,
 "max_supply": 21000000,
 "ath": 126080,
 "ath_change_percentage": -31.23022,
 "ath_date": "2025-10-06T18:57:42.558Z",
 "atl": 67.81,
 "atl_change_percentage": 127766.29457,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2025-11-23T14:38:02.008Z",
 "sparkline_in_7d": {
 "price": [
 95583.82063841003,
 95761.64901782198,]
 },
 "price_change_percentage_24h_in_currency": 2.7740851653416985
 },
*/

import Foundation

// MARK: - Welcome
struct CoinModel : Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice, marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String
    let atl, atlChangePercentage: Double?
    let atlDate: String
    let lastUpdated: String
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?

}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
