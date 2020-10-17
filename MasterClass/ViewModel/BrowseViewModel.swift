//
//  BrowseViewModel.swift
//  MasterClass
//
//  Created by Neeraj Solanki on 17/10/20.
//  Copyright © 2020 Mr.Solanki. All rights reserved.
//

import UIKit

class BrowseViewModel {
    
   private let browseModel = BrowseDataModel()
    
    init() {}
    
    var categoryItems:[Profile]{
        return browseModel.categories
    }
    
    var headerNib:UINib{
          return UINib.init(nibName: "DetailHeaderView", bundle: nil)
      }
      
      var reuseableHeaderIdentifier:String{
          return "DetailHeaderView"
      }
    
    var categoryContentInset:UIEdgeInsets{
        return UIEdgeInsets(top: 20,left: 0,bottom: 20,right: 0)
    }
    
    var profileContentInset:UIEdgeInsets{
        return UIEdgeInsets(top: 50,left: 0,bottom: 50,right: 0)
    }
    
    var defaultIndexPath:IndexPath{
        return IndexPath(row: 0, section: 0)
    }
    
    
    var isScrollUpdate = true
}
