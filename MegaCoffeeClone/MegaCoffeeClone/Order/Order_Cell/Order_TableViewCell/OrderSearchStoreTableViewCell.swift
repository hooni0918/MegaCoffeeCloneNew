//
//  SearchStoreTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import UIKit

protocol SearchStoreTableViewCellDelegate {
    func changeIsFiltering(state: Bool)
    func searchButtonClicked(text: String)
}

class SearchStoreTableViewCell: UITableViewCell {

    @IBOutlet var searchBar: UISearchBar!
    var delegate: SearchStoreTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
       configSearchBar()
    }
    
    func configSearchBar() {
        searchBar.delegate = self
        
        searchBar.placeholder = "지점명으로 검색"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SearchStoreTableViewCell: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        delegate?.changeIsFiltering(state: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            DispatchQueue.main.async {
                self.delegate?.changeIsFiltering(state: false)
                searchBar.resignFirstResponder()
            }
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            delegate?.searchButtonClicked(text: text)
        }
    }
}
