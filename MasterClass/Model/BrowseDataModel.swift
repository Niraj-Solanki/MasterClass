//
//  BrowseDataModel.swift
//  MasterClass
//
//  Created by Neeraj Solanki on 17/10/20.
//  Copyright © 2020 Mr.Solanki. All rights reserved.
//

import UIKit
class BrowseDataModel {
    
    var categories:[Profile] = []
    
    init() {
        for item in ConstantKeys.categoryArray {
            categories.append(Profile(name: item))
        }
    }
}

struct Profile {
    let title:String
    let headerTitle:String
    var items:[Movie]
    
    init(name:String) {
        title = name
        items = []
        for _ in 0...Int.random(in: 5..<20) {
            let profile = ConstantKeys.profiles[Int.random(in: 0..<10)]
            self.items.append(Movie.init(imageUrl: profile["image"] ?? "0", title: profile["title"] ?? "Nobady", subtitle: profile["subtitle"] ?? "Faceless Man"))
        }
        headerTitle = "\(name)\n\(items.count) MOVIES"
    }
}

struct Movie {
    let imageUrl:String
    let title:String
    let subtitle:String
}
