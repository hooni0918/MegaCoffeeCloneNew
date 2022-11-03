//
//  StoreMapTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
//

import UIKit
import MapKit

protocol StoreMapTableViewCellDelegate {
    func popupView(storeData: StoreModel)
}

class StoreMapTableViewCell: UITableViewCell {
    
    @IBOutlet var storeMapView: MKMapView!
    @IBOutlet var currentLocationButton: UIView!
    
    @IBOutlet var storeInfoView: UIView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    @IBOutlet var storeImageView: UIImageView!
    
    @IBOutlet var storeOffView: UIView!
    @IBOutlet var storeOffLabel: UILabel!
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var orderButton: UIButton!
    @IBOutlet var storeInfoViewHeight: NSLayoutConstraint!
    
    // 나중에 데이터 넣을때 수정
    var storeData: StoreModel?
    var delegate: StoreMapTableViewCellDelegate?
    
    var isTouch = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        configLayout()
        configStoreInfo()
        
    }
    
    func configLayout() {
        currentLocationButton.layer.cornerRadius = 0.5 * currentLocationButton.frame.height
        
        storeInfoView.layer.cornerRadius = 15
        storeInfoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        storeImageView.layer.cornerRadius = 0.5 * storeImageView.frame.height
        storeOffView.layer.cornerRadius = 0.5 * storeOffView.frame.height
        
        closeButton.layer.cornerRadius = 10
        orderButton.layer.cornerRadius = 10
        
        storeInfoViewHeight.constant = 0
    }
    
    func configStoreInfo() {
        //storeDatas.first 수정 필요(데이터 넣을때)
        if let storeData = storeDatas.first {
            nameLabel.text = storeData.name
            addressLabel.text = storeData.address
            distanceLabel.text = "\(storeData.distance)m"
            
            storeImageView.image = resizeImage(image: storeData.storeImage, newWidth: 100)
            
            nameLabel.alpha = storeData.isOn ? 1 : 0.5
            addressLabel.alpha = storeData.isOn ? 1 : 0.5
            distanceLabel.alpha = storeData.isOn ? 1 : 0.5
            
            storeOffView.isHidden = storeData.isOn ? true : false
            storeOffLabel.isHidden = storeData.isOn ? true : false
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func tapCurrentLocationButton(_ sender: Any) {
        isTouch.toggle()
        
        if isTouch {
            storeInfoViewHeight.constant = storeMapView.frame.height * 0.35
        } else {
            storeInfoViewHeight.constant = 0
        }
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        tapCurrentLocationButton(sender)
    }
    
    @IBAction func tapOrderButton(_ sender: Any) {
        // storeDatas 수정 필요(데이터 넣을때)
        delegate?.popupView(storeData: storeDatas[0])
    }
}


