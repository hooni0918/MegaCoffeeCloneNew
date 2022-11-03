//
//  OrderListViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/17.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet var productListCollectionView: UICollectionView!
    @IBOutlet var changeStoreButton: UIButton!
    
    var is1Column = false
    var categoryIndex = 0
    var storeData: StoreModel?
    
    var filteredProducts = [ProductsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationBarReightButton()
        productListCollectionView.collectionViewLayout = getLayout()
        
        let nibName = UINib(nibName: "OrderProductCollectionViewCell", bundle: nil)
        let nibName2 = UINib(nibName: "OrderProduct1ColumnCollectionViewCell", bundle: nil)
        productListCollectionView.register(nibName, forCellWithReuseIdentifier: "productCell")
        productListCollectionView.register(nibName2, forCellWithReuseIdentifier: "product1ColumnCell")
        
        categorys[0].isSelected = true
        filteredProducts = products.filter({$0.type.rawValue == categoryIndex})
        
        changeStoreButton.setTitle(storeData?.name, for: .normal)
    }

    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func makeNavigationBarRightButton(imageName: String, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.tintColor = .black
        
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        return barButtonItem
    }
    
    private func configNavigationBarReightButton() {
        let magnifyingglassButton = makeNavigationBarRightButton(imageName: "magnifyingglass", action: #selector(tapMagnifyingglassButton))
        
        let exclamationmarkButton = makeNavigationBarRightButton(imageName: "exclamationmark.circle", action: #selector(tapExclamationmarkButton))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 10
        
        self.navigationItem.rightBarButtonItems = [exclamationmarkButton, spacer, magnifyingglassButton]
    }
    
    @objc func tapMagnifyingglassButton() {
        print("1")
    }
    
    @objc func tapExclamationmarkButton() {
        print("2")
    }
    
    func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection in
            switch section {
            case 0:
                return self.categorySection()
            case 1:
                if self.is1Column {
                    return self.product1ColumnSection()
                } else {
                    return self.product3ColumnSection()
                }
               
            case 2:
                return self.informationSection()
            default:
                return NSCollectionLayoutSection(group: NSCollectionLayoutGroup(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(0), heightDimension: .absolute(0))))
            }
        }
    }
    
    func categorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
    
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(5), top: .none, trailing: .none, bottom: .none)
    
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)

        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }

    
    func product3ColumnSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .estimated(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
     
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func product1ColumnSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func informationSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
            
        return section
    }
}

 
extension OrderListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categorys.count
        } else if section == 1 {
            return filteredProducts[0].products.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catagoryCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
 
            cell.categoryNameLabel.text = categorys[indexPath.row].name
            cell.tag = indexPath.row
            
            if categorys[indexPath.row].isSelected {
                cell.backgroundColor = .black
                cell.layer.borderColor = UIColor.black.cgColor
                cell.categoryNameLabel.textColor = .white
            } else {
                cell.backgroundColor = .white
                cell.layer.borderColor = UIColor.systemGray4.cgColor
                cell.categoryNameLabel.textColor = .darkGray
            }
            
            return cell
            
        } else if indexPath.section == 1 {
            if is1Column {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product1ColumnCell", for: indexPath) as? OrderProduct1ColumnCollectionViewCell else{ return UICollectionViewCell() }
                
                cell.nameLabel.text = filteredProducts[0].products[indexPath.row].name
                cell.priceLabel.text = "\(filteredProducts[0].products[indexPath.row].price)원"
                
                if filteredProducts[0].products[indexPath.row].soldOut {
                    cell.soldOutView.isHidden = false
                    cell.soldOutLabel.isHidden = false
                } else {
                    cell.soldOutView.isHidden = true
                    cell.soldOutLabel.isHidden = true
                }
                return cell
                
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? OrderProductCollectionViewCell else { return UICollectionViewCell() }
                
                cell.productNameLabel.text = filteredProducts[0].products[indexPath.row].name
                cell.priceLabel.text = "\(filteredProducts[0].products[indexPath.row].price)원"
                
                if filteredProducts[0].products[indexPath.row].soldOut {
                    cell.soldOutView.isHidden = false
                    cell.soldOutLabel.isHidden = false
                } else {
                    cell.soldOutView.isHidden = true
                    cell.soldOutLabel.isHidden = true
                }
                return cell
            }
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InformationCell", for: indexPath) as? InformationCollectionViewCell else { return UICollectionViewCell() }
            cell.contentLabel.text = "(주)###### 대표이사: ### | 사업자등록번호: ###-##-##### | 대표번호: ####-####\n통신판매업신고번호: 제####-#####-####호\n경기 성남시 분당구 방아로 8 매송빌딩 4층\n\n######는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 ######는 상품거래정보 및 거래에 대한 책임을 지지 않습니다."
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as? OrderListHeaderCollectionReusableView else { return UICollectionReusableView() }
        header.countLabel.text = "\(products[categoryIndex].products.count)개"
        header.delegate = self
        
        if is1Column {
            header.changeColumnButton.setTitle("3 열 보기", for: .normal)
        } else {
            header.changeColumnButton.setTitle("1 열 보기", for: .normal)
        }
        
        return header
    }
}

extension OrderListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let cell = collectionView.cellForItem(at: indexPath) {
                categoryIndex = cell.tag
                
                for index in 0..<categorys.count {
                    categorys[index].isSelected = index == cell.tag ? true : false
                }
                
                filteredProducts.removeAll()
                filteredProducts = products.filter({$0.type.rawValue == categoryIndex})
                productListCollectionView.reloadData()
            }
            
            
        } else if indexPath.section == 1 {
            let cell = collectionView.cellForItem(at: indexPath)
            print(cell?.tag)
        }
    }
}

extension OrderListViewController: OrderListHeaderCollectionReusableViewDelegate {
    func changeColumn() {
        is1Column.toggle()
        productListCollectionView.reloadSections(IndexSet(integer: 1))
    }
}
