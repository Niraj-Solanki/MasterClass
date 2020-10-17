//
//  ListCell.swift
//  MasterClass
//
//  Created by Neeraj Solanki on 17/10/20.
//  Copyright © 2020 Mr.Solanki. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var selectionHighlightView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        selectionHighlightView.isHidden = !selected
        titleLabel.textColor = (isSelected) ? ConstantKeys.selectedListCellTextColor : ConstantKeys.defailtListCellTextColor
    }
    
    func configureCell(itemName:String) {
        titleLabel.text = itemName
    }

}
