//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Apple on 11/02/26.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject  private var vm : HomeViewModel
    @Binding var showPortfolio : Bool
    
    var body: some View {
       
        HStack {
            ForEach(vm.statistics) { stat in
                StaticView(stat: stat)
                    .frame(width : UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width : UIScreen.main.bounds.width ,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    let dev = DeveloperPreview.instance
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(dev.homeVm)
}
