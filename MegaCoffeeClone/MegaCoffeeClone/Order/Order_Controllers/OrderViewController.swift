//
//  OrderViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/04.
//


// 내 지역 근처 매장 정보만 가져오도록 추가 필요

import UIKit

enum SelectedCategory {
    case list
    case map
    case like
}

class OrderViewController: UIViewController {
    
    @IBOutlet var orderTableView: UITableView!
    @IBOutlet var orderHeaderView: UIView!
    
    @IBOutlet var listButton: UIButton!
    @IBOutlet var mapButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var underBarView: UIView!
    @IBOutlet var underBarViewWidth: NSLayoutConstraint!
    
    @IBOutlet var listButtonCenterX: NSLayoutConstraint!
    @IBOutlet var mapButtonCenterX: NSLayoutConstraint!
    @IBOutlet var likeButtonCenterX: NSLayoutConstraint!
    
    
    var selectedCategory = SelectedCategory.list
    
    // 프레젠트 스타일 체크 변수(기본값: 푸시)
    var vcPresentationStyle = ViewPresentationStyle.push
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //UserDefaults.standard.removeObject(forKey: "test123")
        
        // present된 VC가 이 VC위에 띄워지도록
        definesPresentationContext = true
        
        orderTableView.bounces = false
        setupOrderHeaderView()
        
        underBarViewWidth.constant = listButton.frame.size.width
        
        listButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    
    func setupOrderHeaderView() {
        orderHeaderView.backgroundColor = .brown
        orderHeaderView.frame.size.height = 60
        
        let nibName = UINib(nibName: "OrderStoreInfoTableViewCell", bundle: nil)
        orderTableView.register(nibName, forCellReuseIdentifier: "storeCell")
        
    }
    
    @IBAction func tapCategoryButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        switch button.tag {
        case 1:
            selectedCategory = .list
            orderTableView.isScrollEnabled = true
        case 2:
            selectedCategory = .map
            orderTableView.isScrollEnabled = false
        case 3:
            selectedCategory = .like
            orderTableView.isScrollEnabled = true
        default:
            break
        }
        
        listButtonCenterX.priority = button.tag == 1 ? .defaultHigh : .defaultLow
        mapButtonCenterX.priority = button.tag == 2 ? .defaultHigh : .defaultLow
        likeButtonCenterX.priority = button.tag == 3 ? .defaultHigh : .defaultLow
        
        listButton.titleLabel?.font = button.tag == 1 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
        mapButton.titleLabel?.font = button.tag == 2 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
        likeButton.titleLabel?.font = button.tag == 3 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
        
        underBarViewWidth.constant = button.frame.size.width
        
        DispatchQueue.main.async {
            self.orderTableView.reloadData()
        }
    }
}

extension OrderViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch selectedCategory {
        case .list:
            return 2
        case .map:
            return 1
        case .like:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch selectedCategory {
        case .list:
            switch section {
            case 0:
                return 1
            case 1:
                return storeDatas.count
            default:
                return 0
            }
        case .map:
            return 1
        case .like:
            return likeStoreDatas.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedCategory {
        case .list:
            switch indexPath.section {
            case 0:
                let storeCountCell = tableView.dequeueReusableCell(withIdentifier: "storeCountCell", for: indexPath)
                storeCountCell.textLabel?.text = "내 주변에 \(storeDatas.count)개의 매장이 있습니다."
                return storeCountCell
            case 1:
                guard let storeCell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath) as? StoreInfoTableViewCell else { return UITableViewCell() }
                storeCell.nameLabel.text = storeDatas[indexPath.row].name
                storeCell.addressLabel.text = storeDatas[indexPath.row].address
                storeCell.distanceLabel.text = "\(storeDatas[indexPath.row].distance)m"
                
                storeCell.storeImageView.image = resizeImage(image: storeDatas[indexPath.row].storeImage, newWidth: 100)
                
                storeCell.nameLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
                storeCell.addressLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
                storeCell.distanceLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
                storeCell.storeOffView.isHidden = storeDatas[indexPath.row].isOn ? true : false
                storeCell.storeOffLabel.isHidden = storeDatas[indexPath.row].isOn ? true : false
                
                return storeCell
            default:
                return UITableViewCell()
            }
        case .map:
            guard let storeMapCell = tableView.dequeueReusableCell(withIdentifier: "storeMapCell", for: indexPath) as? StoreMapTableViewCell else { return UITableViewCell() }
            storeMapCell.delegate = self
            return storeMapCell
        case .like:
            guard let storeCell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath) as? StoreInfoTableViewCell else { return UITableViewCell() }
            storeCell.nameLabel.text = likeStoreDatas[indexPath.row].name
            storeCell.addressLabel.text = likeStoreDatas[indexPath.row].address
            storeCell.distanceLabel.text = "\(likeStoreDatas[indexPath.row].distance)m"
            
            storeCell.storeImageView.image = resizeImage(image: storeDatas[indexPath.row].storeImage, newWidth: 100)
            
            storeCell.nameLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
            storeCell.addressLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
            storeCell.distanceLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
            storeCell.storeOffView.isHidden = storeDatas[indexPath.row].isOn ? true : false
            storeCell.storeOffLabel.isHidden = storeDatas[indexPath.row].isOn ? true : false
            
            return storeCell
        }
    }
}

extension OrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedCategory != .map {
            loadPopupView(storeData: storeDatas[indexPath.row], presentationStyle: vcPresentationStyle)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedCategory {
        case .list:
            return UITableView.automaticDimension
        case .map:
            let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0.0
            let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0.0
            let statusBar = UIApplication.shared.windows.first(where: {$0.isKeyWindow})?.safeAreaInsets.top ?? 0.0
            return UIScreen.main.bounds.height - navigationBarHeight - tabBarHeight - statusBar - orderHeaderView.frame.height
        case .like:
            return UITableView.automaticDimension
        }
    }
}

extension OrderViewController: StoreMapTableViewCellDelegate {
    func popupView(storeData: StoreModel) {
        loadPopupView(storeData: storeData)
    }
}


extension UIViewController {
    func loadPopupView(storeData: StoreModel? = nil, topVC: VcType = .select, presentationStyle: ViewPresentationStyle = .push) {
        
        if presentationStyle == .present {
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "popOrderVC") as? OrderStorePopupViewController else { return }
            vc.modalPresentationStyle = .overCurrentContext
            vc.storeData = storeData
            vc.topVC = .change
            self.present(vc, animated: false)
            
        } else {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "popOrderVC") as? OrderStorePopupViewController else { return }
            vc.modalPresentationStyle = .overFullScreen
            vc.storeData = storeData
            vc.topVC = topVC
            
            self.present(vc, animated: false)
        }
    }
}

