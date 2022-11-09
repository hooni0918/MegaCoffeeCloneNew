//
//  AdCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/10/08.
//

import UIKit

class MoreAdCollectionViewCell: UICollectionViewCell {
    static var identifier: String { return String(describing: self) }
    
    // MARK: [변수 선언]
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    
    
    
    // MARK: [init]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }

    
    
    // MARK: [Layout]
    private func layoutImageView() {
        self.addSubview(imageView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    
    func configure(image: String) {
        if let image = UIImage(named: image) {
            imageView.image = image
        }
    }
    
    
    
// MARK: [Cell End]
    
}

// MARK: [Cell End]
