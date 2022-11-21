//
//  AccountSettingViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/28.
//

import UIKit

class MoreAccountSettingViewController: UIViewController {
    var accountModel = ["회원정보 관리","권한설정", "로그아웃"]
    
    // MARK: [변수 선언]
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
       
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        
        tableView.rowHeight = 50
        
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionHeaderHeight = 1
        
        
        return tableView
    }()
    
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }
    



    
    
// MARK: [Class End]
        
}

// MARK: [Class End]













// MARK: [TableView - DataSource]
extension MoreAccountSettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return accountModel.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //view.backgroundColor = .green
        return ""
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.backgroundColor = .red
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.textLabel?.text = accountModel[indexPath.section]
        
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.tintColor = .black
        
        
        
        return cell
    }
    
    
  
    
}




// MARK: [TableView - Delegate]
extension MoreAccountSettingViewController: UITableViewDelegate {
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.section {
        case 0 :
            print("회원정보 관리")
        case 1:
            print("권한설정")
        case 2:
            print("로그아웃")
        default:
            fatalError()
        }
        
        
        
    }
    
}







// MARK: [Layout]
extension MoreAccountSettingViewController {
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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "계정 설정"
        
    }
    
    
    
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
