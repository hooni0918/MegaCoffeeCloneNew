//
//  MemberInformationManagementTableViewCell.swift
//  MegaTest
//
//  Created by 김성호 on 2022/11/04.
//

import Foundation
import UIKit

class MoreMemberInfoManagementTableViewCell: UITableViewCell {
    static var identifier: String { return String(describing: self) }
    
    lazy var nickNameLabel: UILabel = {
        let nick = UILabel()
        
        //nick.text = "닉네임"
        //nick.tintColor = .black
        
        return nick
    }()
    
    lazy var birthday: UILabel = {
       let birth = UILabel()
        return birth
    }()
    
    lazy var bye: UILabel = {
        let bye = UILabel()
        return bye
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
          fatalError("")
      }
    
    
    
    
    // MARK: [Layout]
    private func layout() {
        
    }
    
   
    
    
}




