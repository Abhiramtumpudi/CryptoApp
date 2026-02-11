//
//  StaticView.swift
//  CryptoApp
//
//  Created by Apple on 09/02/26.
//

import SwiftUI

struct StaticView: View {
    
    let stat : StaticViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ?
                                          0 : 180))
                Text(stat.percentageChange?.asPercentageString() ?? "")
                    .font(.caption)
                    .bold()
                
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
        
    }
}

#Preview {
    Group {
        StaticView(stat: DeveloperPreview.instance.stat1)
        StaticView(stat: DeveloperPreview.instance.stat2)
        StaticView(stat: DeveloperPreview.instance.stat3)
            .preferredColorScheme(.dark)

    }
   
}
