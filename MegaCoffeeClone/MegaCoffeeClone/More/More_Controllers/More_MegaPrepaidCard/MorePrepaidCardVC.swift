//
//  MorePrepaidCardVC.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/22.



//  ⭐️ 선불카드라는 탭이 있기 때문에 탭으로 이동하는 경우에 속함.


import Foundation
import UIKit

class MorePrepaidCardVC: UIViewController {
    var tableViewData = [MorePrepaidCardListModel]()
    
    
    
    // MARK: [변수 선언]
    private lazy var buttonBackView = UIView()
    private lazy var dashLineButtonView = UIView()
    
    private lazy var addButton: UIButton = {
        let add = UIButton(type: .system)
        
        add.setTitle("+\n카드 추가", for: .normal)
        add.titleLabel?.numberOfLines = 0
        add.titleLabel?.textAlignment = .center
        
        add.clipsToBounds  = true

        add.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        return add
    }()
    
    private lazy var tableView: UITableView = {
       
        let table = UITableView()
        
        table.delegate = self
        table.dataSource = self
        table.register(MorePrepaidCardTableViewCell.self, forCellReuseIdentifier: MorePrepaidCardTableViewCell.identifier)
        
        table.isScrollEnabled = false
        
        
        return table
        
    }()
    
    
    // MARK: [변수 선언]: Navi Item
    private lazy var iButton: UIBarButtonItem = {
        let i = UIBarButtonItem(image: UIImage(systemName: "exclamationmark.circle"), style: .done, target: self, action: #selector(uibarButtonTapped(_:)))

        
        i.tag = 1
        
        
        return i
    }()
    
    
    private lazy var reloadButton: UIBarButtonItem = {
        let reload = UIBarButtonItem(image: UIImage(systemName:"goforward"), style: .plain, target: self, action: #selector(uibarButtonTapped(_:)))
        
       
        reload.tag = 2
   
        
        return reload
    }()
    
    
    
    private lazy var settingButton: UIBarButtonItem = {
        let setting = UIBarButtonItem(image: UIImage(systemName:"gearshape"), style: .done, target: self, action: #selector(uibarButtonTapped(_:)))
        
        
        setting.tag = 3
      
        
        return setting
    }()
    
    
    
    
    // MARK: [Override]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData1()
        

        layout()
    }
    
    
    
    // MARK: [Func]
    private func tableViewData1() {
        tableViewData = [
            MorePrepaidCardListModel(opened: false, title: "유의사항", sectionData: ["Cell1"]),
            MorePrepaidCardListModel(opened: false, title: "잔액환불규정", sectionData: ["Cell2"])
        ]
    }
    
    
    
    
    
    // MARK: [Action]
    @objc private func uibarButtonTapped(_ sender: UIBarButtonItem) {
        if let button = sender as? UIBarButtonItem {
            switch button.tag {
            case 1:
                print("1")
            case 2:
                print("2")
            case 3:
                print("3")
            default:
                print("none")
            }
        }
        
    }
    
    @objc private func addButtonTapped() {
        let vc = MoreNewCardPurchaseVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
// MARK: [Class End]
    
}

// MARK: [Class End]










// MARK: [TableView - DataSource]
extension MorePrepaidCardVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MorePrepaidCardTableViewCell", for: indexPath) as? MorePrepaidCardTableViewCell else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            
            cell.tableLabel.text = tableViewData[indexPath.section].title
            

            
            return cell
            
        } else {
     
            
            cell.tableLabel.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            

            return cell
            
        }
        
    }
    
    
    

}




// MARK: [TableView - Delegate]
extension MorePrepaidCardVC: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            tableViewData[indexPath.section].opened = !tableViewData[indexPath.section].opened
            
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
           
        }
        
    }
    
    
    
}







// MARK: [Layout]
extension MorePrepaidCardVC {
    
    private func layout() {
        self.view.backgroundColor = .systemBackground
        naviCustom()
        
        layoutButtonBackView()
        layoutDashLineView()
        layoutAddButton()
        
        layoutTableView()
    }
    
    
    // Navi Custom
    func naviCustom() {
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
       
        
        self.navigationItem.title = "메가선불카드"
        self.navigationItem.largeTitleDisplayMode = .never
        
        
        self.navigationItem.leftBarButtonItem = iButton
        self.navigationItem.rightBarButtonItems = [settingButton, reloadButton]
        
    }
    
    
    // Button Back View
    private func layoutButtonBackView() {
        view.addSubview(buttonBackView)
        
        buttonBackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            buttonBackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonBackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonBackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonBackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
            
        ])
    }
    
    
    // DashLine View
    private func layoutDashLineView() {
        buttonBackView.addSubview(dashLineButtonView)
        
        dashLineButtonView.backgroundColor = .systemGray3
        
        dashLineButtonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            dashLineButtonView.topAnchor.constraint(equalTo: buttonBackView.topAnchor, constant: 90),
            dashLineButtonView.leadingAnchor.constraint(equalTo: buttonBackView.leadingAnchor, constant: 50),
            dashLineButtonView.trailingAnchor.constraint(equalTo: buttonBackView.trailingAnchor, constant: -50),
            dashLineButtonView.bottomAnchor.constraint(equalTo: buttonBackView.bottomAnchor, constant: -90)
            
        ])
    }
    
    
    
    // Add Button
    private func layoutAddButton() {
        dashLineButtonView.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            
            addButton.topAnchor.constraint(equalTo: dashLineButtonView.topAnchor, constant: 1),
            addButton.leadingAnchor.constraint(equalTo: dashLineButtonView.leadingAnchor, constant: 1),
            addButton.trailingAnchor.constraint(equalTo: dashLineButtonView.trailingAnchor, constant: -1),
            addButton.bottomAnchor.constraint(equalTo: dashLineButtonView.bottomAnchor, constant: -1)
            
        ])
    }
    
    
    // TableView
    private func layoutTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: buttonBackView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    
    
    
    
    
}

