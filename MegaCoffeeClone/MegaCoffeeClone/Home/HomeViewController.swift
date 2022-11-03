//import UIKit
//
//class HomeViewController: UIViewController {
//
//    @IBOutlet weak var mainHead: UIImageView!
//    @IBOutlet weak var bannerCollectionView: UICollectionView!
//
//    @IBOutlet weak var stampview: UIView!
//    @IBOutlet weak var StampbackgroundView: UIView!
//
//    @IBOutlet weak var stamp: UIView!
//    @IBOutlet weak var coupon: UIView!
//
//    @IBOutlet weak var Event: UIView!
//
//    @IBOutlet weak var homeRecommendCollectionView: UICollectionView!
//
//    //이벤트 이미지
//
//    var homeEventImage:[String] = ["event1","event2","event3","event4","event5"]
//
//    var homeNewsImage:[String] = ["homeNews1","homeNews2"]
//    var homeNewstest:[String] = ["[이벤트]할로윈 신메뉴 출시기념이벤트","[이벤트]가을 신메뉴 출시기념이벤트"]
//
//    var homeRecommendimage:[String] = ["menu1","menu1","menu3","menu4","menu5"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //gif
//        let MainHead = UIImage.gifImageWithName("MainHead")
//        mainHead.image = MainHead
//
//        //스탬프 사이즈
//        //  StampbackgroundView.layer.cornerRadius = 13
//        //   StampbackgroundView.layer.cornerRadius = 13
//
//
//    }
//}
//
//extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView.tag == 0 {
//            return homeEventImage.count
//        }
////        else{ //tag ==1
////            return homeNewsImage.count
////        }
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if collectionView.tag == 0{
//
//            let HomeEventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeEventCell", for: indexPath) as! HomeEventCollectionViewCell
//
//            HomeEventCell.homeEventImage.image = UIImage(named: homeEventImage[indexPath.row])
//            HomeEventCell.layer.cornerRadius = 15
//
//            return HomeEventCell
//
//        }
//        return UICollectionViewCell()
////        else { //tag == 1
////            let HomeNewsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeNewsCell", for: indexPath) as!
////            HomeNewsCollectionViewCell
////
////            HomeNewsCell.homeNewsImage.image = UIImage(named: homeNewsImage[indexPath.row])
////
////            return HomeNewsCell
////        }
//    }
//}
