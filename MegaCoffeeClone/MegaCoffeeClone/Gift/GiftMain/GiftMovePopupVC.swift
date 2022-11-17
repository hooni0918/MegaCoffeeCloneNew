//
//  GiftMovePopupVC.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/15.
//

import UIKit

class GiftMovePopupVC: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    
    var vcRef: UIViewController?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 15

    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    @IBAction func moveToButtonClicked(_ sender: UIButton) {
        

        
//        guard let pvc = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? GiftDetailViewController else { return }
//
//        print(pvc)
//
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "shoppingView") as? GiftShoppingBasketVC else { return }
        
        self.dismiss(animated: false) {
            self.vcRef?.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
//        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailView") as? GiftDetailViewController else { return }
////        detailVC.isgoShopping = true
//
//
//        guard let pvc = self.presentingViewController else { return }
//        self.dismiss(animated: false) {
//            let shoppingVC = self.storyboard?.instantiateViewController(withIdentifier: "shoppingView") as! GiftShoppingBasketVC
//            let navController = UINavigationController(rootViewController: shoppingVC)
//            navController.modalTransitionStyle = .crossDissolve
//                navController.modalPresentationStyle = .fullScreen
//            shoppingVC.present(navController, animated:true, completion: nil)
//        }
        
    }
    
    

    
}

