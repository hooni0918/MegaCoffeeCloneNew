//
//  DetailReadViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/22.
//

import UIKit

class DetailReadViewController: UIViewController {

    // MARK: 변수 선언
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)

        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)

        return tableView
    }()

    
    
    // MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        layout()
    }
    
    // viewWillAppear를 실행함으로 인해 계속 테이블뷰를 리로드해서 새로고침을 해줘야 다른 셀을 받아올 수 있음.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    

    
// MARK: ==== Class End ====
    
}

// MARK: ==== Class End ====





// MARK: extension TableView - DataSource
extension DetailReadViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) else { return UITableViewCell(style: .default, reuseIdentifier: TableViewCell.identifier)
            }
            return cell
        }()

        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        
        switch self.navigationItem.title {
        case "서비스 이용약관":
            cell.textLabel?.text = TermsOfServiceModel.menu1
        case "메가선불카드 이용약관":
            cell.textLabel?.text = TermsOfServiceModel.menu2
        case "개인정보 처리방침":
            cell.textLabel?.text = TermsOfServiceModel.menu3
        case "마케팅 활용 동의":
            cell.textLabel?.text = TermsOfServiceModel.menu4
        case "위치 기반 서비스 이용 동의":
            cell.textLabel?.text = TermsOfServiceModel.menu5
        default:
            print("DetailReadViewController - didSelectRowAt")
        }
        
        return cell
        
    }
}



// MARK: Layout
extension DetailReadViewController {
    
    private func layout() {
        naviCustom()
        layoutTableView()
    }
    
    // NaviCustom
    private func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    // none
    private func naviCustom1() {
        let leftImage = UIImage(systemName: "xmark")
        
        self.navigationController?.navigationBar.backIndicatorImage = leftImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = leftImage
    }
    
    
    // TableView
    private func layoutTableView() {
        self.view.addSubview(self.tableView)
        
        tableView.backgroundColor = .systemBackground
        // iOS15 padding issue
        tableView.tableHeaderView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        tableView.separatorStyle = .none
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

