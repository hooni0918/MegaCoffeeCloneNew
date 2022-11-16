//
//  OrderSearchMenuViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

class OrderSearchProductViewController: UIViewController {

    @IBOutlet var searchProductTableView: UITableView!
    
    // 더미데이터에서 다시 만든 상품
    var searchProducts = [SearchProductModel]()
    var searchPagingProducts = [SearchProductModel]()
    
    // 필터링된 데이터 전부
    var filteredProducts = [SearchProductModel]()
    var filteredPagingProducts = [SearchProductModel]()
    
    var hasNextPage = false
    var isFiltering = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productCellNib = UINib(nibName: "OrderProductTableViewCell", bundle: nil)
        searchProductTableView.register(productCellNib, forCellReuseIdentifier: "product1ColumnCell")
        
        searchProductTableView.keyboardDismissMode = .onDrag
        configSearchProducts()
        fetchPaging()
        
    }
    
    func configSearchProducts() {

        var type = ""
        // 메뉴 카테고리 상관없이 섞기
        for productType in products {
            
            switch productType.type {
            case .set:
                type = "세트메뉴"
            case .new:
                type = "신메뉴"
            case .hot:
                type = "커피(HOT)"
            case .ice:
                type = "커피(ICE)"
            case .smoothieAndFrappe:
                type = "스무디&프라페"
            case .aidAndJuice:
                type = "에이드&주스"
            case .bottle:
                type = "병음료"
            case .tea:
                type = "Tea"
            case .coldBrew:
                type = "콜드브루"
            case .decaffeination:
                type = "디카페인"
            case .beverage:
                type = "BEVERAGE"
            case .dessert:
                type = "디저트"
            case .md:
                type = "MD상품"
            }
            
            for product in productType.products {
                let productData = SearchProductModel(type: type, products: SearchProductModel.ProductModel(name: product.name, price: product.price, soldOut: product.soldOut))
                searchProducts.append(productData)
            }
        }
        
        searchProducts.shuffle()
    }
    
    func fetchPaging() {
    
        var datas = [SearchProductModel]()
      
        if isFiltering {
            let index = filteredPagingProducts.count
            
            for i in index...(index + 9) {
                if i == filteredProducts.count {
                    hasNextPage = false
                    break
                } else {
                    datas.append(filteredProducts[i])
                    hasNextPage = true
                }
            }
            filteredPagingProducts.append(contentsOf: datas)
            
        } else {
            let index = searchPagingProducts.count
            
            for i in index...(index + 9) {
                if i == searchProducts.count {
                    hasNextPage = false
                    break
                } else {
                    datas.append(searchProducts[i])
                    hasNextPage = true
                }
            }
            searchPagingProducts.append(contentsOf: datas)
        }
        
        DispatchQueue.main.async {
            self.searchProductTableView.reloadData()
        }
        
    }

    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}

extension OrderSearchProductViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if hasNextPage {
            return 3
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
            return 1
        } else if section == 1 {
            return isFiltering ? filteredPagingProducts.count : searchPagingProducts.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? OrderSearchProductTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "product1ColumnCell", for: indexPath) as? OrderProductTableViewCell else { return UITableViewCell() }
            
            if isFiltering {
                if filteredPagingProducts[indexPath.row].products.soldOut {
                    cell.soldOutView.isHidden = false
                    cell.soldOutLabel.isHidden = false
                } else {
                    cell.soldOutView.isHidden = true
                    cell.soldOutLabel.isHidden = true
                }
                
                cell.productNameLabel.text = "[\(filteredPagingProducts[indexPath.row].type)] \(filteredPagingProducts[indexPath.row].products.name)"
                cell.productPriceLabel.text = "\(filteredPagingProducts[indexPath.row].products.price)원"

                return cell
            } else {
                if searchPagingProducts[indexPath.row].products.soldOut {
                    cell.soldOutView.isHidden = false
                    cell.soldOutLabel.isHidden = false
                } else {
                    cell.soldOutView.isHidden = true
                    cell.soldOutLabel.isHidden = true
                }
                
                cell.productNameLabel.text = "[\(searchPagingProducts[indexPath.row].type)] \(searchPagingProducts[indexPath.row].products.name)"
                cell.productPriceLabel.text = "\(searchPagingProducts[indexPath.row].products.price)원"

                return cell
            }
            
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as? OrderMoreProductsButtonTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
    }
}


extension OrderSearchProductViewController: UITableViewDelegate {

}

extension OrderSearchProductViewController: OrderMoreProductsButtonTableViewCellDelegate {
    func fetchPagingProducts() {
        fetchPaging()
    }
}
  
extension OrderSearchProductViewController: OrderSearchProductTableViewCellDelegate {
    
    func searchButtonClicked(text: String, state: Bool) {
        if state {
            isFiltering = state
            filteredProducts.removeAll()
            filteredPagingProducts.removeAll()
            filteredProducts = searchProducts.filter({$0.products.name.contains(text)})
        } else {
            isFiltering = state
            searchPagingProducts.removeAll()
        }
        fetchPaging()
    }
}
