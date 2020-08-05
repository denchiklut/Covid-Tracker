//
//  HeaderView.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/5/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { (g: GeometryProxy) in
            Image("covid map")
                .resizable()
                .offset(y: g.frame(in: .global).minY > 0
                    ? -g.frame(in: .global).minY
                    : 0
            )
                
                .frame(height: g.frame(in: .global).minY > 0
                    ? UIScreen.main.bounds.height / 4 + g.frame(in: .global).minY
                    : UIScreen.main.bounds.height / 4
            )
        }.frame(height: UIScreen.main.bounds.height / 4)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
