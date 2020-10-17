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
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var profileTableView: UITableView!
    
    //MARK:- Objects
    var viewModel:BrowseViewModel = BrowseViewModel()
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeVariables()
    }
    
    
    //MARK:- Custom Methods
    func initializeVariables() {
        
        profileTableView.register(viewModel.headerNib, forHeaderFooterViewReuseIdentifier: viewModel.reuseableHeaderIdentifier)
        categoryTableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        categoryTableView.layer.cornerRadius = 5
        categoryTableView.contentInset = viewModel.categoryContentInset
        profileTableView.contentInset = viewModel.profileContentInset
        
        // Default Selectd Cell
            categoryTableView.selectRow(at: viewModel.defaultIndexPath, animated: false, scrollPosition: .none)
        
    }
}

//MARK:- TableView Delegate & DataSource
extension BrowseViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableView == categoryTableView) ? viewModel.categoryItems.count : viewModel.categoryItems[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == categoryTableView {
            let listCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self)) as! ListCell
            listCell.selectionStyle = .none
            listCell.configureCell(itemName: viewModel.categoryItems[indexPath.row].title)
            return listCell
        }
        else{
            let detailCell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailCell.self)) as! DetailCell
            detailCell.selectionStyle = .none
            detailCell.configureCell(movie: viewModel.categoryItems[indexPath.section].items[indexPath.row])
            return detailCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (tableView == profileTableView) ? viewModel.categoryItems.count : 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (tableView == profileTableView) ? 60 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let detailHeader = DetailHeaderView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        detailHeader.configure(title: viewModel.categoryItems[section].headerTitle)
        return detailHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == categoryTableView {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
            viewModel.isScrollUpdate = false //Avoid Deep Scroll Bond
            self.profileTableView.scrollToRow(at: IndexPath(row: 0, section: indexPath.row), at: .top, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView == categoryTableView {
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    
}

//MARK:- Scrollview Deleagtes
extension BrowseViewController
{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView else {return}
        if tableView == profileTableView && viewModel.isScrollUpdate // No need to use when scrollToRow Called
        {
            let visibleCells = profileTableView.visibleCells
            if visibleCells.count > 0 {
                if let middleIndexPath = profileTableView.indexPath(for: visibleCells[(visibleCells.count / 2) - 1]), middleIndexPath.section <= categoryTableView.numberOfRows(inSection: 0){
                    categoryTableView.selectRow(at: IndexPath(row: middleIndexPath.section, section: 0), animated: false,   scrollPosition: .middle)
                }
            }
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView else {return}
        if tableView == profileTableView // No need to use when scrollToRow Called
        {
            self.viewModel.isScrollUpdate = true // Enable Scroll Update after Updated UI
        }
    }
}
