//
//  HomePointHistoryViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/18.
//

import UIKit

class HomePointMainViewController: UIViewController {
    
    let pointhistoryVC = HomepointhistoyViewController()
    let OneMonthVC = HomeOneMonthViewController()
    let ThirdVC = HomeThirdViewController()
    let periodVC = HomeAllPeriodViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    private func setup() {
        
        addChild(pointhistoryVC)
        addChild(OneMonthVC)
        addChild(ThirdVC)
        addChild(periodVC)
        self.view.addSubview(pointhistoryVC.view)
        self.view.addSubview(OneMonthVC.view)
        self.view.addSubview(ThirdVC.view)
        self.view.addSubview(periodVC.view)

        pointhistoryVC.didMove(toParent: self)
        OneMonthVC.didMove(toParent: self)
        ThirdVC.didMove(toParent: self)
        periodVC.didMove(toParent: self)
        
        pointhistoryVC.view.frame = self.view.bounds
        OneMonthVC.view.frame = self.view.bounds
        ThirdVC.view.frame = self.view.bounds
        periodVC.view.frame = self.view.bounds
            

    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        pointhistoryVC.view.isHidden = true
        OneMonthVC.view.isHidden = true
        ThirdVC.view.isHidden = true
        periodVC.view.isHidden = true

        
        if sender.selectedSegmentIndex == 0{
            view.backgroundColor = .blue
            pointhistoryVC.view.isHidden = false


        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .red
            OneMonthVC.view.isHidden = false


        }
        else if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = .white
            ThirdVC.view.isHidden = false

        }
        else if sender.selectedSegmentIndex == 3 {
            view.backgroundColor = .yellow
            periodVC.view.isHidden = false

        }
    }
}
