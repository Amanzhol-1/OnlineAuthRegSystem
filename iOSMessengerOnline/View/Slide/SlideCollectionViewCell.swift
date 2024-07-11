//
//  SlideCollectionViewCell.swift
//  iOSMessengerOnline
//
//  Created by Молтабаров Аманжол on 30.06.2024.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    
    static let reuceId = "SlideCollectionViewCell"

    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var regBtn: UIButton!
    @IBOutlet weak var authBtn: UIButton!
    var delegate: LoginViewControllerDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(slide: Slides){
        slideImage.image = slide.image
        descriptionText.text = slide.text
        if slide.id == 3 {
            regBtn.isHidden = false
            authBtn.isHidden = false
        }
    }
    
    @IBAction func regBtnClick(_ sender: Any) {
        delegate.openRegVC()
    }
    @IBAction func authBtnClick(_ sender: Any) {
        delegate.openAuthVC()
    }
}
