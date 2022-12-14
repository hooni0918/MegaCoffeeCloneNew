//
//  OrderShoppingBasketListViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/28.
//

import UIKit

class OrderShoppingBasketListViewController: UIViewController {
    
    @IBOutlet var shoppingBasketListTableView: UITableView!
    
    var shoppingBasketList = [ShoppingBasketModel]()
    var storeData: StoreModel?
    
    @IBOutlet var storeNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "OrderShoppingBasketListTableViewCell", bundle: nil)
        shoppingBasketListTableView.register(nibName, forCellReuseIdentifier: "menuCell")

        getShoppingBasketList()
        
        storeNameLabel.text = storeData?.name ?? ""
        
        shoppingBasketListTableView.tableHeaderView?.frame.size.height = 50
    }
    
    func getImage(name: String) -> UIImage {
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryPath = documentPath.appendingPathComponent("shoppingBasketImage")
        let resultUrl = directoryPath.appendingPathComponent(name)
        return UIImage(contentsOfFile: resultUrl.path) ?? UIImage()
    }
    
    
    // 매장별로 키값 바꾸기
    func getShoppingBasketList() {
        let decoder = PropertyListDecoder()
        
        do {
            if let data = UserDefaults.standard.value(forKey: "test123") as? Data {
                let result = try decoder.decode(Array<ShoppingBasketModel>.self, from: data)
                
                shoppingBasketList = result
                
                DispatchQueue.main.async {
                    self.shoppingBasketListTableView.reloadData()
                }
            }
        } catch let e {
            print(e.localizedDescription)
        }
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(shoppingBasketList)
            UserDefaults.standard.set(data, forKey: "test123")
        } catch let e {
            print(e.localizedDescription)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapOrderButton(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "paymentVC") as? OrderPaymentViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension OrderShoppingBasketListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return shoppingBasketList.count
        } else if section == 2 {
            // 품절 제품 있을때 추가
            return 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? OrderShoppingBasketHeaderTableViewCell else { return UITableViewCell() }
            cell.titleLabel.text = "주문 상품"
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? OrderShoppingBasketListTableViewCell else { return UITableViewCell() }
            
            var str = ""
            
            let target = shoppingBasketList[indexPath.row]
            
            for i in shoppingBasketList[indexPath.row].options {
                str += "\(i.name)x\(i.count)\n"
            }
            
            cell.delegate = self
            
            cell.menuNameLabel.text = target.productName
            cell.menuOptionLabel.text = str
            cell.menuCountLabel.text = "\(target.count)"
            cell.menuTotalPriceLabel.text = "\(target.totalPrice)원"
            cell.deleteButton.tag = indexPath.row
            cell.minusButton.tag = indexPath.row
            cell.plusButton.tag = indexPath.row
            
            DispatchQueue.main.async {
                cell.menuImageView.image = self.getImage(name: target.productImage)
            }
            
            return cell
        } else if indexPath.section == 2 {
            return UITableViewCell()
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell")
            return cell!
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as? OrderShoppingBasketOrderTableViewCell else { return UITableViewCell() }
            cell.configButton(isOn: storeData?.isOn ?? false)
            
            var sum = 0
            for menu in shoppingBasketList {
                sum += menu.totalPrice
            }
            
            cell.totalPriceLabel.text = "\(sum)원"
            return cell
        }
    }
}

extension OrderShoppingBasketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 3 {
            return 50
        }
        
        return UITableView.automaticDimension
    }
}


extension OrderShoppingBasketListViewController: OrderShoppingBasketListTableViewCellDelegate {
    func deleteMenu(index: Int) {
        shoppingBasketList.remove(at: index)
        
        DispatchQueue.main.async {
            self.shoppingBasketListTableView.reloadData()
        }
    }
    
    func minusMenuCount(index: Int) {
        if let cell = shoppingBasketListTableView.cellForRow(at: IndexPath(row: index, section: 0)) as? OrderShoppingBasketListTableViewCell {
            
            if shoppingBasketList[index].count != 1 {
                shoppingBasketList[index].count -= 1
                
                shoppingBasketList[index].totalPrice = shoppingBasketList[index].sumPrice * shoppingBasketList[index].count
                
                cell.menuCountLabel.text = "\(shoppingBasketList[index].count)"
                cell.menuTotalPriceLabel.text = "\(shoppingBasketList[index].totalPrice)원"
            }
        }
        
        if let orderCell = shoppingBasketListTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderShoppingBasketOrderTableViewCell {
            var sum = 0
            
            for menu in shoppingBasketList {
                sum += menu.totalPrice
            }
            
            orderCell.totalPriceLabel.text = "\(sum)"
        } else {
            shoppingBasketListTableView.reloadSections(IndexSet(integer: 3), with: .automatic)
        }
        
    }
    
    func plusMenuCount(index: Int) {
        if let cell = shoppingBasketListTableView.cellForRow(at: IndexPath(row: index, section: 0)) as? OrderShoppingBasketListTableViewCell {
            shoppingBasketList[index].count += 1
            
            shoppingBasketList[index].totalPrice = shoppingBasketList[index].sumPrice * shoppingBasketList[index].count
            
            cell.menuCountLabel.text = "\(shoppingBasketList[index].count)"
            cell.menuTotalPriceLabel.text = "\(shoppingBasketList[index].totalPrice)원"
        }
        
        if let orderCell = shoppingBasketListTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderShoppingBasketOrderTableViewCell {
            var sum = 0
            
            for menu in shoppingBasketList {
                sum += menu.totalPrice
            }
            
            orderCell.totalPriceLabel.text = "\(sum)원"
        } else {
            shoppingBasketListTableView.reloadSections(IndexSet(integer: 3), with: .automatic)
        }
    }
}
