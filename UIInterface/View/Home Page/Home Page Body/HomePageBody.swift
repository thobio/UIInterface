//
//  HomePageBody.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI

struct HomePageBody: View {
    @ObservedObject var jobs = NetworkManager()
    var body: some View {
            VStack(alignment:.leading){
                Text("Recent Jobs").font(.title).fontWeight(.bold).padding(.leading)
                ForEach(self.jobs.jobResults,id: \.id) { job in
                    NavigationLink(destination: JobDetailsView(job:job)) {
                        ZStack{
                            Rectangle().foregroundColor(.white).cornerRadius(12.0).shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 6).padding(.horizontal)
                            HStack(alignment: .top){
                                Image(systemName: "dollarsign.circle").foregroundColor(.blue)
                                    .font(.title)
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text(job.company).foregroundColor(.secondary)
                                    Text(job.title).font(.title).fontWeight(.bold).foregroundColor(.black)
                                    Text(job.type).fontWeight(.semibold).foregroundColor(.black)
                                }
                                VStack {
                                    Image(systemName: "bookmark.fill")
                                    Spacer()
                                    Text(job.createdAt.prefix(10))
                                }.padding(.trailing).foregroundColor(.secondary)
                            }.padding()
                        }
                    }
                }
            }
    }
}

struct HomePageBody_Previews: PreviewProvider {
    static var previews: some View {
        HomePageBody()
            .previewLayout(.sizeThatFits)
    }
}
