//
//  DummyDatas.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
// 123

import Foundation
import UIKit

struct StoreModel {
    let name: String
    let address: String
    let distance: Int
    let bookMark: Bool
    let isOn: Bool
    let storeImage: UIImage
}

struct CategoryModel {
    let name: String
    var isSelected: Bool
}


enum ProductType: Int {
    case set = 0
    case new = 1
    case hot = 2
    case ice = 3
    case smoothieAndFrappe = 4
    case aidAndJuice = 5
    case bottle = 6
    case tea = 7
    case coldBrew = 8
    case decaffeination = 9
    case beverage = 10
    case dessert = 11
    case md = 12
}

struct ProductsModel {
    let type: ProductType
    let products: [ProductModel]
    
    struct ProductModel {
        let name: String
        let price: Int
        let soldOut: Bool
    }
}


let storeDatas = [
    StoreModel(name: "평택장당점1", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점2", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점3", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점4", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점5", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점6", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점7", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점8", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점9", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점10", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점11", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점12", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점13", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점14", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage())
]

let likeStoreDatas = [
    StoreModel(name: "평택장당점1", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점2", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점3", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점4", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: true, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택장당점5", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage())
]

var categorys = [
    CategoryModel(name: "세트메뉴", isSelected: false),
    CategoryModel(name: "신메뉴", isSelected: false),
    CategoryModel(name: "커피(HOT)", isSelected: false),
    CategoryModel(name: "커피(ICE)", isSelected: false),
    CategoryModel(name: "스무디&프라페", isSelected: false),
    CategoryModel(name: "에이드&주스", isSelected: false),
    CategoryModel(name: "병음료", isSelected: false),
    CategoryModel(name: "Tea", isSelected: false),
    CategoryModel(name: "커피(콜드브루)", isSelected: false),
    CategoryModel(name: "디카페인", isSelected: false),
    CategoryModel(name: "BEVERAGE", isSelected: false),
    CategoryModel(name: "디저트", isSelected: false),
    CategoryModel(name: "MD상품", isSelected: false)
]


let products = [
    ProductsModel(type: .set, products: [ProductsModel.ProductModel(name: "버터소금빵(프레지덩버터)세트", price: 4700, soldOut: true),
                                         ProductsModel.ProductModel(name: "크루아상(프레지덩버터)세트", price: 4700, soldOut: true),
                                         ProductsModel.ProductModel(name: "잠봉버터블랙소금빵세트", price: 6900, soldOut: false),
                                         ProductsModel.ProductModel(name: "버터소금빵(쥬에그잼)세트", price: 5000, soldOut: false),
                                         ProductsModel.ProductModel(name: "크루아상(쥬에그잼)세트", price: 5000, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가디저트인기세트", price: 4400, soldOut: false),
                                         ProductsModel.ProductModel(name: "감자빵세트(HOT)", price: 5000, soldOut: false),
                                         ProductsModel.ProductModel(name: "감자빵세트(ICE)", price: 5500, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가스윗세트", price: 10000, soldOut: false),
                                         ProductsModel.ProductModel(name: "달콤한마카롱세트", price: 12600, soldOut: false),
                                         ProductsModel.ProductModel(name: "너랑 썸탈거야 세트", price: 10200, soldOut: false),
                                         ProductsModel.ProductModel(name: "달콤달콤해세트", price: 5800, soldOut: false),
                                         ProductsModel.ProductModel(name: "달콤충전세트", price: 10000, soldOut: false),
                                         ProductsModel.ProductModel(name: "달콤한잔세트", price: 4100, soldOut: false),
                                         ProductsModel.ProductModel(name: "달콤한하루세트", price: 5500, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가 꿀 조합 세트", price: 10400, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가POWER세트", price: 11200, soldOut: false),
                                         ProductsModel.ProductModel(name: "베리설렘세트", price: 6000, soldOut: false),
                                         ProductsModel.ProductModel(name: "수고했어오늘도세트", price: 6200, soldOut: false),
                                         ProductsModel.ProductModel(name: "아침은 내가 챙겨 줄게 세트", price: 5800, soldOut: false)]),
ProductsModel(type: .new, products: [ProductsModel.ProductModel(name: "청도홍시스무디", price: 4400, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)청도홍시수정과티플레저", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)청도홍시수정과티플레저", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "그릭요거홍시놀라", price: 4400, soldOut: true),
                                     ProductsModel.ProductModel(name: "경산대추과즐", price: 1900, soldOut: true),
                                     ProductsModel.ProductModel(name: "허니버터피자", price: 5100, soldOut: false),
                                     ProductsModel.ProductModel(name: "마르게리타피자", price: 5400, soldOut: false),
                                     ProductsModel.ProductModel(name: "장수오미자스무디", price: 3900, soldOut: true),
                                     ProductsModel.ProductModel(name: "샤인머스캣티플레저", price: 3900, soldOut: true)]),
ProductsModel(type: .hot, products: [ProductsModel.ProductModel(name: "(HOT)아메리카노", price: 1500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)꿀아메리카노", price: 2700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)헤이즐넛아메리카노", price: 2700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)바닐라아메리카노", price: 2700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)카페라떼", price: 2900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)카푸치노", price: 2900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)카라멜마끼아또", price: 3700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)바닐라라떼", price: 3400, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)헤이즐넛라떼", price: 3400, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)연유라떼", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)티라미수라떼", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)카페모카", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)민트카페모카", price: 4500, soldOut: false)]),
ProductsModel(type: .ice, products: [ProductsModel.ProductModel(name: "(ICE)아메리카노", price: 2000, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)꿀아메리카노", price: 2700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)헤이즐넛아메리카노", price: 2700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)바닐라아메리카노", price: 2700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)메가리카노", price: 3000, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)카페라떼", price: 2900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)카푸치노", price: 2900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)카라멜마끼아또", price: 3700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)바닐라라떼", price: 3400, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)헤이즐넛라떼", price: 3400, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)큐브라떼", price: 4200, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)티라미수라떼", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)카페모카", price: 3900, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)민트카페모카", price: 4500, soldOut: false)]),
ProductsModel(type: .smoothieAndFrappe, products: [ProductsModel.ProductModel(name: "플레인허니퐁크러쉬", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "초코허니퐁크러쉬", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "슈크림허니퐁크러쉬", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "쿠키프라페", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "딸기쿠키프라페", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "민트프라페", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "커피프라페", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "리얼초코프라페", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "녹차프라페", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "유니콘프라페", price: 4800, soldOut: false),
                                                   ProductsModel.ProductModel(name: "스트로베리치즈홀릭", price: 4500, soldOut: false),
                                                   ProductsModel.ProductModel(name: "플레인요거트스무디", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "딸기요거트스무디", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "망고요거트스무디", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "플레인퐁크러쉬", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "딸기퐁크러쉬", price: 3900, soldOut: false),
                                                   ProductsModel.ProductModel(name: "바나나퐁크러쉬", price: 3900, soldOut: false)]),
