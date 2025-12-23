//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Apple on 25/11/25.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    let showHoldingColumns : Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingColumns {
                centreColumn
            }
            rightColumn
           
        }
        .font(.headline)
    }
}

#Preview {
    Group{
        let dev = DeveloperPreview.instance.coin
        CoinRowView(coin: dev, showHoldingColumns: true)
        
    }
}


 
extension CoinRowView {
    
    private var leftColumn : some View {
        HStack(spacing : 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .padding()
            CoinImageView(coin: coin)
                .frame(width: 30 , height: 30)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading , 6)
                .foregroundStyle(Color.theme.accent)
                
        }
    }
    
    private var centreColumn : some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimeals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightColumn : some View {
        VStack(alignment : .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimeals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundStyle(
                    coin.priceChangePercentage24H ?? 0 >= 0 ?
                    Color.theme.green :
                        Color.theme.red
                )
                .frame(width: UIScreen.main.bounds.width / 3.5 , alignment: .trailing)
        }
    }
    
}
