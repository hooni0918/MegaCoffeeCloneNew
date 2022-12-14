//
//  MoreViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/09/29.


import Foundation
import UIKit

class MoreViewController: UIViewController {
    
    
    // MARK: [변수 선언] [0] : Frame
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()

    private lazy var contentView = UIView()
    
    
    
    // MARK: [변수 선언] [1] : Account & Service Button View
    private lazy var titleView = UIView()
  
    private lazy var accountSettingButton: UIButton = {
        let left = UIButton(type: .system)
        
        left.configuration?.buttonSize = .mini
        left.tintColor = .label
        left.setTitle("계정설정", for: .normal)
        left.translatesAutoresizingMaskIntoConstraints = false
        
        left.addTarget(self, action: #selector(moveToAccountSettingVC(sender:)), for: .touchUpInside)
        return left
    }()
    

    private lazy var centerLabel: UILabel = {
       let center = UILabel()
        
        center.text = "|"
        center.font = UIFont(name: center.font.fontName, size: 15)
        center.textColor = .systemGray
        center.translatesAutoresizingMaskIntoConstraints = false
        
        return center
    }()
    

    private lazy var ServiceCenterButton: UIButton = {
        let right = UIButton(type: .system)
        
        right.configuration?.buttonSize = .mini
        right.tintColor = .label
        right.setTitle("고객센터", for: .normal)
        right.translatesAutoresizingMaskIntoConstraints = false
        
        right.addTarget(self, action: #selector(moveToServieCenterVC(sender:)), for: .touchUpInside)
        return right
    }()
    

    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        stackView.addArrangedSubview(accountSettingButton)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(ServiceCenterButton)
        
        return stackView
    }()
    
    
    
    // MARK: [변수 선언] [2]: NickName View
    private lazy var titleSubView = UIView()
    
    private lazy var nicknameLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Mega 님"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    

    
    // MARK: [변수 선언] [3]: Ad View
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoreAdCollectionViewCell.self, forCellWithReuseIdentifier: MoreAdCollectionViewCell.identifier)
        
        collectionView.isPagingEnabled = true
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .zero
        
        layout.scrollDirection = .horizontal
        layout.collectionView?.showsHorizontalScrollIndicator = false
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        return collectionView
    }()
    

    private lazy var pageControl: UIPageControl = {
        let page = UIPageControl()

        page.numberOfPages = imgArray.count
        page.currentPage = 0
        page.isHidden = true
        
        page.pageIndicatorTintColor = UIColor.gray
        page.currentPageIndicatorTintColor = UIColor.blue
        
        return page
    }()
    
    private lazy var adStackView: UIStackView = {
       let stackView = UIStackView()
        
        stackView.addArrangedSubview(markStartIndexLabel)
        stackView.addArrangedSubview(markCenterLabel)
        stackView.addArrangedSubview(markTotalIndexLabel)
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 1
        stackView.backgroundColor = .black
        stackView.alpha = 0.7
        stackView.layer.cornerRadius = 7
        
        return stackView
    }()
    
    
    
    private lazy var markStartIndexLabel: UILabel = {
        let label = UILabel()

        let a = String(currentCellIndex + 1)
        label.text = "  " + a
        label.textColor = .white
        
        return label
    }()
    
    private lazy var markCenterLabel: UILabel = {
        let label = UILabel()
        
        label.text = "/"
        label.textColor = .white
        
        return label
    }()
    
    
    
    private lazy var markTotalIndexLabel: UILabel = {
        let label = UILabel()
        
        // 현재 게시된 이미지의 총숫자
        label.text = String(imgArray.count - 2) + "  "
        label.textColor = .white
        
        return label
    }()
    

    private lazy var imgArray: [String] = ["img3", "img1", "img2", "img3", "img1"]
    var timer: Timer?
    var currentCellIndex = 0
    
    
    
    // MARK: [변수 선언] [4]: List View
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MoreTableViewCell.identifier)
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    var dummy = MoreMainModel.moreSectionHeader
    
    
    
    
    
    
    
    

   
    
    
    
    // MARK: [Override]
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        collectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
    }
    
    
    
    
    
    
    

    // MARK: [Action - ADTimer]
    private func configureTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(moveNextIndex), userInfo: nil, repeats: true)
    }
    

    @objc private func moveNextIndex() {
        (currentCellIndex < imgArray.count - 1) ? (currentCellIndex += 1) : (currentCellIndex = 0)

        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        
        // ==============Test===============
        let a = String(currentCellIndex)
        markStartIndexLabel.text = "  " + a
        
    }
    
    
    
    
    
    // MARK: [1]: Account & Service Button
    @objc func moveToAccountSettingVC(sender: UIButton) {
        let accountVC = MoreAccountSettingViewController()
        accountVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(accountVC, animated: false)
    }
    
    @objc func moveToServieCenterVC(sender: UIButton) {
        let serviceVC = MoreServiceCenterViewController()
        serviceVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(serviceVC, animated: false)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]












// MARK: [ScrollView - Delegate]
extension MoreViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if scrollView.frame.size.width != 0 {
                let value = (scrollView.contentOffset.x / scrollView.frame.width)
                pageControl.currentPage = Int(round(value))
            }
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let value = (scrollView.contentOffset.x / scrollView.frame.width)
            
            switch Int(round(value)) {
            case 0:
                let last = imgArray.count - 2
                self.collectionView.scrollToItem(at: [0, last], at: .left, animated: false)
            case imgArray.count - 1:
                self.collectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
            default:
                break
            }
        }
    
}



// MARK: [CollectonView]
extension MoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreAdCollectionViewCell.identifier, for: indexPath) as! MoreAdCollectionViewCell

        cell.configure(image: imgArray[indexPath.item])
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}


