//
//  DetailViewController.swift
//  MegaCoffeeClone
//
//  Created by 준연 on 2022/10/27.
//
//https://nemecek.be/blog/17/how-to-add-badge-to-uibarbuttonitem (barButtonItem에 뱃지 추가하는방법)

import UIKit

class GiftDetailViewController: ViewController {
    
    @IBOutlet weak var DetailMenuImageView: UIImageView!
    @IBOutlet weak var DetailMenuNameLabel: UILabel!
    @IBOutlet weak var DetailMenuExplanationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var minusView: UIView!
    @IBOutlet weak var numberOf: UILabel!
    @IBOutlet weak var shoppingBasket: UIButton!
    
    public var location: IndexPath?
    
    var productInfo: MenuModel?
    
    var badgeNumber = 0
    
    var isgoShopping = false
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        plusView.layer.cornerRadius = plusView.frame.width / 2
        minusView.layer.cornerRadius = minusView.frame.width / 2
        numberOf.sizeToFit()
        
        updateUIFromMain()
        updateUIFromCategory()
        if isgoShopping == true {
            goToShopping()
        }
        
        let concernPlusGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedPlus(_:)))
        plusView.addGestureRecognizer(concernPlusGesture)
        
        let concernMinusGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedMinus(_:)))
        minusView.addGestureRecognizer(concernMinusGesture)
        
        let concernDetailGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImage(_:)))
        DetailMenuImageView.isUserInteractionEnabled = true
        DetailMenuImageView.addGestureRecognizer(concernDetailGesture)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        NSLayoutConstraint.activate([
            shoppingBasket.widthAnchor.constraint(equalToConstant: 34),
            shoppingBasket.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        showBadge(withCount: badgeNumber)
        
        if isgoShopping {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "movePopupView") as? GiftMovePopupVC else { return }
            vc.dismiss(animated: false)
//            goToShopping()
        }
        
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
    }
    
    @objc func tappedImage(_ gesture: UITapGestureRecognizer) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailPopupView") as? GiftDetailPopupViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.location2 = location
        self.present(vc, animated: false)
        
    }
    
    func updateUIFromMain() {
        if let location = location {
            if location.section == 1 {
                DetailMenuImageView.image = RecommendMenu[location.row].image
                DetailMenuNameLabel.text = RecommendMenu[location.row].name
                DetailMenuExplanationLabel.text = RecommendMenu[location.row].explanation
                priceLabel.text = "\(RecommendMenu[location.row].price)"
            }
            if location.section == 3 {
                DetailMenuImageView.image = BestMenu[location.row].image
                DetailMenuNameLabel.text = BestMenu[location.row].name
                DetailMenuExplanationLabel.text = BestMenu[location.row].explanation
                priceLabel.text = "\(BestMenu[location.row].price)"
            }
            
        }
        
    }
    
    func updateUIFromCategory() {
        if let productInfo = productInfo {
            DetailMenuImageView.image = productInfo.image
            DetailMenuNameLabel.text = productInfo.name
            DetailMenuExplanationLabel.text = productInfo.explanation
            priceLabel.text = "\(productInfo.price)"
        }
    }
    
    let badgeSize: CGFloat = 20
    let badgeTag = 9830384

    func badgeLabel(withCount count: Int) -> UILabel {
        let badgeCount = UILabel(frame: CGRect(x: 0, y: 0, width: badgeSize, height: badgeSize))
        badgeCount.translatesAutoresizingMaskIntoConstraints = false
        badgeCount.tag = badgeTag
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.backgroundColor = .systemRed
        badgeCount.text = String(count)
        return badgeCount
    }
    
    func showBadge(withCount count: Int) {
        let badge = badgeLabel(withCount: count)
        shoppingBasket.addSubview(badge)

        NSLayoutConstraint.activate([
            badge.leftAnchor.constraint(equalTo: shoppingBasket.leftAnchor, constant: 14),
            badge.topAnchor.constraint(equalTo: shoppingBasket.topAnchor, constant: 4),
            badge.widthAnchor.constraint(equalToConstant: badgeSize),
            badge.heightAnchor.constraint(equalToConstant: badgeSize)
        ])
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        badgeNumber += 1
        showBadge(withCount: badgeNumber)
            
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "movePopupView") as? GiftMovePopupVC else { return }
        vc.modalPresentationStyle = .overFullScreen
        vc.vcRef = self
        self.present(vc, animated: false)
    }
    
    func goToShopping() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "shoppingView") as? GiftShoppingBasketVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
            
    }
    
    
}


