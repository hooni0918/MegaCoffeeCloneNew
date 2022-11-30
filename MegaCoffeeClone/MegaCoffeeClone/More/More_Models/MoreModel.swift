//
//  MoreModel.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/09/29.
//

import Foundation


// MARK: [ Main Controller ]
struct MoreMainModel {
    // Section Header
    static var moreSectionHeader: [String] = ["멤버쉽","주문","새소식","약관 및 정책"]
    
    // 멤버쉽
    static var sectionList1 = ["스탬프","쿠폰"]
    
    // 주문
    static var sectionList2 = ["메가 오더","주문 내역","선물하기","메가선불카드","간편카드 관리","상품권 대량 구매 신청"]
     
    // 새소식
    static var sectionList3 = ["이벤트","공지사항"]
   
    // 약관 및 정책
    static var sectionList4 = ["이용약관"]
}


// MARK: [ Prepaid Card List Model ]
struct MorePrepaidCardListModel {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}



// MARK: [ SimpleCard Management Controller ]
struct CardModel {
    
}




