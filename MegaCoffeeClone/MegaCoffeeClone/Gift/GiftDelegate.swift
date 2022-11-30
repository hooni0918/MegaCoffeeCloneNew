//
//  GiftPopupDelegate.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/18.
//

import Foundation

protocol PopupDelegate {
    func goShoppingButtonClicked()
}


protocol CanCelDelegate {
    func cancelClicked(index: Int)
}

protocol GoToPaymentView {
    func orderClicked()
}
