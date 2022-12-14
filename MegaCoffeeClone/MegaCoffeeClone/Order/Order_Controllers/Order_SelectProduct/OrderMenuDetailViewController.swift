//
//  OrderMenuDetailViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/18.
//

import UIKit



class OrderMenuDetailViewController: UIViewController {
    
    @IBOutlet var menuDetailTableView: UITableView!
    
    var shoppingBasketButton: UIButton = {
        let button = ShoppingBasketButton()
        button.tintColor = .black
        return button
    }()
    
    var menuData: MenuModel2?
    var storeData: StoreModel?
    
    var menuCount = 1
    var menuPrice = 0
    var recomendPrice = 0
    var sum = 0
    var isOpen = true
    
    var selectedPriceList = [Int]()
    var recommendMenuPricesList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuPrice = menuData?.price ?? 0
        sum = menuData?.price ?? 0
        selectedPriceList = Array(repeating: 0, count: menuData?.option.count ?? 0)
        recommendMenuPricesList = Array(repeating: 0, count: recommendMenus.count)
        
        let safeAreaTop = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        let safeAreaBottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0

        menuDetailTableView.contentInset = UIEdgeInsets(top: -safeAreaTop, left: 0, bottom: -safeAreaBottom, right: 0)
        menuDetailTableView.sectionHeaderHeight = 0
        
        configShoppingBasketButton()
    }
    
    func configShoppingBasketButton() {
        shoppingBasketButton.addTarget(self, action: #selector(tapShoppingBasketButton), for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: shoppingBasketButton)
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 44).isActive = true
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        if let countLabel = shoppingBasketButton.subviews.last as? ShoppingBasketLabel {
            NSLayoutConstraint.activate([
                countLabel.topAnchor.constraint(equalTo: shoppingBasketButton.topAnchor),
                countLabel.trailingAnchor.constraint(equalTo: shoppingBasketButton.trailingAnchor)
            ])
        }
    }
    
    @objc func tapShoppingBasketButton() {
        let storyBoard = UIStoryboard(name: "OrderProductList", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "shoppingBasketVC") as? OrderShoppingBasketListViewController else { return }
        vc.storeData = storeData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension OrderMenuDetailViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return CGFloat.leastNormalMagnitude
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            isOpen.toggle()
            tableView.reloadSections(IndexSet(integer: 2), with: .fade)
        }
    }
}

extension OrderMenuDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return isOpen ? menuData?.option.count ?? 0 : 0
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? OrderMenuDetailTableViewCell else { return UITableViewCell() }
            cell.menuImageView.image = UIImage(named: menuData?.imageName ?? "")
            cell.menuNameLabel.text = menuData?.name
            cell.menuDescriptionLabel.text = menuData?.description
            cell.configSoldOutView(isSoldOut: menuData?.soldOut ?? false)
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") else { return UITableViewCell() }
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell2", for: indexPath) as? OrderMenuDetail2TableViewCell else { return UITableViewCell() }
            
            cell.row = indexPath.row
            cell.menuData = menuData
            cell.delegate = self
            
            if menuData?.option[indexPath.row].essentialCount != 0 {
                cell.isEssential = true
                cell.totalCount = menuData?.option[indexPath.row].essentialCount ?? 0
            }
            
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
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell3", for: indexPath) as? OrderMenuDetail3TableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.sumLabel.text = "\(sum)원"
            return cell
        } else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell4", for: indexPath) as? OrderMenuDetail4TableViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configBottomButton(isSoldOut: menuData?.soldOut ?? false)
            cell.sumLabel.text = "\(sum)원"
            return cell
        }
        return UITableViewCell()
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail2TableViewCellDelegate {
    func updateCount(row: Int, index: Int, count: Int) {
        menuData?.option[row].details[index].count = count
    }
    
    func changeSection2(row: Int, buttonIndex: Int) {
        
        if menuData?.option[row].essentialCount != 0 {
            menuData?.option[row].details[buttonIndex].isSelect.toggle()
        } else {
            let index = menuData?.option[row].details.firstIndex(where: {$0.isSelect == true}) ?? 0
            
            menuData?.option[row].details[index].isSelect = false
            menuData?.option[row].details[buttonIndex].isSelect = true
        }
        
        selectedPriceList[row] = menuData?.option[row].details[buttonIndex].price ?? 0
        
        sum = menuPrice * menuCount
        
        for price in selectedPriceList {
            sum += price * menuCount
        }
        
        
        if let section2Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderMenuDetail3TableViewCell,
           let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 4)) as? OrderMenuDetail4TableViewCell {
            section2Cell.sumLabel.text = "\(sum)원"
            section3Cell.sumLabel.text = "\(sum + recomendPrice)원"
        } else {
            menuDetailTableView.reloadSections(IndexSet(integer: 3), with: .automatic)
            menuDetailTableView.reloadSections(IndexSet(integer: 4), with: .automatic)
        }
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail3TableViewCellDelegate {
    func changeSection3(count: Int) {
        menuCount = count
        
        sum = menuPrice * menuCount
        
        for price in selectedPriceList {
            sum += price * menuCount
        }
        
        if let section2Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 3)) as? OrderMenuDetail3TableViewCell,
           let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 4)) as? OrderMenuDetail4TableViewCell {
            section2Cell.sumLabel.text = "\(sum)원"
            section3Cell.sumLabel.text = "\(sum + recomendPrice)원"
        }
    }
}

