//
//  HomePopupViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/23.
//

import UIKit

class HomePopupViewController: UIViewController {
    
    @IBOutlet weak var homePopupimage: UIImageView!
    
    @IBOutlet weak var homePopupMenu: UILabel!
    
    @IBOutlet weak var homePopupText: UILabel!
    
    @IBOutlet weak var homePopupClose: UIView!
    
    
    var imageReceived  = UIImage()
    var menuReceive : String = ""
    var menuText : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(menuReceive)
        
        //homePopupimage?.image = UIImage(named: imageReceived)
        homePopupMenu?.text = menuReceive
        homePopupText?.text = menuText
    }
    
    @IBAction func homeGoToOrder(_ sender: Any) {
        
            let vvc = self.storyboard?.instantiateViewController(withIdentifier: "orderVC")
            as? OrderViewController
            self.navigationController?.pushViewController(vvc!, animated: true)
    }
    
    @IBAction func homeGoToGift(_ sender: Any) {
        let popvc = self.storyboard?.instantiateViewController(withIdentifier: "orderVC")
          
        //vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
            popvc?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
            self.present(popvc!, animated: true, completion: nil)
    }
    
    @IBAction func homeClose(_ sender: Any) {
        self.dismiss(animated: false)
    }
   
}
