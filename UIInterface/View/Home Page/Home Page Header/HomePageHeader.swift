//
//  HomePageHeader.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI

struct HomePageHeader: View {
    var body: some View {
            VStack {
                SearchTextFieldView()
                StackItem()

            }
    }
}

struct HomePageHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomePageHeader()
            .previewLayout(.sizeThatFits)
    }
}

//MARK:- Search TextField View

struct SearchTextFieldView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            TextField("Search", text: $search)
            Image(systemName: "magnifyingglass")
        }.padding().background(Color.white).clipShape(Capsule())
        .padding()
    }
}

//MARK:- Search StackItem View


struct StackItem: View {
    let buttons = [SearchButton(image: "magnifyingglass", label: "Filter"),
                   SearchButton(image: "mappin.and.ellipse", label: "Location"),
                   SearchButton(image: "square.grid.2x2.fill", label: "Category")]
    
    var body: some View {
        HStack{
            ForEach(buttons, id: \.self) {item in
            Button(action: {
            
            }) {
                HStack{
                    Image(systemName: item.image)
                    Text(item.label)
                }
            }.padding(10).background(Color.black.opacity(0.20)).cornerRadius(8.0).padding(.horizontal,4).accentColor(Color.white)
          }
        }
    }
}

struct SearchButton: Hashable {
    let image: String
    let label: String
}
