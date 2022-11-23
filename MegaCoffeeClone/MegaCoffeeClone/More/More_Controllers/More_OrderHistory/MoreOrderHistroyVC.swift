//
//  MoreOrderHistroyVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit

class MoreOrderHistroyVC: UIViewController {
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]




// MARK: [Layout]
extension MoreOrderHistroyVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.isHidden = true
        
        naviCustom()
        
        
    }
    
    func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "주문내역"
        self.navigationItem.largeTitleDisplayMode = .never
        
    }
}
