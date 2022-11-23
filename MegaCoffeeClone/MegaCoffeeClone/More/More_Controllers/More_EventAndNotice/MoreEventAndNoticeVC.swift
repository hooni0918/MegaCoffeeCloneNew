//
//  MoreEventAndNoticeVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/01.
//


import UIKit


// MARK: [Enum]
enum NewNotice {
    case event
    case notice
    case rankingEvent
}


class MoreEventAndNoticeVC: UIViewController {
    var newNotice = NewNotice.event
    
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(MoreEventTVC.self, forCellReuseIdentifier: MoreEventTVC.identifier)
            tableView.register(MoreNoticeTVC.self, forCellReuseIdentifier: MoreNoticeTVC.identifier)
            tableView.register(MoreRankingEventTVC.self, forCellReuseIdentifier: MoreRankingEventTVC.identifier)
        
        
        return tableView
    }()
    
    
    
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        addHeaderViewToFirstTableView()
        
        layout()
    }
    
    
    
    
    
    
    // MARK: [+ Custom HeaderView]
    private func addHeaderViewToFirstTableView() {
    
        tableView.register(MoreCustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    
    
    
    
    
    
    
    
    // MARK: [Action]
    @objc func tapListButton(_ sender: UITableViewCell) {
        
        guard let btn = sender as? UITableViewCell else { return }
        
        switch btn.tag {
            
        case 1: newNotice = .event
        case 2: newNotice = .notice
        case 3: newNotice = .rankingEvent
            
        default: break
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
    
    
    
    
// MARK: [Class End]

}

// MARK: [Class End]






// MARK: [TableView - DataSource]

extension MoreEventAndNoticeVC: UITableViewDataSource {

    
    // HeaderView
    
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
    
    
    
    
    
    
    // Custom Header View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! MoreCustomHeaderView
        
        view.eventButton.setTitle("이벤트", for: .normal)
        view.noticeButton.setTitle("공지사항", for: .normal)
        view.rankingEventButton.setTitle("랭킹이벤트", for: .normal)

        
        
        view.eventButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
        view.noticeButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)

        view.rankingEventButton.addTarget(self, action: #selector(tapListButton(_:)), for: .touchUpInside)
        
    
        
        return view
    }
    
    
    
    
    // height For Row At
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch newNotice {
            
        case .event: return 350
        case .notice: return 90
        case .rankingEvent: return 300
            
        }
        
    }
    
    
    // number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch newNotice {
            
        case .event: return 3
        case .notice: return 1
        case .rankingEvent: return 1
            
        }
  
    }
    
    
    

    // cell For Row At
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch newNotice {
        case .event:

            guard let cell1 = tableView.dequeueReusableCell(withIdentifier: MoreEventTVC.identifier, for: indexPath) as? MoreEventTVC else { return UITableViewCell() }
            
            cell1.titleLabel.text = "[공지] MEGA MGC STICK 출시"
            cell1.subTitleLabel.text = "2022. 11. 17. - 2023. 12. 31."
            
            
            return cell1
            
            
        case .notice:

            let cell2 = tableView.dequeueReusableCell(withIdentifier: MoreNoticeTVC.identifier, for: indexPath) as! MoreNoticeTVC
            
            cell2.titleLabel.text = "[신메뉴 출시] 겨울이 오는 달콤한 상상"
            cell2.subTitleLabel.text = "2022.11.07"
            
            return cell2
           
            
        case .rankingEvent:
            
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: MoreRankingEventTVC.identifier) else { return UITableViewCell() }
            
            //
            
            return cell3
            
            
        }
        
    }
    
    
}



// MARK: [TableView - Delegate]
extension MoreEventAndNoticeVC: UITableViewDelegate {
    
    
    
    
}








// MARK: [Layout]

extension MoreEventAndNoticeVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.isHidden = true
        
        naviCustom()
        layoutTableView()
        
    }
    
    
    
    // Navi Custom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
        
        
        self.navigationItem.title = "새소식"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
    }
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
}
