//
//  HomeBarcodeViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/08.
//

import UIKit

class HomeBarcodeViewController: UIViewController {

    @IBOutlet weak var HomeBarcodeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    @IBAction func HomeBarcodeClose(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
}