// MARK: [TableView - DataSource]
extension MoreViewController: UITableViewDataSource {
    // numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummy.count
      }

    // titleForHeaderInSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dummy[section]
    }
    
    // willDisplayHeaderView
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        header.textLabel?.textColor = .black
        
    }

    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return MoreMainModel.sectionList1.count
        } else if section == 1 {
            return MoreMainModel.sectionList2.count
        } else if section == 2 {
            return MoreMainModel.sectionList3.count
        } else if section == 3 {
            return MoreMainModel.sectionList4.count
        } else {
            return 0
        }
    }
    

    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier) else { return UITableViewCell(style: .default, reuseIdentifier: MoreTableViewCell.identifier)
            }
            return cell
        }()
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList1[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList2[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList3[indexPath.row])"
        } else if indexPath.section == 3 {
            cell.textLabel?.text = "\(MoreMainModel.sectionList4[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
}




// MARK: [TableView - Delegate]
extension MoreViewController: UITableViewDelegate {
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
            
        // 멤버쉽 [v]
        case 0:
            if MoreMainModel.sectionList1[indexPath.row] == "스탬프" {
                print("스탬프")
                //vc.hidesBottomBarWhenPushed = true
                
            } else {
                print("쿠폰")
                //vc.hidesBottomBarWhenPushed = true
            }
            
            
        // 주문
        case 1:
            if MoreMainModel.sectionList2[indexPath.row] == "메가 오더" {
                self.tabBarController?.selectedIndex = 1
            }
            
            
            else if MoreMainModel.sectionList2[indexPath.row] == "주문 내역" {
                let vc = MoreOrderHistroyVC()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "선물하기" {
                self.tabBarController?.selectedIndex = 2
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "메가선불카드" {
                let vc = MorePrepaidCardVC()
                //present
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "간편카드 관리" {
                let vc = MoreSimpleCardVC()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            else if MoreMainModel.sectionList2[indexPath.row] == "상품권 대량 구매 신청" {
                if let url = URL(string: "https://event.multicon.co.kr/survey/megacoffee_b2b?pid=7Y6nRsuYxwbrGE%2BK13zbGQ%3D%3D&curr_time=1666352003&uid=7822996253187061") { UIApplication.shared.open(url, options: [:]) }
            }
            
            // 새소식
        case 2:
            if MoreMainModel.sectionList3[indexPath.row] == "이벤트" {
                print("이벤트")
                let vc = MoreEventAndNoticeVC()
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                print("공지사항")
                let vc = MoreEventAndNoticeVC()
                
                vc.hidesBottomBarWhenPushed = true
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
            // 약관 및 정책 [v]
        case 3:
            let vc = MoreTermsOfServiceViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
    
        default: print("MoreViewController - didSelectRowAt")
        }
        
    }
}










// MARK: [Layout]
extension MoreViewController {
    
    private func layout() {
        
        number0LayoutFrame()
        number1Layout1AccountAndServiceButton()
        number2LayoutNickName()
        number3LayoutAD()
        number4LayoutListView()
       
    }
    
    
    
    
    
    private func number0LayoutFrame() {
        
        self.view.backgroundColor = .systemBackground
        layoutScrollView()
        layoutContentView()
    }
    
    private func number1Layout1AccountAndServiceButton() {
        layoutTitleView()
        layoutStackView()
    }
    
    private func number2LayoutNickName() {
        layoutTitleSubView()
        layoutNicknameLabel()
    }
    
    private func number3LayoutAD() {
        layoutCollectionView()
        layoutPageControl()
        configureTimer()
        layoutADStackView()
    }
    
    private func number4LayoutListView() {
        layoutTableView()
    }
    
    
    
    
    
    
    // ScrollView
    private func layoutScrollView() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // ContentView
    private func layoutContentView() {
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            // MARK: -- Dynamic Height
            self.contentView.heightAnchor.constraint(equalToConstant: 1100)
            //self.contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
    
    // TitleView
    private func layoutTitleView() {
        self.contentView.addSubview(self.titleView)
        
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    

    // StackView
    private func layoutStackView() {
        self.titleView.addSubview(self.topStackView)
        
        self.topStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topStackView.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor),
            self.topStackView.bottomAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5)
        ])
    }
    
    // TitleSubView
    private func layoutTitleSubView() {
        self.contentView.addSubview(self.titleSubView)
        
        self.titleSubView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleSubView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.titleSubView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleSubView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleSubView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // NicknameLabel
    private func layoutNicknameLabel() {
        self.titleSubView.addSubview(self.nicknameLabel)
        
        self.nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nicknameLabel.leadingAnchor.constraint(equalTo: self.titleSubView.leadingAnchor),
            self.nicknameLabel.bottomAnchor.constraint(equalTo: self.titleSubView.bottomAnchor)
        ])
    }

    // Ad CollectionView
    private func layoutCollectionView() {
        self.contentView.addSubview(self.collectionView)
        
        self.collectionView.layer.cornerRadius = 5

        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.titleSubView.bottomAnchor, constant: 10),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    // Ad CollectionView - PageControl
    private func layoutPageControl() {
        self.contentView.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pageControl.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor)
        ])
    }
    
    // Ad CollectionView - ADStackView
    private func layoutADStackView() {
        self.contentView.addSubview(self.adStackView)
        
        
        self.adStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.adStackView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.adStackView.bottomAnchor.constraint(equalTo: self.collectionView.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            self.adStackView.heightAnchor.constraint(equalToConstant: 25),
            self.adStackView.widthAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    
    // TableView
    private func layoutTableView() {
        self.contentView.addSubview(self.tableView)

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
    }
    

    
    
}