extension OrderMenuDetailViewController: OrderMenuDetail4TableViewCellDelegate {
    func changeSection4(index: Int) {
        if let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 4)) as? OrderMenuDetail4TableViewCell {
            
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
    
    func getShoppingBasketMenus() -> [ShoppingBasketModel] {
        // 키 이름은 매장이름으로 저장!!
        var shoppingBasketList = [ShoppingBasketModel]()
        
        if UserDefaults.standard.value(forKey: "test123") != nil {
            // 저장된 데이터 불러오기
            let decoder = PropertyListDecoder()
            
            do {
                if let data = UserDefaults.standard.value(forKey: "test123") as? Data {
                    let result = try decoder.decode(Array<ShoppingBasketModel>.self, from: data)
                    shoppingBasketList = result
                }
                
                
            } catch let e {
                print(e.localizedDescription)
            }
        } else {
            // 유저디폴트가 없으면 새로 생성
            let encoder = PropertyListEncoder()
            
            do {
                let data = try encoder.encode(shoppingBasketList)
                UserDefaults.standard.set(data, forKey: "test123")
            } catch let e {
                print(e.localizedDescription)
            }
        }
        
        return shoppingBasketList
    }
    
    // 이미지 URL 가져오기
    func saveImage() {
        do {
            if let imageData = UIImage(named: menuData?.imageName ?? "")?.pngData() {
                let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let directoryPath = documentPath.appendingPathComponent("shoppingBasketImage")
                let resultUrl = directoryPath.appendingPathComponent("\(menuData?.imageName ?? "")")
                
                // 폴더 경로 체크
                if !FileManager.default.fileExists(atPath: directoryPath.path) {
                    // 폴더 생성
                    try FileManager.default.createDirectory(at: directoryPath, withIntermediateDirectories: false, attributes: nil)
                    // 이미자파일 추가
                    try imageData.write(to: resultUrl)
                } else {
                    // 이미자파일 추가
                    try imageData.write(to: resultUrl)
                }
            }
        } catch let e {
            print("123123",e.localizedDescription)
        }
    }
    
    
    // 유저디폴트에 저장하기
    func saveUserDefaults(menus: [ShoppingBasketModel], isCreate: Bool) {
        
        let encoder = PropertyListEncoder()
        var copyMenus = menus
        var options = [DetailsModel]()
        
        if isCreate {
            for i in 0..<(menuData?.option.count ?? 0) {
                
                for detail in (menuData?.option[i].details ?? []) {
                    
                    if detail.isSelect == true {
                        
                        options.append(detail)
                    }
                }
            }
            
            let menu = ShoppingBasketModel(productName: menuData?.name ?? "", productImage: menuData?.imageName ?? "", options: options, count: menuCount, sumPrice: sum / menuCount, totalPrice: sum)
            saveImage()
            copyMenus.append(menu)
        }
        
        do {
            let data = try encoder.encode(copyMenus)
            UserDefaults.standard.set(data, forKey: "test123")
        } catch let e {
            print(e.localizedDescription)
        }
        
        
        // 1. 저장된 데이터 불러오기
        // 테스트용
        let decoder = PropertyListDecoder()
        do {
            if let data = UserDefaults.standard.value(forKey: "test123") as? Data {
                let result = try decoder.decode(Array<ShoppingBasketModel>.self, from: data)
                print("저장된 데이터",result)
            } else {
                print("없음")
            }
        } catch {
            
            
        }
    }
    
    func putShoppingBasket() {
        
        var menus = getShoppingBasketMenus()
        let name = menuData?.name ?? ""
        let count = menuCount
        var isCheckOptionNames = [Bool]()
        
        if menus.isEmpty {
            saveUserDefaults(menus: menus, isCreate: true)
        } else {
            // 비어있지 않을때
            // 메뉴 이름이 같은지 확인
            if menus.contains(where: {$0.productName == name}) {
                // 해당 메뉴 인덱스
                if let index = menus.firstIndex(where: {$0.productName == name}) {
                    // 현재 선택된 옵션만 필터링
                    if let filterOption = menuData?.option.map({$0.details.filter({$0.isSelect == true})}) {
                        for i in 0..<filterOption.count {
                            if filterOption[i][0].name == menus[index].options[i].name && filterOption[i][0].count == menus[index].options[i].count {
                                isCheckOptionNames.append(true)
                            } else {
                                isCheckOptionNames.append(false)
                            }
                        }
                    }
                    
                    if !isCheckOptionNames.contains(false) {
                        // 전부 동일할때
                        let count = menus[index].count + count
                        let totalPrice = menus[index].sumPrice * count
                        
                        menus[index].count = count
                        menus[index].totalPrice = totalPrice
                        
                        saveUserDefaults(menus: menus, isCreate: false)
                        
                    } else {
                        // 이름은 같지만 옵션이 다를때
                        saveUserDefaults(menus: menus, isCreate: true)
                        
                    }
                    
                }
            } else {
                // 메뉴 이름이 같은게 없을때
                // 바로 새로운 데이터 생성해서 추가
                saveUserDefaults(menus: menus, isCreate: true)
            }
        }
        
        
        
        // 불러온 데이터랑 저장할 데이터랑 같은게 있는지 확인
        // 같은게 있다면 카운트 + 토탈금액만 증가시키고
        // 없으면 새로 추가
        
        
        
        // 이미지 불러오기
        // 저장된 URL로
        //            do {
        //                let image = try UIImage(contentsOfFile: resultUrl.path)
        //                print(image)
        //            } catch {
        //
        //            }
        
        
        
    }
}

