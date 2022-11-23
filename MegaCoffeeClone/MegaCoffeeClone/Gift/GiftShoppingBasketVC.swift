//
//  GiftShoppingBasketVC.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/14.
//
//ShoppingBasket에 대한 모델을 만들어 DetailViewController에서 넣은 값들을 불러오자

import UIKit
import CoreData

class GiftShoppingBasketVC: UIViewController, CanCelDelegate {
    
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    var itemArray = [Item]()
    
    var location: Int?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shoppingTableView.register(UINib(nibName: "GiftShoppingBasketTableViewCell", bundle: nil), forCellReuseIdentifier: "tableShoppingCell")
        loadItems()
        print("3", itemArray)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        
        
    }
    
    
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
    
    func saveItems() {
        //CoreData에 저장
        do {
            print(context)
            
            try context.save()
            
        } catch {
            print("error saving context - \(error)")
        }
    }
    
    func loadItems() {
        //CoreData에서 불러오기
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
          itemArray = try context.fetch(request)
    
        } catch {
            print("error loading Items - \(error)")
        }
    }
    
    
    func cancelClicked(index: Int) {
        itemArray.remove(at: index)
        context.delete(itemArray[index])
        
        if itemArray.count == 0 {
            let alert = UIAlertController(title: "", message: "장바구니에 담긴 상품이 없습니다.선물하기 메인 화면으로 이동합니다.", preferredStyle: UIAlertController.Style.alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
                   }
            alert.addAction(confirmAction)
            present(alert, animated: false, completion: nil)

        }
        loadItems()
        shoppingTableView.reloadData()
        

    }
    
}

extension GiftShoppingBasketVC: UITableViewDelegate {
    
}

extension GiftShoppingBasketVC: UITableViewDataSource {
    
 
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "주문가능한 상품"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableShoppingCell", for: indexPath) as! GiftShoppingBasketTableViewCell
        cell.productImageview.image = UIImage()
        cell.nameLabel.text = itemArray[indexPath.row].name! 
        cell.priceLabel.text = "\(itemArray[indexPath.row].total)"
        cell.numberOfLabel.text = "\(itemArray[indexPath.row].number)"
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        location = indexPath.row
        cell.row = indexPath.row
        cell.cancelDelegate = self
        cell.number = Int(cell.numberOfLabel.text!)!
        return cell
    }
    
    
    
}
