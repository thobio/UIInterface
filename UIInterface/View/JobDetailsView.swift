//
//  JobDetailsView.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct JobDetailsView: View {
    
    var job:JobElement
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Color"),Color("Color1")]), startPoint: .leading, endPoint: .trailing)
            ScrollView(.vertical, showsIndicators: false) {
                BodyView(jobs: job)
            }
            .navigationBarHidden(true)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CustomShape:Shape {
    func path(in rect:CGRect)-> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}
struct SmallSideShape:Shape {
    func path(in rect:CGRect)-> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}
struct OnSideNotRoundShape:Shape {
    func path(in rect:CGRect)-> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        return Path(path.cgPath)
    }
}
struct BodyView: View {
    var jobs:JobElement
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    var body: some View {
        VStack {
            HStack {
                WebImage(url: URL(string: jobs.companyLogo ?? "")).resizable().scaledToFit().frame(width: 200, height: 250).padding().shadow(color: Color("Color").opacity(0.5), radius: 5, x: 0, y: 3)
            }.frame(height: 250).background(Color.clear)
            DetailsView(jobs: jobs)
        }
    }
}

struct DetailsView: View {
    var jobs:JobElement
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    var body: some View {
        ZStack{
            Color.white
            DisplayTop(jobs: jobs)
            Spacer()
        }.clipShape(CustomShape()).shadow(radius: 3)
    }
}

struct Jobs: View {
    var jobs:JobElement
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    var body: some View {
        HStack {
            HStack(spacing:10){
                Image(systemName: "tag").frame(alignment: .center).foregroundColor(.white)
            }.frame(width: 60.0, height: 60.0).background(Color("smallBox1")).clipShape(SmallSideShape())
            Text(jobs.title).font(.system(size: 18)).fontWeight(.medium)
            Spacer()
        }
    }
}
struct Location: View {
    
    var jobs:JobElement
    
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    
    var body: some View {
        HStack {
            HStack(spacing:10){
                Image(systemName: "mappin.and.ellipse").frame(alignment: .center).foregroundColor(.white)
            }.frame(width: 60.0, height: 60.0).background(Color("smallBox2")).clipShape(SmallSideShape())
            Text(jobs.location ?? "Location is not specified." ).font(.system(size: 18)).fontWeight(.medium)
            Spacer()
        }
    }
}
struct TypeOfJob: View {
    
    var jobs:JobElement
    
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    
    var body: some View {
        HStack(spacing:10.0) {
            HStack(spacing:10){
                Image(systemName: "clock").frame(alignment: .center).foregroundColor(.white).font(.system(size: 20))
            }.frame(width: 60.0, height: 60.0).background(Color("smallBox3")).clipShape(SmallSideShape())
            Text(jobs.type).font(.system(size: 18)).fontWeight(.medium)
            Spacer()
        }
    }
}
struct CreateAt: View {
    
    var jobs:JobElement
    
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    
    var body: some View {
        HStack(spacing:10.0) {
            HStack(spacing:10){
                Image(systemName: "square.and.pencil").frame(alignment: .center).foregroundColor(.white).font(.system(size: 20))
            }.frame(width: 60.0, height: 60.0).background(Color("smallBox4")).clipShape(SmallSideShape())
            Text(jobs.createdAt.prefix(10)).font(.system(size: 18)).fontWeight(.medium)
            Spacer()
        }
    }
}


struct DisplayTop: View {
    var jobs:JobElement
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    var body: some View {
        VStack(spacing: 20.0) {
            Spacer()
            HeadingView(jobs: jobs)
            Jobs(jobs: jobs)
            Location(jobs: jobs)
            TypeOfJob(jobs: jobs)
            CreateAt(jobs: jobs)
            Desription(jobs: jobs)
            Spacer()
        }
    }
}

struct Desription : View {
    var jobs:JobElement
       init(jobs:JobElement) {
           self.jobs = jobs
       }
    var body: some View {
        ZStack{
            HStack{
                Text(jobs.description?.htmlStripped.prefix(100) ?? "").multilineTextAlignment(.leading).padding().foregroundColor(Color("Text")).background(Color("BoxColor")).clipShape(OnSideNotRoundShape())
            }.padding()
            Spacer()
        }.padding()
    }
}

struct HeadingView: View {
    var jobs:JobElement
    init(jobs:JobElement) {
        self.jobs = jobs
    }
    var body: some View {
        HStack{
            Text(jobs.company).fontWeight(.bold).font(.title).foregroundColor(Color("Color"))
        }
    }
}
extension String{
    var htmlStripped : String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