struct ShoppingBasketModel: Codable {
    let productName: String
    let productImage: String
    var options: [DetailsModel]
    var count: Int
    let sumPrice: Int
    var totalPrice: Int
}



// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 백업
/*
extension OrderMenuDetailViewController: OrderMenuDetail4TableViewCellDelegate {
    func changeSection4(index: Int) {
        if let section3Cell = menuDetailTableView.cellForRow(at: IndexPath(row: 0, section: 4)) as? OrderMenuDetail4TableViewCell {
            
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
    
    func getShoppingBasketMenus() -> [ShoppingBasketModel] {
        // 키 이름은 매장이름으로 저장!!
        var shoppingBasketList = [ShoppingBasketModel]()
        
        if UserDefaults.standard.value(forKey: "test123") != nil {
            // 저장된 데이터 불러오기
            let decoder = PropertyListDecoder()
            
            do {
                if let data = UserDefaults.standard.value(forKey: "test123") as? Data {
                    var result = try decoder.decode(Array<ShoppingBasketModel>.self, from: data)
                    
                    for i in 0..<result.count {
                        
                        for option in result[i].optionDatas {
                            let option = try decoder.decode(DetailsModel.self, from: option)
                            result[i].options.append(option)
                        }
                    }
                    shoppingBasketList = result
                }
                
                
            } catch let e {
                print(e.localizedDescription)
            }
        } else {
            // 유저디폴트가 없으면 새로 생성
            let encoder = PropertyListEncoder()
            
            do {
                let data = try encoder.encode(shoppingBasketList)
                UserDefaults.standard.set(data, forKey: "test123")
            } catch let e {
                print(e.localizedDescription)
            }
        }
        
        return shoppingBasketList
    }
    
    // 이미지 URL 가져오기
    func getImageUrl() -> URL {
        var url: URL?
        if let imageData = UIImage(named: menuData?.imageName ?? "")?.pngData() {
            let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let directoryPath = documentPath.appendingPathComponent("shoppingBasketImage")
            let resultUrl = directoryPath.appendingPathComponent("\(menuData?.imageName ?? "")")
            
            // 폴더 경로 체크
            if !FileManager.default.fileExists(atPath: resultUrl.path) {
                do {
                    // 폴더 생성
                    try FileManager.default.createDirectory(at: directoryPath, withIntermediateDirectories: false, attributes: nil)
                    // 이미자파일 추가
                    try imageData.write(to: resultUrl)
                    url = resultUrl
                } catch let e {
                    print(e.localizedDescription)
                }
            } else {
                do {
                    // 이미자파일 추가
                    try imageData.write(to: resultUrl)
                    url = resultUrl
                } catch let e {
                    print(e.localizedDescription)
                }
            }
        }
        return url ?? URL(string: "")!
    }
    
    
    // 유저디폴트에 저장하기
    func saveUserDefaults(menus: [ShoppingBasketModel], isCreate: Bool) {
        
        let encoder = PropertyListEncoder()
        var copyMenus = menus
        var optionDatas = [Data]()
        
        if isCreate {
            do {
                for i in 0..<(menuData?.option.count ?? 0) {
                    
                    for detail in (menuData?.option[i].details ?? []) {
                        
                        if detail.isSelect == true {
                            let optionData = try encoder.encode(detail)
                            optionDatas.append(optionData)
                            
                            
                        }
                    }
                }
            } catch let a {
                print(a.localizedDescription)
            }
            
            let imageURL = getImageUrl()
            
            let menu = ShoppingBasketModel(productName: menuData?.name ?? "", productImage: imageURL, optionDatas: optionDatas, options: [], count: menuCount, sumPrice: sum / menuCount, totalPrice: sum)
            
            copyMenus.append(menu)
            
        } else {
            for i in 0..<copyMenus.count {
                copyMenus[i].options.removeAll()
            }
            
            print(copyMenus)
            
        }
        
        do {
            let data = try encoder.encode(copyMenus)
            UserDefaults.standard.set(data, forKey: "test123")
        } catch let e {
            print(e.localizedDescription)
        }
        
        
        // 1. 저장된 데이터 불러오기
        let decoder = PropertyListDecoder()
        do {
            if let data = UserDefaults.standard.value(forKey: "test123") as? Data {
                var result = try decoder.decode(Array<ShoppingBasketModel>.self, from: data)
                
                for i in 0..<result.count {
                    
                    for option in result[i].optionDatas {
                        let option = try decoder.decode(DetailsModel.self, from: option)
                        result[i].options.append(option)
                    }
                }
                print("저장된 데이터",result)
            } else {
                print("없음")
            }
        } catch {
            
            
        }
    }
    
    func putShoppingBasket() {
        
        var menus = getShoppingBasketMenus()
        let name = menuData?.name ?? ""
        let count = menuCount
        var isCheckOptionNames = [Bool]()
        
        if menus.isEmpty {
            saveUserDefaults(menus: menus, isCreate: true)
        } else {
            // 비어있지 않을때
            // 메뉴 이름이 같은지 확인
            if menus.contains(where: {$0.productName == name}) {
                // 해당 메뉴 인덱스
                if let index = menus.firstIndex(where: {$0.productName == name}) {
                    // 현재 선택된 옵션만 필터링
                    if let filterOption = menuData?.option.map({$0.details.filter({$0.isSelect == true})}) {
                        for i in 0..<filterOption.count {
                            if filterOption[i][0].name == menus[index].options[i].name && filterOption[i][0].count == menus[index].options[i].count {
                                isCheckOptionNames.append(true)
                            } else {
                                isCheckOptionNames.append(false)
                            }
                        }
                    }
                    
                    if !isCheckOptionNames.contains(false) {
                        // 전부 동일할때
                        let count = menus[index].count + count
                        let totalPrice = menus[index].sumPrice * count
                        
                        menus[index].count = count
                        menus[index].totalPrice = totalPrice
                        
                        saveUserDefaults(menus: menus, isCreate: false)
                        
                    } else {
                        // 이름은 같지만 옵션이 다를때
                        saveUserDefaults(menus: menus, isCreate: true)
                        
                    }
                    
                }
            } else {
                // 메뉴 이름이 같은게 없을때
                // 바로 새로운 데이터 생성해서 추가
                saveUserDefaults(menus: menus, isCreate: true)
            }
        }
        
        
        
        // 불러온 데이터랑 저장할 데이터랑 같은게 있는지 확인
        // 같은게 있다면 카운트 + 토탈금액만 증가시키고
        // 없으면 새로 추가
        
        
        
        // 이미지 불러오기
        // 저장된 URL로
        //            do {
        //                let image = try UIImage(contentsOfFile: resultUrl.path)
        //                print(image)
        //            } catch {
        //
        //            }
        
        
        
    }
}

struct ShoppingBasketModel: Codable {
    let productName: String
    let productImage: URL
    var optionDatas: [Data]
    var options: [DetailsModel]
    var count: Int
    let sumPrice: Int
    var totalPrice: Int
}
*/
