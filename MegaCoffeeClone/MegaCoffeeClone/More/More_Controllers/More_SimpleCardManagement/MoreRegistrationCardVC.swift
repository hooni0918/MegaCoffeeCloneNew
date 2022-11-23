//
//  MoreRegistrationCardVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.
//

import Foundation
import UIKit


// MARK: [Enum]
enum list {
    case a1([Card1])
    case a2([Card2])
    case a3([Card3])
    case a4([Card4])
    case a5([Card5])
}


// MARK: [Struct Card1-5]
struct Card1 {
    let title: String?
}

struct Card2 {
    let title: String?
}


struct Card3 {
    let title: String?
}


struct Card4 {
    let title: String?
}


struct Card5 {
    let title: String?
}







class MoreRegistrationCardVC: UIViewController {
    var accountModel = ["카드 이름","카드 번호", "카드 유효기간", "카드 비밀번호 (앞 2자리)", "고객 구분"]
    var dotTextField = ""
    
   
    
    
    // MARK: [변수 선언]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MoreCardNameTVC.self, forCellReuseIdentifier: MoreCardNameTVC.identifier)
        tableView.register(MoreCardNumberTVC.self, forCellReuseIdentifier: MoreCardNumberTVC.identifier)
        tableView.register(MoreCardExpirationPeriodTVC.self, forCellReuseIdentifier: MoreCardExpirationPeriodTVC.identifier)
        tableView.register(MoreCardPWTVC.self, forCellReuseIdentifier: MoreCardPWTVC.identifier)
        tableView.register(MoreCardCustomerTVC.self, forCellReuseIdentifier: MoreCardCustomerTVC.identifier)
    
        
        tableView.separatorStyle = .none

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.sectionFooterHeight = 0
        
        return tableView
    }()
    
    
    
    private var dataSource = [list]()
    

    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        branchProcessing()
        layout()
    }
    
    
    
    
    
    
    // MARK: [Func]
    private func branchProcessing() {
        let card1 = Card1(title: "1")
        let card1Section = list.a1([card1])
        
        let card2 = Card2(title: "2")
        let card2Section = list.a2([card2])
        
        let card3 = Card3(title: "3")
        let card3Section = list.a3([card3])
        
        let card4 = Card4(title: "4")
        let card4Section = list.a4([card4])
        
        let card5 = Card5(title: "5")
        let card5Section = list.a5([card5])
        
        
        self.dataSource = [card1Section, card2Section, card3Section, card4Section, card5Section]
        self.tableView.reloadData()
    }
    
    
    
    
    
    
    
    

// MARK: [Class End]
    
}

// MARK: [Class End]










// MARK: [TableView - DataSource]
extension MoreRegistrationCardVC: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch self.dataSource[indexPath.section] {
        
        case .a1: return 130
        case .a2: return 130
        case .a3: return 130
        case .a4: return 130
        case .a5: return 250
        
        
        }
      
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
        //return accountModel.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.dataSource[section] {
            
        case let .a1(a1Models): return a1Models.count
        case let .a2(a2Models): return a2Models.count
        case let .a3(a3Models): return a3Models.count
        case let .a4(a4Models): return a4Models.count
        case let .a5(a5Models): return a5Models.count
            
        }
        
    }
  

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
 
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.systemGray6
    }
     
     
    
    // cellForRowAt
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch self.dataSource[indexPath.section] {
       
            
        case .a1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardNameTVC.identifier, for: indexPath) as! MoreCardNameTVC
           
            cell.titleLabel.text = "카드 이름"
            cell.countLabel.text = "0/20"
            cell.bottomLabel.text = "카드이름은 간편카드 페이지에서 변경하실 수 있습니다"
            
            return cell
            
            
        case .a2:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardNumberTVC.identifier, for: indexPath) as! MoreCardNumberTVC
            
            cell.titleLabel.text = "카드 번호"
            
            return cell
            
            
        case .a3:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardExpirationPeriodTVC.identifier, for: indexPath) as! MoreCardExpirationPeriodTVC
         
            cell.titleLabel.text = "카드 유효기간"
            cell.centerNonButton.setTitle("/", for: .normal)
            
            return cell
            
            
        case .a4:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardPWTVC.identifier, for: indexPath) as! MoreCardPWTVC
            
            cell.titleLabel.text = "카드 비밀번호 (앞 2자리)"
            
            return cell
            
            
        case .a5:
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreCardCustomerTVC.identifier, for: indexPath) as! MoreCardCustomerTVC
            
            cell.titleLabel.text = "고객 구분"
            
            cell.personalCardButton.setTitle("개인카드", for: .normal)
            cell.corporationCardButton.setTitle("법인카드", for: .normal)
            cell.registrationButton.setTitle("결제비밀번호 등록", for: .normal)
            
            return cell

        }
        
    }
}





// MARK: [TableView - Delegate]
extension MoreRegistrationCardVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        switch self.dataSource[indexPath.section] {
        
        case .a1: print("")
        case .a2: print("")
        case .a3: print("")
        case .a4: print("")
        case .a5: print("")
        
        }
        
    }
     
    
}







// MARK: [Layout]
extension MoreRegistrationCardVC {
    
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutTableView()
    }
    
    
    
    
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "간편카드 등록"
        self.navigationItem.largeTitleDisplayMode = .never
    }

    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}