ProductsModel(type: .aidAndJuice, products: [ProductsModel.ProductModel(name: "레몬에이드", price: 3500, soldOut: false),
                                             ProductsModel.ProductModel(name: "블루레몬에이드", price: 3500, soldOut: false),
                                             ProductsModel.ProductModel(name: "자몽에이드", price: 3500, soldOut: false),
                                             ProductsModel.ProductModel(name: "메가에이드", price: 3900, soldOut: false),
                                             ProductsModel.ProductModel(name: "청포도에이드", price: 3500, soldOut: false),
                                             ProductsModel.ProductModel(name: "유니콘매직에이드", price: 3800, soldOut: false),
                                             ProductsModel.ProductModel(name: "유니콘매직에이드(블루)", price: 3800, soldOut: false),
                                             ProductsModel.ProductModel(name: "체리콕", price: 3300, soldOut: false),
                                             ProductsModel.ProductModel(name: "라임모히또", price: 3800, soldOut: false),
                                             ProductsModel.ProductModel(name: "청포도모히또", price: 3800, soldOut: false),
                                             ProductsModel.ProductModel(name: "자몽모히또", price: 3800, soldOut: false),
                                             ProductsModel.ProductModel(name: "딸기주스", price: 4000, soldOut: false),
                                             ProductsModel.ProductModel(name: "오곡바나나주스", price: 4000, soldOut: false),
                                             ProductsModel.ProductModel(name: "딸기바나나주스", price: 4000, soldOut: false),
                                             ProductsModel.ProductModel(name: "초코바나나주스", price: 4000, soldOut: false)]),
