//
//  GiftViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/12.
//https://ios-development.tistory.com/945 (Section > Group > Item)

import UIKit

class GiftViewController: ViewController {
    
    @IBOutlet weak var contentsView: UIView!
    
    
    
    var mainView: UIView!
    
    var categoryView: UIView!
    
    var giftboxView: UIView!
    
    @IBOutlet weak var findButton: UIBarButtonItem!
    
    
    
    @IBOutlet weak var segmentedControl: UnderlineSegmentedControl!
    
    
    
    @IBOutlet weak var containerView1: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView3: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //layout()
        
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 18, weight: .bold)
            ],
            for: .selected
        )
        self.segmentedControl.selectedSegmentIndex = 0
        
                changeViewControllers()
        hideFindButton()
        
        
    }
    
    
    private func layout() {
        containerView1.translatesAutoresizingMaskIntoConstraints = false
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        containerView3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            containerView1.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
            containerView1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView1.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            containerView2.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
            containerView2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            
            containerView3.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor),
            containerView3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView3.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        
        ])
    }
    
    
    func changeViewControllers() {
        guard  let mainVC =  self.storyboard?.instantiateViewController(identifier: "mainVC"),
               let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "categoryVC"),
               let giftboxVC = self.storyboard?.instantiateViewController(withIdentifier: "giftboxVC")
        else { fatalError() }
        
        self.addChild(mainVC)
        self.addChild(categoryVC)
        self.addChild(giftboxVC)
        
        self.contentsView.addSubview(mainVC.view)
        
        self.mainView = mainVC.view
        self.categoryView = categoryVC.view
        self.giftboxView = giftboxVC.view
        
    }
    
    
    @IBAction func segmentControlClicked(_ sender: UnderlineSegmentedControl) {
        
        if sender.selectedSegmentIndex == 0  {
            self.contentsView.addSubview(mainView)
            categoryView.removeFromSuperview()
            giftboxView.removeFromSuperview()
            hideFindButton()

        } else if sender.selectedSegmentIndex == 1 {
            self.contentsView.addSubview(categoryView)
            mainView.removeFromSuperview()
            giftboxView.removeFromSuperview()
            findButton.isEnabled = true
            findButton.tintColor = UIColor.black

        }else {
            self.contentsView.addSubview(giftboxView)
            mainView.removeFromSuperview()
            categoryView.removeFromSuperview()
            hideFindButton()

        }
    }
    
           
    
    
    
    
    
    
    
    
    
    
    func hideFindButton() {
        findButton.isEnabled = false
        findButton.tintColor = UIColor.clear
    }
    
    
    @IBAction func exclamationmarkClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopUPView") as? GiftPopUpViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
}


