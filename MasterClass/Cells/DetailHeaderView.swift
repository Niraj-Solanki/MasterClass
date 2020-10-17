//
//  DetailHeaderView.swift
//  MasterClass
//
//  Created by Neeraj Solanki on 17/10/20.
//  Copyright © 2020 Mr.Solanki. All rights reserved.
//

import UIKit
class DetailHeaderView: UIView {
    @IBOutlet var contentView: DetailHeaderView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Life Cycle
       override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       private func commonInit() {
        Bundle.main.loadNibNamed("DetailHeaderView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
       }
    
    func configure(title:String) {
        titleLabel.text = title
    }
}
