//
//  ContentView.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePage().tabItem {
                Image(systemName: "house.fill")
            }
            Text("2").tabItem {
                Image(systemName: "bookmark.fill")
            }
            Text("3").tabItem {
                Image(systemName: "plus.circle.fill").font(.system(size: 36))
            }
            Text("4").tabItem {
                Image(systemName: "gear")
            }
            Text("5").tabItem {
                Image(systemName: "person.fill")
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //.previewDevice("iPhone 11 Pro Max")
    }
}
