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
    StoreModel(name: "평택이충점1", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점2", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점3", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점4", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점5", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점6", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점7", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점8", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점9", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택이충점10", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점1", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점2", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점3", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점4", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점5", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점6", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점7", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점8", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점9", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택송탄점10", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점1", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점2", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점3", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점4", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점5", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점6", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점7", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점8", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점9", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage()),
    StoreModel(name: "평택고덕점10", address: "경기도 평택시 송탄로40번길 79-21", distance: 345, bookMark: false, isOn: false, storeImage: UIImage(named: "MegaCoffeeStore") ?? UIImage())
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
    CategoryModel(name: "AR손흥민 메뉴", isSelected: false),
    CategoryModel(name: "병음료", isSelected: false),
    CategoryModel(name: "Tea", isSelected: false),
    CategoryModel(name: "커피(콜드브루)", isSelected: false),
    CategoryModel(name: "디카페인", isSelected: false),
    CategoryModel(name: "BEVERAGE", isSelected: false),
    CategoryModel(name: "디저트", isSelected: false),
    CategoryModel(name: "MD상품", isSelected: false)
]


// MARK: 상품 데이터 모델
enum MenuType2: String {
    case set = "세트메뉴"
    case new = "신메뉴"
    case hot = "커피(HOT)"
    case ice = "커피(ICE)"
    case smoothieAndFrappe = "스무디&프라페"
    case aidAndJuice = "에이드&주스"
    case arSonMenu = "AR손흥민 메뉴"
    case bottle = "병음료"
    case tea = "Tea"
    case coldBrew = "커피(콜드브루)"
    case decaffeination = "디카페인"
    case beverage = "BEVERAGE"
    case dessert = "디저트"
    case md = "MD상품"
}

struct MenusModel {
    let type: MenuType2
    var menus: [MenuModel2]
}

struct MenuModel2 {
    let imageName: String
    let name: String
    let description: String
    var option: [OptionModel]
    let nutrition: NutritionModel
    let allergys: AllergyModel
    let price: Int
    let soldOut: Bool
}

struct OptionModel {
    let essentialCount: Int
    let header: String
    var details: [DetailsModel]
}

struct DetailsModel: Codable {
    let name: String
    let price: Int
    var count: Int
    let soldOut: Bool
    var isSelect: Bool
}

struct NutritionModel {
    let calorie: Double?
    let saturatedFat: Double?
    let sugars: Double?
    let natrium: Double?
    let protein: Double?
    let caffeine: Double?
}

struct AllergyModel {
    let names: [String]?
}

struct SearchProductModel {
    let type: String
    let products: MenuModel2
}

struct RecommendMenuModel {
    let image: UIImage
    let name: String
    let price: Int
    var isSelect: Bool
}

