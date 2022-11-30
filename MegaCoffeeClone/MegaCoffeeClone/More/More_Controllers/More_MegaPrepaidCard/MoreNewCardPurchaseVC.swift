//
//  MoreNewCardPurchaseVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit

class MoreNewCardPurchaseVC: UIViewController {
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]




// MARK: [Layout]
extension MoreNewCardPurchaseVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        
    }
    
    func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "--"
        self.navigationItem.largeTitleDisplayMode = .never
        
    }
}

