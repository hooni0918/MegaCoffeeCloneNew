//
//  UIViewController+Alert.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/11/01.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    
    func alert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let callImage = UIImage(systemName: "phone.fill")
        let call = UIAlertAction(title: "       통화 1588-8298", style: .default, handler: nil)
        // hander가 이걸 눌렀을 때 실행할 함수를 넣는거라고 함.
        call.setValue(callImage, forKey: "image")
        call.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        // 이미지 변경 및, 텍스트 위치 변경

        
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(call)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
}
