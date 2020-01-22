//
//  NetworkManager.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    @Published var jobResults = [JobElement(id: "", type: "", url: "", createdAt: "", company: "", companyUrl: "", location: "", title: "", description: "", howToApply: "" , companyLogo: "")]
    let urlString = "https://jobs.github.com/positions.json?description=python&full_time=true&location=sf"
    init() {
        guard let url = URL(string: urlString) else{ return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                guard let data = data else { return }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode([JobElement].self, from: data)
                DispatchQueue.main.async {
                    self.jobResults = result
                }
            }catch {
                print("Sorrry...\(error)")
            }
        }.resume()
    }
}

