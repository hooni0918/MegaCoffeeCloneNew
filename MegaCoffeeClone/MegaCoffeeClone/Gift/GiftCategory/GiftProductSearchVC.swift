//
//  ProductSearchViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/14.
//

import UIKit

class GiftProductSearchVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
}