let menuList = [
    MenusModel(type: .set,
               menus: [MenuModel2(imageName: "ICE-32oz Americano",
                                  name: "버터소금빵(프레지덩버터)세트",
                                  description: "버터소금빵 + 프레지덩 버터 + (HOT)아메리카노 = 4,700원",
                                  option: [OptionModel(essentialCount: 0,
                                                       header: "버터소금빵 선택",
                                                       details: [DetailsModel(name: "버터소금빵(프레지덩버터)",price: 0, count: 1, soldOut: false, isSelect: true)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "아메리카노 선택(HOT/ICE)",
                                                       details: [DetailsModel(name: "(HOT)아메리카노", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "(ICE)아메리카노 +500원", price: 500, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "농도",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "연하게", price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "샷 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "2샷 추가 +1000원", price: 1000, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "프레지덩버터추가구매",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "프레지덩버터 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false)])],
                                  nutrition: NutritionModel(calorie: nil,
                                                            saturatedFat: nil,
                                                            sugars: nil,
                                                            natrium: nil,
                                                            protein: nil,
                                                            caffeine: nil),
                                  allergys: AllergyModel(names: nil),
                                  price: 4700,
                                  soldOut: true),
                       MenuModel2(imageName: "ICE-Applecitron Tea",
                                  name: "크루아상(프레지덩버터)세트",
                                  description: "크루아상 + 프레지덩 버터 + (HOT)아메리카노 = 4,700원",
                                  option: [OptionModel(essentialCount: 0,
                                                       header: "크루아상 선택",
                                                       details: [DetailsModel(name: "크루아상(프레지덩버터)",price: 0, count: 1, soldOut: false, isSelect: true)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "아메리카노 선택(HOT/ICE)",
                                                       details: [DetailsModel(name: "(HOT)아메리카노", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "(ICE)아메리카노 +500원", price: 500, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "농도",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "연하게", price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "샷 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "2샷 추가 +1000원", price: 1000, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "프레지덩버터추가구매",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "프레지덩버터 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false)])],
                                  nutrition: NutritionModel(calorie: nil,
                                                            saturatedFat: nil,
                                                            sugars: nil,
                                                            natrium: nil,
                                                            protein: nil,
                                                            caffeine: nil),
                                  allergys: AllergyModel(names: nil),
                                  price: 4700,
                                  soldOut: false),
                       MenuModel2(imageName: "ICE-Lime Mojito",
                                  name: "잠봉버터블랙소금빵세트",
                                  description: "잠봉 버터 블랙소금빵 + 아메리카노",
                                  option: [OptionModel(essentialCount: 0,
                                                       header: "잠봉버터블랙소금빵 선택",
                                                       details: [DetailsModel(name: "잠봉버터블랙소금빵",price: 0, count: 1, soldOut: false, isSelect: true)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "아메리카노 선택(HOT/ICE)",
                                                       details: [DetailsModel(name: "(HOT)아메리카노", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "(ICE)아메리카노 +500원", price: 500, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "농도",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "연하게", price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "샷 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "2샷 추가 +1000원", price: 1000, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "잼/버터 추가 구매",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "쥬에그잼(딸기) +800원", price: 800, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "쥬에그잼(살구) +800원", price: 800, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "프레지덩버터 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false)])],
                                  nutrition: NutritionModel(calorie: nil,
                                                            saturatedFat: nil,
                                                            sugars: nil,
                                                            natrium: nil,
                                                            protein: nil,
                                                            caffeine: nil),
                                  allergys: AllergyModel(names: nil),
                                  price: 6900,
                                  soldOut: false),
                       MenuModel2(imageName: "ICE-MEGA Chocolate",
                                  name: "버터소금빵(쥬에그잼)세트",
                                  description: "버터소금빵 + 쥬에그잼 + (HOT)아메리카노 = 5,000원",
                                  option: [OptionModel(essentialCount: 0,
                                                       header: "버터소금빵 선택",
                                                       details: [DetailsModel(name: "버터소금빵(쥬에그잼)",price: 0, count: 1, soldOut: false, isSelect: true)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "아메리카노 선택(HOT/ICE)",
                                                       details: [DetailsModel(name: "(HOT)아메리카노", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "(ICE)아메리카노 +500원", price: 500, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "농도",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "연하게", price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "샷 추가 +500원", price: 500, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "2샷 추가 +1000원", price: 1000, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "기본 제공 잼 선택",
                                                       details: [DetailsModel(name: "쥬에그잼(딸기)", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "쥬에그잼(살구)", price: 0, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "잼 추가 구매",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "쥬에그잼(딸기) +800원", price: 800, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "쥬에그잼(살구) +800원", price: 800, count: 1, soldOut: false, isSelect: false)])],
                                  nutrition: NutritionModel(calorie: nil,
                                                            saturatedFat: nil,
                                                            sugars: nil,
                                                            natrium: nil,
                                                            protein: nil,
                                                            caffeine: nil),
                                  allergys: AllergyModel(names: nil),
                                  price: 5000,
                                  soldOut: false),
                       MenuModel2(imageName: "HOT-Coldbrew",
                                  name: "달콤한마카롱세트",
                                  description: "쿠키프라페 마카롱 2종, 퐁크러쉬 마카롱 2종, 유니콘프라페 마카롱2종으로 구성됩니다.",
                                  option: [OptionModel(essentialCount: 6,
                                                       header: "마카롱세트 구성(필수 6개 선택)",
                                                       details: [DetailsModel(name: "유니콘프라페마카롱",price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "쿠키프라페마카롱",price: 0, count: 1, soldOut: true, isSelect: false),
                                                                 DetailsModel(name: "퐁크러쉬마카롱",price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "바닐라마카롱",price: 0, count: 1, soldOut: true, isSelect: false),
                                                                 DetailsModel(name: "메카초코마카롱",price: 0, count: 1, soldOut: false, isSelect: false),
                                                                 DetailsModel(name: "딸기요거트마카롱",price: 0, count: 1, soldOut: false, isSelect: false)]),
                                           OptionModel(essentialCount: 0,
                                                       header: "마카롱박스포장",
                                                       details: [DetailsModel(name: "선택안함", price: 0, count: 1, soldOut: false, isSelect: true),
                                                                 DetailsModel(name: "(포장)마카롱박스 +500원", price: 500, count: 1, soldOut: false, isSelect: false)])],
                                  nutrition: NutritionModel(calorie: nil,
                                                            saturatedFat: nil,
                                                            sugars: nil,
                                                            natrium: nil,
                                                            protein: nil,
                                                            caffeine: nil),
                                  allergys: AllergyModel(names: nil),
                                  price: 12600,
                                  soldOut: false)
                       
               ])]


var recommendMenus = [
    RecommendMenuModel(image: UIImage(named: "HOT-Coldbrew")!, name: "떠먹는쿠키앤크림케이크", price: 3400, isSelect: false),
    RecommendMenuModel(image: UIImage(named: "HOT-Coldbrew")!, name: "몽쉘케이스", price: 5300, isSelect: false),
    RecommendMenuModel(image: UIImage(named: "HOT-Coldbrew")!, name: "말차스모어쿠키", price: 2900, isSelect: false),
]