ProductsModel(type: .bottle, products: [ProductsModel.ProductModel(name: "갈바니나유기농레몬티", price: 3800, soldOut: false),
                                        ProductsModel.ProductModel(name: "갈바니나유기농복숭아티", price: 3800, soldOut: false),
                                        ProductsModel.ProductModel(name: "갈바니나유기농화이트티", price: 3800, soldOut: false),
                                        ProductsModel.ProductModel(name: "갈바니나유기농오렌지스파클링", price: 3800, soldOut: false),
                                        ProductsModel.ProductModel(name: "갈바니나유기농자몽스파클링", price: 3800, soldOut: false),
                                        ProductsModel.ProductModel(name: "뽀로로보리차", price: 1500, soldOut: false),
                                        ProductsModel.ProductModel(name: "뽀로로딸기", price: 1500, soldOut: false),
                                        ProductsModel.ProductModel(name: "뽀로로밀크", price: 1500, soldOut: false)]),
ProductsModel(type: .tea, products: [ProductsModel.ProductModel(name: "(HOT)녹차", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)페퍼민트", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)캐모마일", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)얼그레이", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)하니자몽블랙티", price: 3700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)레몬차", price: 3300, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)자몽차", price: 3300, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)유자차", price: 3300, soldOut: false),
                                     ProductsModel.ProductModel(name: "(HOT)사과유자차", price: 3500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)녹차", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)페퍼민트", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)캐모마일", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)얼그레이", price: 2500, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)허니자몽블랙티", price: 3700, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)레몬차", price: 3300, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)자몽차", price: 3300, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)유자차", price: 3300, soldOut: false),
                                     ProductsModel.ProductModel(name: "(ICE)사과유자차", price: 3500, soldOut: false),
                                     ProductsModel.ProductModel(name: "복숭아아이스티", price: 3000, soldOut: false)]),
ProductsModel(type: .coldBrew, products: [ProductsModel.ProductModel(name: "(HOT)콜드브루 오리지널", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)콜드브루 라떼", price: 4000, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)콜드브루 오리지널", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)콜드브루 라떼", price: 4000, soldOut: false),
                                          ProductsModel.ProductModel(name: "콜드브루 상품용", price: 20000, soldOut: false)]),
ProductsModel(type: .decaffeination, products: [ProductsModel.ProductModel(name: "(HOT)콜드브루 디카페인", price: 3500, soldOut: false),
                                                ProductsModel.ProductModel(name: "(ICE)콜드브루 디카페인", price: 3500, soldOut: false),
                                                ProductsModel.ProductModel(name: "(HOT)콜드브루 디카페인라떼", price: 4000, soldOut: false),
                                                ProductsModel.ProductModel(name: "(ICE)콜드브루 카페인라떼", price: 4000, soldOut: false),
                                                ProductsModel.ProductModel(name: "콜드브루디카페인 상품용", price: 20000, soldOut: false)]),
ProductsModel(type: .beverage, products: [ProductsModel.ProductModel(name: "한컵망고놀라", price: 3900, soldOut: false),
                                          ProductsModel.ProductModel(name: "그릭요거트망고놀라", price: 4400, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)흑당버블그린티라떼", price: 3800, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)흑당버블라떼", price: 3700, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)흑당버블밀크라떼", price: 3800, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)흑당라떼", price: 3300, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)흑당밀크티라떼", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)녹차라떼", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)핫초코", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)메가초코", price: 3800, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)민트크림초코", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)고구마라떼", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)곡물라떼", price: 3000, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)로얄밀크티라떼", price: 3700, soldOut: false),
                                          ProductsModel.ProductModel(name: "(HOT)토피넛라떼", price: 3800, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)녹차라떼", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "아이스초코", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)메가초코", price: 3800, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)민트초코크림", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)고구마라떼", price: 3500, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)곡물라떼", price: 3000, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)로얄밀크티라떼", price: 3700, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)오레오초코라떼", price: 3900, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)딸기라떼", price: 3700, soldOut: false),
                                          ProductsModel.ProductModel(name: "(ICE)토피넛라떼", price: 3800, soldOut: false)]),
