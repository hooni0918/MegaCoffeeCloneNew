//
//  MoreOrderHistroyVC.swift
//  MegaTest2
//
//  Created by 김성호 on 2022/11/18.
//

import Foundation
import UIKit


// MARK: [Enum]
enum History {
    case week1
    case month1
    case month3
    case total
}


class MoreOrderHistroyVC: UIViewController {
    var history = History.week1
    
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MoreWeek1TVC.self, forCellReuseIdentifier: MoreWeek1TVC.identifier)
        tableView.register(MoreMonth1TVC.self, forCellReuseIdentifier: MoreMonth1TVC.identifier)
        tableView.register(MoreMonth3TVC.self, forCellReuseIdentifier: MoreMonth3TVC.identifier)
        tableView.register(MoreTotalTVC.self, forCellReuseIdentifier: MoreTotalTVC.identifier)
        
        return tableView
    }()
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        addHeaderViewToFirstTableView()
    }
    
    // MARK: [+ Custom HeaderView]
    private func addHeaderViewToFirstTableView() {
    
        tableView.register(MoreOrderCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "OrderCustomHeaderView")
    }
    
    
    
    
    // MARK: [Action]
    @objc func tapListButton(_ sender: UITableViewCell) {

        guard let btn = sender as? UITableViewCell else { return }
        
        switch btn.tag {
            
        case 1:
            
            history = .week1
            print("1")
            
            
        case 2:
           
            history = .month1
            print("2")
            
            
        case 3:
            
            history = .month3
            print("3")
            
        case 4:
            
            history = .total
            print("4")
            
            
            
            
        default:
            break
            
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]




// MARK: [TableView - DataSource]

extension MoreOrderHistroyVC: UITableViewDataSource {
    
 

    // MARK: DataSource - HeaderView
    // Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    // 백그라운드
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.yellow
    }
    
    
    
    
    
    
    // MARK: [Custom Header View]
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let hed = tableView.dequeueReusableHeaderFooterView(withIdentifier: "OrderCustomHeaderView") as! MoreOrderCustomHeaderView
        
        hed.week1Button.setTitle("1주일", for: .normal)
        hed.month1Button.setTitle("1개월", for: .normal)
        hed.month3Button.setTitle("3개월", for: .normal)
        hed.totalButton.setTitle("전체", for: .normal)

        
        
        hed.week1Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        hed.month1Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)

        hed.month3Button.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        hed.totalButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        

        
        
    
        return hed
    }
    
    
    
    /*
    // height For Row At
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch history {
        case .week1: return 350
        case .month1: return 90
        case .month3: return 300
        case .total: return 300
            
        }
        
    }
    
    */
    


    // numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch history {
            
        case .week1: return 1
        case .month1: return 2
        case .month3: return 3
        case .total: return 4
            
        }
  
    }
    

    
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch history {
            
            
            
        case .week1:

            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: MoreWeek1TVC.identifier, for: indexPath) as? MoreWeek1TVC else { return UITableViewCell() }
            
            //
            
            return cell1
            
            
            
        case .month1:

            // 뭐 이런 방법도 있다 정도..
            let cell2 = tableView.dequeueReusableCell(withIdentifier: MoreMonth1TVC.identifier, for: indexPath) as! MoreMonth1TVC
            
            //
            
            return cell2
           
            
            
            
        case .month3:
            
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: MoreMonth3TVC.identifier, for: indexPath) as? MoreMonth3TVC else { return UITableViewCell() }
            
         
            //
            
            return cell3
            
        case .total:

            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: MoreTotalTVC.identifier, for: indexPath) as? MoreTotalTVC else { return UITableViewCell() }
            
         
            //
            
            return cell3
            
            
        }
        
    }
    
    
    
    
}

// MARK: [TableView - Delegate]
extension MoreOrderHistroyVC: UITableViewDelegate {
    
}








// MARK: [Layout]
extension MoreOrderHistroyVC {
    
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
       
        
        self.navigationItem.title = "주문내역"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    
    
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        self.tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
}
