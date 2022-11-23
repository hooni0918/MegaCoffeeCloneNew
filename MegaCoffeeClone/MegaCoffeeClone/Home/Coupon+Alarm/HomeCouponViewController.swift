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
    var arr2 = [1,2,3]
    var arr3 = [1,2,3,4,5]
    
    
    var HomeCouponPlace: Array<String> = ["강남 로데오점","왕십리역점"]
    var HomeCouponMenu: Array<String> = ["아이스 아메리카노","따끈따끈간식꾸러미세트"]
    var HomeCouponPeriod: Array<String> = ["유효기간: ~ 11.07","유효기간 ~ 11.09"]
    
    @IBOutlet weak var HomeCouponTableview: UITableView!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    //var homeCouponSelectedCategory = HomeCouponSelectedCategory.coupon
    
    var selectedButtonIndex = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        self.HomeCouponTableview.dataSource = self
//        self.HomeCouponTableview.delegate = self

        let nib = UINib(nibName: "HomeCouponTableViewCell", bundle: nil)
        HomeCouponTableview?.register(nib, forCellReuseIdentifier: "HomeCouponTableViewCell")
     //   HomeCouponTableview.rowHeight = UITableView.automaticDimension
        
        
//        orderTableView.bounces = false
//        setupOrderHeaderView()
//
//        underBarViewWidth.constant = listButton.frame.size.width
//
//        listButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
//    @IBAction func tapButton(_ sender: Any) {
//        guard let button = sender as? UIButton else { return }
//        
//        selectedButtonIndex = button.tag
//
//
//        HomeCouponTableview?.reloadData()
//
//    }
    
    

//    @IBAction func tapCouponButton(_ sender: Any) {
//        guard let button = sender as? UIButton else { return }
//
//        switch button.tag {
//        case 1:
//            homeCouponSelectedCategory = .coupon
//            orderTableView.isScrollEnabled = true
//        case 2:
//            homeCouponSelectedCategory = .download
//            orderTableView.isScrollEnabled = false
//        case 3:
//            homeCouponSelectedCategory = .history
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
//
    
    // MARK: 기본 테이블
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedButtonIndex {
        case 100:
            return HomeCouponImage.count
        case 101:
            return arr2.count
        case 102:
            return arr3.count
        default:
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedButtonIndex {
        case 100:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCouponTableViewCell", for: indexPath) as! HomeCouponTableViewCell
            
            
            cell.HomeCouponImage.image = UIImage(named: HomeCouponImage[indexPath.row])
            cell.HomeCouponMenu.text =  HomeCouponMenu[indexPath.row]
            cell.HomeCouponPlace.text =  HomeCouponPlace[indexPath.row]
            cell.HomeCouponPeriod.text =  HomeCouponPeriod[indexPath.row]
            return cell
        case 101:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")!
            cell.textLabel?.text = "\(arr2[indexPath.row])"
            return cell
        case 102:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")!
            cell.textLabel?.text = "\(arr3[indexPath.row])"
            return cell
        default:
            return UITableViewCell()
        }

    }
    
}
    


