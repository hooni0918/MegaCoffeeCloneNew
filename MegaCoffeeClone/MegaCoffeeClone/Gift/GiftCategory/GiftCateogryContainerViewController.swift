//
//  CateogryViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/26.
//

import UIKit

class GiftCategoryContainerViewController: ViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lazy var findButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(clickedFind))
        
        giftCategory[0].isClicked = true
        
//        self.mainCollectionView.register(UINib(nibName: "GiftCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        self.categoryTableView.register(UINib(nibName: "GiftCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCustomCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for (index,_) in giftCategory.enumerated() {
            giftCategory[index].isClicked = false
        }
    }
    
    @objc func clickedFind() {
        
    }
    
    
}

extension GiftCategoryContainerViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! GiftCategoryCollectionViewCell
        cell.categoryLabel.text = giftCategory[indexPath.row].categoryName
        cell.tag = indexPath.row
        
        if giftCategory[indexPath.row].isClicked {
            cell.categoryView.layer.cornerRadius = 22
            cell.categoryView.layer.borderWidth = 0
            cell.categoryView.layer.borderColor = UIColor.lightGray.cgColor
            cell.categoryView.backgroundColor = UIColor.black
            cell.categoryLabel.font = .boldSystemFont(ofSize: 18)
            cell.categoryLabel.textColor = UIColor.white
            
        } else {
            cell.categoryView.layer.cornerRadius = 22
            cell.categoryView.layer.borderWidth = 1
            cell.categoryView.layer.borderColor = UIColor.lightGray.cgColor
            cell.categoryView.backgroundColor = UIColor.white
            cell.categoryLabel.font = .boldSystemFont(ofSize: 18)
            cell.categoryLabel.textColor = UIColor.lightGray
        }
        
        return cell
    }
    
}

extension GiftCategoryContainerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //click했을 때 호출되는 메서드가 아니라 click한 후에 진짜로 selected가 되었을 때 호출되는 메서드
//        giftCategory[indexPath.row].isClicked = true
        if let cell = collectionView.cellForItem(at: indexPath) {
            
            for (index,item) in giftCategory.enumerated() {
                giftCategory[index].isClicked = index == cell.tag ? true : false
                
                categoryCollectionView.reloadData()
            }
            
            print(giftCategory)
        }
    }
}

extension GiftCategoryContainerViewController: UITableViewDelegate {
    

    
}

extension GiftCategoryContainerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCustomCell", for: indexPath) as! GiftCategoryTableViewCell
        
        cell.productImageView.image = setMenu[indexPath.row].image
        cell.prodcutNameLabel.text = setMenu[indexPath.row].name
        cell.productPriceLabel.text = "\(setMenu[indexPath.row].price)원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc =  storyboard?.instantiateViewController(identifier: "DetailView") as? GiftDetailViewController else
                { return }
        vc.location = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
