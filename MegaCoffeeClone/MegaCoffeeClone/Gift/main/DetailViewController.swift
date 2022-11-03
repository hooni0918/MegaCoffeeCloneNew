//
//  DetailViewController.swift
//  MegaCoffeeClone
//
//  Created by 준연 on 2022/10/27.
//

import UIKit

class DetailViewController: ViewController {
    

    var location: IndexPath?
    
    @IBOutlet weak var DetailMenuImageView: UIImageView!
    
    @IBOutlet weak var DetailMenuNameLabel: UILabel!
    
    @IBOutlet weak var DetailMenuExplanationLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var plusView: UIView!
    
    @IBOutlet weak var minusView: UIView!
    
    @IBOutlet weak var numberOf: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusView.layer.cornerRadius = plusView.frame.width / 2
        minusView.layer.cornerRadius = minusView.frame.width / 2
        numberOf.sizeToFit()
        
       
        
        updateUI()
        
        let concernPlusGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedPlus(_:)))
        plusView.addGestureRecognizer(concernPlusGesture)
        let concernMinusGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedMinus(_:)))
        minusView.addGestureRecognizer(concernMinusGesture)
        
        let concernDetailGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        DetailMenuImageView.isUserInteractionEnabled = true
        DetailMenuImageView.addGestureRecognizer(concernDetailGesture)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
    }
    
    var number = 1
    
    func makeDecimal(integer: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let result = numberFormatter.string(from: NSNumber(value: integer)) else { return "" }
        return "\(String(describing: result))원"
    }
    
    @objc func tappedPlus(_ gesture: UITapGestureRecognizer) {
        number += 1
        if number > 20 {
            number = 20
        }
        numberOf.text = "\(number)"
        
        
        
        let intPrice = Int(priceLabel.text!)!
        let totalPirce = intPrice * number
        let strPrice = makeDecimal(integer: totalPirce)
        totalPrice.text = strPrice
        print(strPrice)
    }
    
    @objc func tappedMinus(_ gesture: UITapGestureRecognizer) {
        number -= 1
        
        if number < 1 {
            number = 1
        }
        
        numberOf.text = "\(number)"
        
        let intPrice = Int(priceLabel.text!)
        let totalPirce = intPrice! * number
        let strPrice = makeDecimal(integer: totalPirce)
        totalPrice.text = strPrice
        print(strPrice)
    }
    
    @objc func tappedImage(_ gesture: UITapGestureRecognizer) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailPopupView") as? DetailPopupViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.location2 = location
        self.present(vc, animated: false)
        
        
               
     
    }
    

    
    
    func updateUI() {
        if let location = location {
            if location.section == 1 {
                //DetailMenuImageView.image = RecommendMenu[location.row].image
                DetailMenuNameLabel.text = RecommendMenu[location.row].name
                DetailMenuExplanationLabel.text = RecommendMenu[location.row].explanation
                priceLabel.text = "\(RecommendMenu[location.row].price)"
            }
            if location.section == 3 {
                //DetailMenuImageView.image = BestMenu[location.row].image
                DetailMenuNameLabel.text = BestMenu[location.row].name
                DetailMenuExplanationLabel.text = BestMenu[location.row].explanation
                priceLabel.text = "\(BestMenu[location.row].price)"
            }
            
        }
        
    }
    

}
