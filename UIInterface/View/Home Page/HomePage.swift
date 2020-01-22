//
//  HomePage.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                HomePageHeader().frame(height:220).background(LinearGradient(gradient: Gradient(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .trailing))
                RecentJobScrollView().offset(y:-20)
                }
            .edgesIgnoringSafeArea(.all)
            .padding(0)
           .navigationBarHidden(true)
            }.accentColor(.white)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct RecentJobScrollView : View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HomePageBody()
        }
    }
}
