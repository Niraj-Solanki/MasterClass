//
//  BrowseViewController.swift
//  MasterClass
//
//  Created by Neeraj Solanki on 17/10/20.
//  Copyright © 2020 Mr.Solanki. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK:- Objects
    var viewModel:BrowseViewModel = BrowseViewModel()
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
    }
    
    
    //MARK:- Custom Methods
    func initializeVariables() {
    
        listTableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        listTableView.layer.cornerRadius = 5
        listTableView.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 20,right: 0)
        
        // Default Selectd Cell
        let indexPath = NSIndexPath(row: 0, section: 0)
        listTableView.selectRow(at: indexPath as IndexPath, animated: false, scrollPosition: .none)

    }
}

extension BrowseViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self)) as! ListCell
        listCell.selectionStyle = .none
        listCell.configureCell(itemName: viewModel.listItems[indexPath.row])
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
