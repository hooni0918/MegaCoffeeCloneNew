//
//  HomeCouViewController.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/05.
//

import UIKit

enum HomeCouponSelectedCategory {
    case coupon
    case download
    case history
}

var didLayout = false

class HomeCouponViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var HomeCouponImage: Array<String> = ["HomeCoupon1","HomeCoupon2"]
    
    var HomeCouponPlace: Array<String> = ["강남 로데오점","왕십리역점"]
    var HomeCouponMenu: Array<String> = ["아이스 아메리카노","따끈따끈간식꾸러미세트"]
    var HomeCouponPeriod: Array<String> = ["유효기간: ~ 11.07","유효기간 ~ 11.09"]
    
    @IBOutlet weak var HomeCouponTableview: UITableView!
    
    //var homeCouponSelectedCategory = HomeCouponSelectedCategory.coupon
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        self.HomeCouponTableview.dataSource = self
//        self.HomeCouponTableview.delegate = self

        let nib = UINib(nibName: "HomeCouponTableViewCell", bundle: nil)
        HomeCouponTableview.register(nib, forCellReuseIdentifier: "HomeCouponTableViewCell")
     //   HomeCouponTableview.rowHeight = UITableView.automaticDimension
        
        
//        orderTableView.bounces = false
//        setupOrderHeaderView()
//
//        underBarViewWidth.constant = listButton.frame.size.width
//
//        listButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
//
//    @IBAction func tapCouponButton(_ sender: Any) {
//        guard let button = sender as? UIButton else { return }
//
//        switch button.tag {
//        case 1:
//            homeCouponSelectedCategory = .list
//            orderTableView.isScrollEnabled = true
//        case 2:
//            homeCouponSelectedCategory = .map
//            orderTableView.isScrollEnabled = false
//        case 3:
//            homeCouponSelectedCategory = .like
//            orderTableView.isScrollEnabled = true
//        default:
//            break
//        }
//
//        listButtonCenterX.priority = button.tag == 1 ? .defaultHigh : .defaultLow
//        mapButtonCenterX.priority = button.tag == 2 ? .defaultHigh : .defaultLow
//        likeButtonCenterX.priority = button.tag == 3 ? .defaultHigh : .defaultLow
//
//        listButton.titleLabel?.font = button.tag == 1 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
//        mapButton.titleLabel?.font = button.tag == 2 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
//        likeButton.titleLabel?.font = button.tag == 3 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
//
//        underBarViewWidth.constant = button.frame.size.width
//
//        DispatchQueue.main.async {
//            self.orderTableView.reloadData()
//        }
//    }
    
    // MARK: 기본 테이블
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeCouponImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCouponTableViewCell", for: indexPath) as! HomeCouponTableViewCell
        
        
        cell.HomeCouponImage.image = UIImage(named: HomeCouponImage[indexPath.row])
        cell.HomeCouponMenu.text =  HomeCouponMenu[indexPath.row]
        cell.HomeCouponPlace.text =  HomeCouponPlace[indexPath.row]
        cell.HomeCouponPeriod.text =  HomeCouponPeriod[indexPath.row]
        return cell
        
        }
        
    }
    
    


