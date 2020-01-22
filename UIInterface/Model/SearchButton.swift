//
//  SearchButton.swift
//  UIInterface
//
//  Created by Zerone on 17/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import Foundation

struct JobElement: Codable {
    let id: String
    let type: String
    let url: String
    let createdAt: String
    let company: String
    let companyUrl: String?
    let location: String?
    let title: String
    let description: String?
    let howToApply: String
    let companyLogo: String?

}
