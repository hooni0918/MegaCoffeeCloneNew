//
//  OrderMenuDetailViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit

class OrderMenuDetailViewController: UIViewController {

    @IBOutlet var menuDetailTableView: UITableView!
    
    var menuData: MenuModel2?

    var menuCount = 1
    var menuPrice = 0
    var recomendPrice = 0
    var sum = 0
    
    var selectedPriceList = [Int]()
    var recommendMenuPricesList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        menuPrice = menuData?.price ?? 0
        sum = menuData?.price ?? 0
        selectedPriceList = Array(repeating: 0, count: menuData?.option.count ?? 0)
        recommendMenuPricesList = Array(repeating: 0, count: recommendMenus.count)
    }
}

extension OrderMenuDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return menuData?.option.count ?? 0
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell1", for: indexPath) as? OrderMenuDetail1TableViewCell else { return UITableViewCell() }
            cell.menuImageView.image = menuData?.Image
            cell.menuNameLabel.text = menuData?.name
            cell.menuDescriptionLabel.text = menuData?.description
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell2", for: indexPath) as? OrderMenuDetail2TableViewCell else { return UITableViewCell() }
            
            cell.row = indexPath.row
            cell.menuData = menuData
            cell.delegate = self

            if indexPath.row == 0 {
                cell.configOptionButton()
            } else if indexPath.row == 1 {
                cell.configOptionButton()
            } else if indexPath.row == 2 {
                cell.configOptionButton()
            } else if indexPath.row == 3 {
                cell.configOptionButton()
            } else if indexPath.row == 4 {
                cell.configOptionButton()
            } else if indexPath.row == 5 {
                cell.configOptionButton()
            }
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell3", for: indexPath) as? OrderMenuDetail3TableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.sumLabel.text = "\(sum)"
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell4", for: indexPath) as? OrderMenuDetail4TableViewCell else { return UITableViewCell() }
            cell.delegate = self
            
            
            
            cell.sumLabel.text = "\(sum)"
            return cell
        }
        return UITableViewCell()
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail2TableViewCellDelegate {
    func changeSection1(row: Int, buttonIndex: Int) {
        
        let index = menuData?.option[row].details.firstIndex(where: {$0.isSelect == true}) ?? 0
        
        menuData?.option[row].details[index].isSelect = false
        menuData?.option[row].details[buttonIndex].isSelect = true
        
        selectedPriceList[row] = menuData?.option[row].details[buttonIndex].price ?? 0
        
        sum = menuPrice * menuCount
        
        for price in selectedPriceList {
            sum += price * menuCount
        }
        
        if let section2Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? OrderMenuDetail3TableViewCell,
           let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderMenuDetail4TableViewCell {
            section2Cell.sumLabel.text = "\(sum)원"
            section3Cell.sumLabel.text = "\(sum + recomendPrice)원"
        } else {
            menuDetailTableView.reloadSections(IndexSet(integer: 2), with: .automatic)
            menuDetailTableView.reloadSections(IndexSet(integer: 3), with: .automatic)
        }
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail3TableViewCellDelegate {
    func changeSection2(count: Int) {
        menuCount = count
        
        sum = menuPrice * menuCount
        
        for price in selectedPriceList {
            sum += price * menuCount
        }
        
        if let section2Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? OrderMenuDetail3TableViewCell,
           let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderMenuDetail4TableViewCell {
            section2Cell.sumLabel.text = "\(sum)원"
            section3Cell.sumLabel.text = "\(sum + recomendPrice)원"
        }
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail4TableViewCellDelegate {
    func changeSection3(index: Int) {
        if let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderMenuDetail4TableViewCell {

            if recommendMenus[index].isSelect {
                recommendMenuPricesList[index] = recommendMenus[index].price
            } else {
                recommendMenuPricesList[index] = 0
            }
            
            recomendPrice = 0
            
            for price in recommendMenuPricesList {
                recomendPrice += price
            }
            
            section3Cell.sumLabel.text = "\(sum + recomendPrice)원"
        }
    }
}
