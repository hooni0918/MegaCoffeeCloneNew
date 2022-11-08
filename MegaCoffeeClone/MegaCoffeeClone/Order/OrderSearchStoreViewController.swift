//
//  SearchStoreViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import UIKit

class SearchStoreViewController: UIViewController {
    
    @IBOutlet var storeListTableView: UITableView!
    
    var filteredStore = [StoreModel]()
    
    var isFiltering = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: "OrderStoreInfoTableViewCell", bundle: nil)
        storeListTableView.register(nibName, forCellReuseIdentifier: "storeCell")
        storeListTableView.keyboardDismissMode = .onDrag

    }
        
    @IBAction func tapCloseButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}

extension SearchStoreViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return isFiltering ? filteredStore.count : storeDatas.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchStoreTableViewCell else { return UITableViewCell() }
            searchCell.delegate = self

            return searchCell
        } else {
            
            print(indexPath.section, indexPath.row)
            
            guard let storeCell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath) as? StoreInfoTableViewCell else { return UITableViewCell() }
            if isFiltering {
                storeCell.nameLabel.text = filteredStore[indexPath.row].name
                storeCell.addressLabel.text = filteredStore[indexPath.row].address
                storeCell.distanceLabel.text = "\(filteredStore[indexPath.row].distance)m"
                
                storeCell.storeImageView.image = resizeImage(image: filteredStore[indexPath.row].storeImage, newWidth: 100)
                
                storeCell.nameLabel.alpha = filteredStore[indexPath.row].isOn ? 1 : 0.5
                storeCell.addressLabel.alpha = filteredStore[indexPath.row].isOn ? 1 : 0.5
                storeCell.distanceLabel.alpha = filteredStore[indexPath.row].isOn ? 1 : 0.5
                storeCell.storeOffView.isHidden = filteredStore[indexPath.row].isOn ? true : false
                storeCell.storeOffLabel.isHidden = filteredStore[indexPath.row].isOn ? true : false
            } else {
                storeCell.nameLabel.text = storeDatas[indexPath.row].name
                storeCell.addressLabel.text = storeDatas[indexPath.row].address
                storeCell.distanceLabel.text = "\(storeDatas[indexPath.row].distance)m"
                
                storeCell.storeImageView.image = resizeImage(image: storeDatas[indexPath.row].storeImage, newWidth: 100)
                
                storeCell.nameLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
                storeCell.addressLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
                storeCell.distanceLabel.alpha = storeDatas[indexPath.row].isOn ? 1 : 0.5
                storeCell.storeOffView.isHidden = storeDatas[indexPath.row].isOn ? true : false
                storeCell.storeOffLabel.isHidden = storeDatas[indexPath.row].isOn ? true : false
            }
            return storeCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            loadPopupView(storeData: filteredStore[indexPath.row], topVC: VcType.search)
        } else {
            loadPopupView(storeData: storeDatas[indexPath.row], topVC: VcType.search)
        }
    }
}

extension SearchStoreViewController: UITableViewDelegate {
    
    // 검색중 스크롤시 에러 방지
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if filteredStore.isEmpty {
            isFiltering = false
        }
    }
}

extension SearchStoreViewController: SearchStoreTableViewCellDelegate {
   
    func changeIsFiltering(state: Bool) {
        isFiltering = state
        
        // x버튼 눌렀을때 storeDatas 테이블뷰에 보여주기
        if !isFiltering {
            storeListTableView.reloadData()
        }
    }
    
    func searchButtonClicked(text: String) {
        filteredStore.removeAll()
        filteredStore = storeDatas.filter({$0.name.contains(text)})
        storeListTableView.reloadData()
    }
}

