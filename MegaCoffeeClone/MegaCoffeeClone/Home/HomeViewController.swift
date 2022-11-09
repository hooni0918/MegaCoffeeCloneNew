
import UIKit
import SafariServices

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HomePageBtn: UIButton!
    @IBOutlet weak var mainHead: UIImageView!
    @IBOutlet weak var HomeBarcode: UIButton!
    // @IBOutlet weak var HomeAlarm: UIButton!
    
    @IBOutlet weak var MainBackgroundView: UIView!
    
    
    @IBOutlet weak var StampbackgroundView: UIView!
    @IBOutlet weak var stamp: UIView!
    @IBOutlet weak var coupon: UIView!
    
    @IBOutlet weak var RecommendTable: UITableView!
    
    @IBOutlet weak var HomemainCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gif
        let MainHead = UIImage.gifImageWithName("MainHead")
        mainHead?.image = MainHead
        
        //스탬프 사이즈
        //  StampbackgroundView.layer.cornerRadius = 13
        StampbackgroundView?.layer.cornerRadius = 13
        MainBackgroundView?.layer.cornerRadius = 15
        HomePageBtn.layer.cornerRadius = 120
        HomemainCollectionView.collectionViewLayout = getLayout()
        
        
    }
    
    //MARK: 백링크
    @IBAction func touchupToLink(_ sender: Any) {
        let url = URL(string: "https://www.megamgccoffee.co.kr")
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true)
        //self.view.bringSubView(toFront: RecommendTable)
    }
    
}



 // MARK: compositional layout

func getLayout() -> UICollectionViewCompositionalLayout {
    UICollectionViewCompositionalLayout { (section , env) -> NSCollectionLayoutSection in
        switch section {
        case 0:
            return firstSection()
        case 1:
            return secondeSection()
        default:
            return firstSection()
        }
    }
}


func firstSection() -> NSCollectionLayoutSection {
    
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(260))
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .absolute(260))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 10)
    
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
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 10)
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 140, trailing: 0)
    section.orthogonalScrollingBehavior = .continuous
    
    return section
}



extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecell1", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecell2", for: indexPath)
            return cell
        }
    }
}
//
//extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if section == 0 {
//            return 10
//        } else if section == 1 {
//            return 10
//        } else {
//            return 10
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if indexPath.section == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecell1", for: indexPath) as! HomeNewEventCollectionViewCell
//            cell.HomeMainEvent.image = mainImages[indexPath.row]
//
//            return cell
//
//        } else if indexPath.section == 1 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecell2", for: indexPath) as! HomeMainCollectionViewCell
//            cell.HomeimageView.image = RecommendMenu[indexPath.row].image
//            cell.HomeViewLabel.text = RecommendMenu[indexPath.row].name
//            return cell
//        } else {
//            return UICollectionViewCell()
//        }
//    }

