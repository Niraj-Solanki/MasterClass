//
//  BrowseViewModel.swift
//  MasterClass
//
//  Created by Neeraj Solanki on 17/10/20.
//  Copyright © 2020 Mr.Solanki. All rights reserved.
//

import UIKit

class BrowseViewModel {
    
    private let listItemsArray = ["FOOD","ARTS & ENTERTAINMENT","MUSIC","WRITING","SPORTS & GAMING","DESIGN & STYLE","BUSINESS","SCIENCE & TECH","HOME & LIFESTYLE","COMMUNITY"]
    
    
    init() {
        
    }
    
    var listItems:[String]{
        return listItemsArray
    }
    
}