ProductsModel(type: .dessert, products: [ProductsModel.ProductModel(name: "버터소금빵(프레지덩버터)", price: 3200, soldOut: false),
                                         ProductsModel.ProductModel(name: "크루아상(프레지덩버터)", price: 3200, soldOut: false),
                                         ProductsModel.ProductModel(name: "잠봉버터블랙소금빵", price: 5400, soldOut: false),
                                         ProductsModel.ProductModel(name: "버터소금빵(쥬에그잼)", price: 3500, soldOut: false),
                                         ProductsModel.ProductModel(name: "크루아상(쥬에그잼)", price: 3500, soldOut: false),
                                         ProductsModel.ProductModel(name: "제주당근에그마요샌드위치", price: 3400, soldOut: true),
                                         ProductsModel.ProductModel(name: "현무암돌빵", price: 2900, soldOut: false),
                                         ProductsModel.ProductModel(name: "아이스허니와앙슈", price: 2400, soldOut: false),
                                         ProductsModel.ProductModel(name: "감자빵", price: 3500, soldOut: false),
                                         ProductsModel.ProductModel(name: "콘참치샌드", price: 2200, soldOut: true),
                                         ProductsModel.ProductModel(name: "햄엔치즈샌드", price: 2000, soldOut: true),
                                         ProductsModel.ProductModel(name: "초코스모어쿠키", price: 2900, soldOut: false),
                                         ProductsModel.ProductModel(name: "말차스모어쿠키", price: 2900, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가쿠키(마카다미아)", price: 2000, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가쿠키(초코칩)", price: 2000, soldOut: false),
                                         ProductsModel.ProductModel(name: "플레인크로플", price: 2500, soldOut: false),
                                         ProductsModel.ProductModel(name: "체다치즈크로플", price: 3000, soldOut: true),
                                         ProductsModel.ProductModel(name: "아이스크림크로플", price: 3500, soldOut: true),
                                         ProductsModel.ProductModel(name: "떠먹는유자티라미수케이크", price: 4400, soldOut: false),
                                         ProductsModel.ProductModel(name: "떠먹는티라미수케이크", price: 3400, soldOut: false),
                                         ProductsModel.ProductModel(name: "떠먹는커피쿠키케이크", price: 3400, soldOut: false),
                                         ProductsModel.ProductModel(name: "떠먹는쿠키앤크림케이크", price: 3400, soldOut: false),
                                         ProductsModel.ProductModel(name: "몽쉘케이크", price: 5300, soldOut: false),
                                         ProductsModel.ProductModel(name: "치즈케익", price: 3500, soldOut: false),
                                         ProductsModel.ProductModel(name: "초코케익", price: 3500, soldOut: false),
                                         ProductsModel.ProductModel(name: "티라미수케익", price: 3500, soldOut: false),
                                         ProductsModel.ProductModel(name: "쿠키프라페마카롱", price: 2100, soldOut: false),
                                         ProductsModel.ProductModel(name: "유니콘프라페마카롱", price: 2100, soldOut: false),
                                         ProductsModel.ProductModel(name: "퐁크러쉬마카롱", price: 2100, soldOut: false),
                                         ProductsModel.ProductModel(name: "바닐라마카롱", price: 2100, soldOut: false),
                                         ProductsModel.ProductModel(name: "메가초코마카롱", price: 2100, soldOut: false),
                                         ProductsModel.ProductModel(name: "딸기요거트마카롱", price: 2100, soldOut: false),
                                         ProductsModel.ProductModel(name: "허니브레드", price: 4500, soldOut: false),
                                         ProductsModel.ProductModel(name: "크로크무슈", price: 3800, soldOut: false),
                                         ProductsModel.ProductModel(name: "핫도그", price: 2500, soldOut: false),
                                         ProductsModel.ProductModel(name: "보노미스폴리아띠네글라사떼", price: 900, soldOut: true),
                                         ProductsModel.ProductModel(name: "보노미스폴리아띠네쥬케라떼", price: 900, soldOut: true),
                                         ProductsModel.ProductModel(name: "장수오미자비건젤리", price: 1900, soldOut: true),
                                         ProductsModel.ProductModel(name: "장수사과비건젤리", price: 1900, soldOut: true),
                                         ProductsModel.ProductModel(name: "(포장)마카롱박스", price: 500, soldOut: false)]),
ProductsModel(type: .md, products: [ProductsModel.ProductModel(name: "스테비아 케이스", price: 5900, soldOut: false),
                                    ProductsModel.ProductModel(name: "머그컵(검정)", price: 9000, soldOut: false),
                                    ProductsModel.ProductModel(name: "머그컵(노랑)", price: 9000, soldOut: false),
                                    ProductsModel.ProductModel(name: "텀블러(실버)", price: 15000, soldOut: false),
                                    ProductsModel.ProductModel(name: "텀블러(브론즈)", price: 15000, soldOut: false),
                                    ProductsModel.ProductModel(name: "텀블러(화이트)", price: 15000, soldOut: false)])
]
