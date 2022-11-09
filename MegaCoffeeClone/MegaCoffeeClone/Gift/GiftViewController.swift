//
//  GiftViewController.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/10/12.
//https://ios-development.tistory.com/945 (Section > Group > Item)
// 11/2 testtest
import UIKit

class GiftViewController: ViewController {
    

    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet var mainMenuButton: [UIButton]!
    
    var categoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainCollectionView.collectionViewLayout = getLayout()
        
        self.mainCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCell")
        
        self.mainCollectionView.register(UINib(nibName: "newEventCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        
        self.mainCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
    }
    
    private func  instantiateSegmentedViewControllers() {
        guard let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoryVC")
        else { fatalError()}
        
        self.addChild(categoryVC)
        categoryVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(categoryVC.view)
        self.categoryView = categoryVC.view
        
       
    }
  
    @IBAction func mainMenuClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == "카테고리" {
            instantiateSegmentedViewControllers()
        }
//        if sender.titleLabel?.text == "카테고리" {
//            guard let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryView") as? CategoryViewController else { return }
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: false)
//            
//        }else if sender.titleLabel?.text == "선물함" {
//            guard let vc = storyboard?.instantiateViewController(withIdentifier: "GiftBoxView") as? GiftBoxViewController else { return }
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: false)
//        }
        
        
    }
    
    func getLayout() -> UICollectionViewCompositionalLayout {
            UICollectionViewCompositionalLayout { (section , env) -> NSCollectionLayoutSection in
                switch section {
                case 0:
                    return self.firstSection()
                case 1:
                    return self.secondeSection()
                case 2:
                    return self.thirdSection()
                case 3:
                    return self.fourthSection()

                default:
                    return self.firstSection()
                }
            }
        }
    
    
    func firstSection() -> NSCollectionLayoutSection {
        
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(260))
        
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .absolute(260))
        
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: mainImages.count)
            
            let section = NSCollectionLayoutSection(group: group)
        
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            section.orthogonalScrollingBehavior = .paging
            

          
            return section
        }
        
    
        func secondeSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(220))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(5.2), heightDimension: .absolute(220))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: RecommendMenu.count)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 140, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
        
            return section
        }
    
    
        func thirdSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(200))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 8)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.2), heightDimension: .absolute(200))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: MegaCardMenu.count)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
        
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
 
             section.boundarySupplementaryItems = [header]
             section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
        
    
        func fourthSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(200))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 8)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(5.1), heightDimension: .absolute(200))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: BestMenu.count)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 0)
        
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            
            section.boundarySupplementaryItems = [header]
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
    
    
    

    @IBAction func exclamationmarkClicked(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PopUPView") as? PopUpViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    
        
}

extension GiftViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return mainImages.count
        } else if section == 1 {
            return RecommendMenu.count
        } else if section == 2 {
            return MegaCardMenu.count
        } else {
            return BestMenu.count
        }
            
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! newEventCollectionViewCell
            //cell.mainImageView.image = mainImages[indexPath.row]
            
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! MainCollectionViewCell
            //cell.menuImageView.image = RecommendMenu[indexPath.row].image
            //cell.menuNameLabel.text = RecommendMenu[indexPath.row].name
            //cell.menuPriceLabel.text = "\(RecommendMenu[indexPath.row].price)원"
            return cell
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! MainCollectionViewCell
            //cell.menuImageView.image = MegaCardMenu[indexPath.row].image
            //cell.menuNameLabel.text = MegaCardMenu[indexPath.row].name
            //cell.menuPriceLabel.text = "\(MegaCardMenu[indexPath.row].price)원"
            return cell
            
        }else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! MainCollectionViewCell
            //cell.menuImageView.image = BestMenu[indexPath.row].image
            //cell.menuNameLabel.text = BestMenu[indexPath.row].name
            //cell.menuPriceLabel.text = "\(BestMenu[indexPath.row].price)원"
            return cell
        }
    }
    
}

extension GiftViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectionReusableView
        

        if indexPath.section == 2 {
            headerView.headerLabel.text = "메가선불카드"
            return headerView
        } else if indexPath.section == 3 {
            headerView.headerLabel.text = "BEST"
            return headerView
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc =  storyboard?.instantiateViewController(identifier: "DetailView") as? DetailViewController else
                { return }
        vc.location = indexPath
        //이 프로퍼티에 접근해서 데이터를 저장했다고 그대로 저장되는것이 아니라, 정확한 데이터의 전달은 이후 push하면서 일어나게 된다
        if indexPath.section == 1 || indexPath.section == 3 {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   

    
}


