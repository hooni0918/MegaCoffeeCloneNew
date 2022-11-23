import UIKit
import SafariServices

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HomePageBtn: UIButton!
    @IBOutlet weak var mainHead: UIImageView!
    @IBOutlet weak var HomeBarcode: UIButton!
    // @IBOutlet weak var HomeAlarm: UIButton!
    
    @IBOutlet weak var MainBackgroundView: UIView!
    @IBOutlet weak var homeBanner: UICollectionView!
    
    @IBOutlet weak var StampbackgroundView: UIView!
    @IBOutlet weak var stamp: UIView!
    @IBOutlet weak var coupon: UIView!
    
    @IBOutlet weak var HomemainCollectionView: UICollectionView!
    
    @IBOutlet weak var homeRecommend: UICollectionView!
    @IBOutlet weak var homeNews: UICollectionView!
    
    @IBOutlet weak var webButton: UIButton!
    
    @IBOutlet weak var webview: UIView!
    @IBOutlet weak var webimage: UIImageView!
    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0
    
    // Banner 데이터 배열
    let bannerDataArray: Array<UIImage> = [UIImage(named: "homeBanner1")!,UIImage(named: "homeBanner2")!,UIImage(named: "homeBanner3")!]
    
    //recommend 데이터배열
    var homeRecommendM:[String] = ["homeRecommend1","homeRecommend2","homeRecommend3","homeRecommend4"]
    
    var homeRecommendText:[String] = ["태극전사레드불에너지","스모어블랙쿠키프라페","(뜨거워)레드오렌지뱅쇼티플레져","따끈따끈간식꾸러미"]
    
    //news 데이터배열
    var homeNewsImagedata:[String] = ["img1","img2"]
    var homeNewsText:[String] = ["[이벤트] 겨울 신메뉴 출시기념 이벤트","뉴스2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //gif
        let MainHead = UIImage.gifImageWithName("MainHead")
        mainHead?.image = MainHead
        
        //스탬프 사이즈
        StampbackgroundView?.layer.cornerRadius = 13
        MainBackgroundView?.layer.cornerRadius = 15
        homeBanner?.layer.cornerRadius = 15
        //        HomePageBtn.layer.cornerRadius = 120
        //        HomemainCollectionView.collectionViewLayout = getLayout()
        
        //배너
        homeBanner?.register(HomeBannerCollectionViewCell.self, forCellWithReuseIdentifier: "HomeBannerCollectionViewCell")
        
        //recommend
        let nibcell = UINib(nibName: "HomeRecommendCollectionViewCell", bundle: nil)
        homeRecommend.register(nibcell, forCellWithReuseIdentifier: "cell2")
        
        
        // News
        let nibcell2 = UINib(nibName: "HomeNewsCollectionViewCell", bundle: nil)
        homeNews.register(nibcell2, forCellWithReuseIdentifier: "cell3")
        
        //쿠폰개월수
        
        //배너 타이머
        bannerTimer()
        
        //webview
        webButton.layer.cornerRadius = 0.5 * webButton.bounds.size.width
        webButton.clipsToBounds = true
        
        webimage.layer.cornerRadius = 0.5 * webimage.bounds.size.width
        webimage.clipsToBounds = true
        
        
        //button.translatesAutoresizingMaskIntoConstraints = false
    }
    //  NSLayoutConstraint.activate([
    
    //            button.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor, constant: -30),
    //            button.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -30])
    //
    
    //  Main화면에서 네비게이션 바 없애줌
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: 백링크
    @IBAction func touchupToLink(_ sender: Any) {
        let url = URL(string: "https://www.megamgccoffee.co.kr")
        let safariViewController = SFSafariViewController(url: url!)
        present(safariViewController, animated: true)
        //self.view.bringSubView(toFront: RecommendTable)
    }
    
    // 배너 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == bannerDataArray.count-1 {
            // 맨 처음 페이지로 돌아감
            homeBanner.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        homeBanner.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 100 {
            
            return bannerDataArray.count
            
        } else if collectionView.tag == 101 {
            return homeRecommendM.count
            
        } else if collectionView.tag == 102 {
            return homeNewsImagedata.count
        }
        
        return 10
        
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 100 {
            
            let cell = homeBanner.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! HomeBannerCollectionViewCell
            cell.homeBannerimg?.image = bannerDataArray[indexPath.row]
            return cell
            
        } else if collectionView.tag == 101 {
            
            let cell = homeRecommend.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! HomeRecommendCollectionViewCell
            cell.homeRecommendMenu.image = UIImage(named: homeRecommendM[indexPath.row])
            cell.homeRecommendLabel.text = homeRecommendText[indexPath.row]
            cell.homeBackView.layer.cornerRadius = cell.frame.width / 2
            cell.tag = indexPath.row // 0, 1 , 2 , 3
            
            //cell.homeRecommendLabel.layer.cornerRadius = cell.frame.height / 2
            return cell
            
        } else if collectionView.tag == 102 {
            let cell =  homeNews.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! HomeNewsCollectionViewCell
            cell.homeNewsImage.image = UIImage(named: homeNewsImagedata[indexPath.row])
            cell.homeNewsLabel.text = homeNewsText[indexPath.row]
            cell.homeNewsImage.layer.cornerRadius = 15
            
            return cell
        }
        return UICollectionViewCell()
        
    }
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 100 {
            return CGSize(width: homeBanner.frame.size.width  , height:  homeBanner.frame.height)
            
        }  else if  collectionView.tag == 101 {
            
            return CGSize(width: 150, height: 190)
            
        }  else if  collectionView.tag == 102 {
            return CGSize(width: 250, height: 200)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 101 {
            if let cell = collectionView.cellForItem(at: indexPath) as? HomeRecommendCollectionViewCell {
                
               
                
    
            }
        }
    }
    
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
}




// MARK: compositional layout
//
//func getLayout() -> UICollectionViewCompositionalLayout {
//    UICollectionViewCompositionalLayout { (section , env) -> NSCollectionLayoutSection in
//        switch section {
//        case 0:
//            return firstSection()
//        case 1:
//            return secondeSection()
//        default:
//            return firstSection()
//        }
//    }
//}
//
//
//func firstSection() -> NSCollectionLayoutSection {
//
//    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(260))
//
//    let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//    item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))
//
//    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2.0), heightDimension: .absolute(260))
//
//    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 10)
//
//    let section = NSCollectionLayoutSection(group: group)
//
//    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//
//    section.orthogonalScrollingBehavior = .paging

//    return section
//}
//
//func secondeSection() -> NSCollectionLayoutSection {
//    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(220))
//    let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//    item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
//
//    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(5.2), heightDimension: .absolute(220))
//    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 10)
//
//    let section = NSCollectionLayoutSection(group: group)
//    section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 140, trailing: 0)
//    section.orthogonalScrollingBehavior = .continuous
//
//    return section
//}
//



//
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if section == 0 {
//            return bannerDataArray.count
//        } else {
//            return 10
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if indexPath.section == 0 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecell1", for: indexPath)
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecell2", for: indexPath)
//            return cell
//        }
//    }
//}

